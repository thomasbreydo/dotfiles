-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.clipboard = nil -- override default; don't sync with system clipboard

vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.spell = true -- Enable spellcheck
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting

vim.opt.listchars:append({
	tab = "> ",
	trail = "·",
	nbsp = "·",
})

-- VimTeX
vim.g.vimtex_view_method = "skim"
vim.g.vimtex_view_skim_sync = 1 -- allows forward search after every successful compilation
vim.g.vimtex_quickfix_mode = 0  -- DON'T set to 1. When quickfix is auto-opened, it breaks UltiSnips \(\) completion.

-- UltiSnips
vim.g.UltiSnipsExpandTrigger = "<enter>"
vim.g.UltiSnipsJumpForwardTrigger = "<tab>"
vim.g.UltiSnipsJumpBackwardTrigger = "<s-tab>"

-- Python
vim.g.python3_host_prog = "/Users/thomasbreydo/.pyenv/versions/neovim-venv/bin/python"
