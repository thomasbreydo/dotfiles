-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Returns focus to alacritty after vimtex reverse search
-- Source: https://www.ejmastnak.com/tutorials/vim-latex/pdf-reader/#refocus-nvim-macos-inverse
-- Note: I just surrounded the site's vimscript with vim.cmd([[ ... ]]) to avoid rewriting in lua
vim.cmd([[
  function! s:TexFocusVim() abort
    silent execute "!open -a Alacritty"
    redraw!
  endfunction

  augroup vimtex_event_focus
    au!
    au User VimtexEventViewReverse call s:TexFocusVim()
  augroup END
]])

-- Automatically run \lc when exiting
vim.cmd([[
  augroup vimtex_config
    autocmd!
    autocmd User VimtexEventQuit call vimtex#latexmk#clean(0)
  augroup END
]])
