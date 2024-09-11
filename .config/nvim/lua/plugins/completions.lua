-- WARNING:
-- DO NOT MANUALLY MODIFY THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING.
--
-- This file currently makes ctrl + j/k the method to gob between autosuggestions
--
-- Before, I had "Supertab Recipe" (linked below), but it conflicts with tabbing between placeholders
-- which I do often in Ultisnips.
-- https://www.lazyvim.org/configuration/recipes#supertab

return {
	{
		"hrsh7th/nvim-cmp",
		opts = function(_, opts)
			local cmp = require("cmp")
			opts.mapping = vim.tbl_extend("force", opts.mapping, {
				["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
			})
		end,
	},
}
