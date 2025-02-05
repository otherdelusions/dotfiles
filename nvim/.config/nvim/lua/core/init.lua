vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set termguicolors")
vim.cmd("set number")
vim.cmd("set cursorline cursorlineopt=number")
vim.cmd("syntax on")

vim.api.nvim_create_autocmd("ExitPre", {
  group = vim.api.nvim_create_augroup("Exit", { clear = true }),
  command = "set guicursor=a:ver90"
})

vim.opt.fillchars = { eob = " " }

vim.g.mapleader = " "

vim.opt.relativenumber = true
vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff = 6

vim.opt.updatetime = 50
vim.diagnostic.config({ update_in_insert = true })
