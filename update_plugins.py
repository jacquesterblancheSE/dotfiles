import os
import glob
import re

files = glob.glob('nvim/.config/nvim/plugin/*.lua')

for f in files:
    with open(f, 'r') as file:
        content = file.read()
        
    # Replace simple strings in vim.pack.add
    # e.g. vim.pack.add({ 'https://...' }) -> vim.pack.add({ { src = 'https://...', version = vim.version.range('*') } })
    
    # We can do this with regex, but need to be careful with diff-view which has multiple entries
    
    # Let's just manually replace or use a robust regex
