#!/usr/bin/env bash
exec > /tmp/sesh-debug.log 2>&1
set -x

# Run background indexing
(fd -H -t d -g ".git" "$HOME/Desktop/projects" -E node_modules -E .venv -E venv -E vendor -E target -E build -E dist -E .cache -x zoxide add "{//}" >/dev/null 2>&1 &)

res=$(sesh list -tcz --icons | awk '{
  clean_name = $0
  # Remove ANSI codes for the clean_name to ensure exact matching
  gsub(/\x1b\[[0-9;]*m/, "", clean_name)
  # Remove the icon (first word) and spaces
  gsub(/^[^ ]+ +/, "", clean_name)

  if ($0 ~ /\//) {
    n = split(clean_name, a, "/")
    if (n >= 2) {
      print $1 " " a[n-1] "/" a[n] "\t" clean_name
    } else {
      print $0 "\t" clean_name
    }
  } else {
    print $0 "\t" clean_name
  }
}' | fzf-tmux -p 60%,70% \
  --no-sort --ansi --border-label " projectile " --prompt "  " \
  --with-nth 1 \
  --delimiter "\t" \
  --bind "tab:down,btab:up" \
  --bind "ctrl-j:down,ctrl-k:up" | awk -F"\t" '{print $2}')

if [ -n "$res" ]; then
  sesh connect "$res"
fi