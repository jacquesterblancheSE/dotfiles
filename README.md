# Lean Dotfiles (On-Prem / Linux Node Edition)

My dotfiles for NVIM setup, aimed at being quite lean to easily run on external Linux nodes (main target).

---

## Installation

Simply clone this repository to your remote node and use a tool like `stow` or `cp` to link/copy the configurations into your `~/.config/` and `~/` directories.

```bash
cp -r nvim/.config/nvim ~/.config/
cp -r tmux/.config/tmux ~/.config/
cp zsh/.zshrc ~/
# OR if you prefer bash:
cp bash/.bashrc ~/
```

## Setting Up Language Servers (LSP)

Because this setup is lean, Neovim does not download LSPs for you. It relies entirely on your system's `$PATH`. 

### For Linux (RHEL 8 / Fedora)
We have provided a convenient setup script that installs all the required LSPs (`lua-language-server`, `pyright`, `ruff`, `terraform-ls`, `tflint`, and `vscode-json-language-server`) globally or into your user binaries directory.

To run it:
```bash
./setup_lsp.sh
```

### For macOS / Homebrew (Alternative)
If you decide to run this configuration on a system with Homebrew, you can install the exact same dependencies using:

```bash
brew install lua-language-server pyright ruff terraform-ls tflint
npm install -g vscode-langservers-extracted
```

## PATH Requirements
The LSPs must be accessible via your terminal's `$PATH`. 
The included `.zshrc` automatically adds `~/bin` to your path, which is where the `setup_lsp.sh` script symlinks the `lua-language-server`. Python's `pip` installs `ruff` into `~/.local/bin`, so make sure that is also in your `$PATH`.
