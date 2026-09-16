#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "Starting LSP installation for RHEL 8..."

# 1. Ensure basic tools and dependencies are installed
echo "--> Installing base dependencies (requires sudo)..."
sudo dnf install -y epel-release || true
sudo dnf install -y curl wget unzip tar dnf-plugins-core python3-pip nodejs npm

# 2. Install Node-based LSPs (pyright, vscode-json-language-server)
echo "--> Installing Node-based LSPs..."
sudo npm install -g pyright vscode-langservers-extracted

# 3. Install Python-based LSPs (ruff)
echo "--> Installing Python-based LSPs..."
pip3 install --user ruff

# 4. Install Terraform tools (terraform-ls, tflint)
echo "--> Installing terraform-ls..."
sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo dnf install -y terraform-ls

echo "--> Installing tflint..."
curl -s https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash

# 5. Install Lua Language Server
echo "--> Installing lua-language-server..."
LUA_LS_VERSION="3.10.6"
mkdir -p /tmp/lua-ls
wget -qO /tmp/lua-ls.tar.gz "https://github.com/LuaLS/lua-language-server/releases/download/${LUA_LS_VERSION}/lua-language-server-${LUA_LS_VERSION}-linux-x64.tar.gz"
tar -xzf /tmp/lua-ls.tar.gz -C /tmp/lua-ls

# Store the binaries in ~/.local/share and link to ~/bin (which is in our lean .zshrc PATH)
mkdir -p ~/.local/share/lua-language-server
mkdir -p ~/bin
rm -rf ~/.local/share/lua-language-server/*
cp -r /tmp/lua-ls/* ~/.local/share/lua-language-server/
ln -sf ~/.local/share/lua-language-server/bin/lua-language-server ~/bin/lua-language-server

rm -rf /tmp/lua-ls /tmp/lua-ls.tar.gz

echo "========================================"
echo "✅ LSP Installation Complete!"
echo "Ensure ~/bin and ~/.local/bin are in your PATH."
echo "========================================"
