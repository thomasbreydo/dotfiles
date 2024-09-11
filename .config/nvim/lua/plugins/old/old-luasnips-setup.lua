return {
	-- -- ENABLE AUTOSNIPS (IN PREPARATION FOR LATEX SNIPS BELOW)
	-- {
	-- 	"L3MON4D3/LuaSnip",
	-- 	opts = {
	-- 		enable_autosnippets = true,
	-- 	},
	-- },

	-- DISABLE FRIENDLY-SNIPPETS FOR LATEX
	-- {
	-- 	"rafamadriz/friendly-snippets",
	-- 	enabled = false,
	-- },

	-- USE THE FOLLOWING PORT OF GILLES CASTEL'S SNIPPETS (HTTPS://CASTEL.DEV/):
	-- https://github.com/iurimateus/luasnip-latex-snippets.nvim
	-- {
	-- 	"iurimateus/luasnip-latex-snippets.nvim",
	-- 	-- vimtex isn't required if using treesitter
	-- 	dependencies = { "L3MON4D3/LuaSnip", "lervag/vimtex" },
	-- 	init = function()
	-- 		require("luasnip-latex-snippets").setup()
	-- 	end,
	-- },
}
