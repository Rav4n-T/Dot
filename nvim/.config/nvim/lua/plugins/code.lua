return {
	{
		"yioneko/nvim-vtsls",
		ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
		config = function(_, opts)
			require("vtsls").config(opts)
			require("utils.lsp").setVtsls()
		end,
	},
}
