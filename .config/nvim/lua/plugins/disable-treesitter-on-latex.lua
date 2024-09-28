-- Disable treesitter for LaTeX files, since it's handled by vimtex

return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			table.insert(opts.ignore_install, "latex")
			return opts
		end,
	},
}
