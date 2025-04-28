return {
	{
		dir = "~/Projectes/Git/autoclose.nvim",
		-- "m4xshen/autoclose.nvim",
		event = "VeryLazy",
		config = function()
			require("autoclose").setup({
				options = {
					disabled_filetypes = { "text" },
					disable_when_touch = true,
					touch_regex = "[%w%[{]",
					pair_spaces = true,
					disable_command_mode = false,
				},
			})
		end,
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "BufEnter",
		config = function()
			require("nvim-surround").setup({})
		end,
	},
	{
		"mg979/vim-visual-multi",
		branch = "master",
		event = "VeryLazy",
		init = function()
			vim.g.VM_set_statusline = 0
			-- vim.schedule(function()
			vim.g.VM_maps = {
				["I BS"] = "",
				["Goto Next"] = "]v",
				["Goto Prev"] = "[v",
				["I CtrlB"] = "<M-b>",
				["I CtrlF"] = "<M-f>",
				["I Return"] = "<S-CR>",
				["I Down Arrow"] = "",
				["I Up Arrow"] = "",
			}
		end,
	},
}
