vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set clipboard+=unnamedplus")
vim.cmd("set ignorecase")
vim.cmd("cmap w!! w !pkexec tee %")
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.keymap.set('t', '<C-w>h', "<C-\\><C-n><C-w>h",{silent = true})
