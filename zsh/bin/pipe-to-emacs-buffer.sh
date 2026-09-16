#!/bin/bash

# 1. Base64 encode standard input immediately
input=$(base64 | tr -d '\n')

# 2. Determine the buffer name
if [ -n "$1" ]; then
  buf_name="$1"
else
  pgid=$(ps -o pgid= -p $$ 2>/dev/null | tr -d ' ')
  if [ -n "$pgid" ]; then
    cmd_name=$(ps -o comm= -g "$pgid" 2>/dev/null | grep -v -E "bash|zsh|sh|ps|pipe-to-emacs|emacsb" | head -n 1 | awk '{print $1}')
  fi
  if [ -z "$cmd_name" ]; then
    cmd_name="scratch"
  fi
  rand_id=$(printf "%04d" $((RANDOM % 10000)))
  buf_name="pipe-${cmd_name}-${rand_id}"
fi

# 3. Send to Emacs, scan the content, and load the correct mode
emacsclient --eval '
(with-current-buffer (get-buffer-create "'"$buf_name"'")
  (erase-buffer)
  (insert (base64-decode-string "'"$input"'"))
  
  ;; CONTENT DETECTION (Just like Neovim does)
  (goto-char (point-min))
  (cond
   ;; If it looks like a git/standard diff, turn on diff-mode
   ((looking-at "^\\(diff --git\\|--- \\|@@ [-+]\\)") 
    (diff-mode))
   ;; If it looks like JSON, turn on json/js mode
   ((looking-at "^\\s-*[\\[{]") 
    (if (fboundp (quote json-mode)) (json-mode) (js-mode)))
   ;; Default fallback
   (t (text-mode)))

  ;; ENFORCE PREFERENCES (Must happen AFTER the mode switch resets the buffer)
  (read-only-mode -1)                                                 ; Keeps it editable
  (set-buffer-modified-p nil)                                         ; Allows instant kill
  (local-set-key [remap kill-this-buffer] (quote kill-current-buffer)) ; Fixes SPC b k
  (switch-to-buffer (current-buffer)))' > /dev/null
