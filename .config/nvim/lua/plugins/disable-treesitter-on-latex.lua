-- Disable treesitter for LaTeX files, since it's handled by vimtex

return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = { ignore_install = { "latex" } },
	},
}
