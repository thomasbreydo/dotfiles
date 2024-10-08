return {
	{
		"Exafunction/codeium.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",
		},
		config = function()
			require("codeium").setup({})
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		opts = function(_, opts)
			local cmp = require("cmp")
			opts.sources = cmp.config.sources({
				{ name = "codeium" },
			})
		end,
	},
}
