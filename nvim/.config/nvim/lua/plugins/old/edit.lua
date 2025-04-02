return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {
			fast_wrap = {
				map = "<C-e>",
				chars = { "{", "[", "(", '"', "'", "`" },
				pattern = [=[[%'%"%>%]%)%}%,]]=],
				end_key = "j",
				before_key = "h",
				after_key = "l",
				cursor_pos_before = false,
				keys = "qwertyuiopzxcvbnmasdfghjkl",
				manual_position = true,
				highlight = "Search",
				highlight_grey = "Comment",
			},
		},
		-- config = true,
		-- use opts = {} for passing setup options
		-- this is equalent to setup({}) function
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {
			fast_wrap = {
				map = "<C-e>",
				chars = { "{", "[", "(", '"', "'", "`" },
				pattern = [=[[%'%"%>%]%)%}%,]]=],
				end_key = "j",
				before_key = "h",
				after_key = "l",
				cursor_pos_before = false,
				keys = "qwertyuiopzxcvbnmasdfghjkl",
				manual_position = true,
				highlight = "Search",
				highlight_grey = "Comment",
			},
		},
		-- config = true,
		-- use opts = {} for passing setup options
		-- this is equalent to setup({}) function
	},
	{
		"echasnovski/mini.surround",
		version = false,
		event = "InsertEnter",
		config = function()
			require("mini.surround").setup()
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
