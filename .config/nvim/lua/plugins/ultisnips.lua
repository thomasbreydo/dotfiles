return {
	{
		"L3MON4D3/LuaSnip",
		enabled = false,
	},

	{
		"rafamadriz/friendly-snippets",
		enabled = false,
	},

	{
		"SirVer/ultisnips",
		dependencies = {
			"honza/vim-snippets",
		},
		-- NOTE:
		-- Use open a .cpp file and :UltiSnipsEdit to open cpp snips
		-- OR
		-- Open ~/.local/share/nvim/lazy/vim-snippets/UltiSnips/cpp.snippets
	},

	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"quangnguyen30192/cmp-nvim-ultisnips",
			{ "saadparwaiz1/cmp_luasnip", enabled = false },
		},
		opts = function(_, opts)
			-- NOTE: edit tab/shift-tab binds in lua/config/options
			local cmp = require("cmp")
			opts.snippet = {
				expand = function(args)
					vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
				end,
			}
			opts.sources = cmp.config.sources({
				{ name = "ultisnips" },
				{ name = "buffer" },
				{ name = "path" },
				{ name = "codeium" },
			})
		end,
	},
}
