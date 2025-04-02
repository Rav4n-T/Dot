return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		enabled = false,
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		keys = {
			{
				"<leader>e",
				function()
					require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
				end,
				desc = "Explorer NeoTree (cwd)",
			},
		},
		deactivate = function()
			vim.cmd([[Neotree close]])
		end,
		config = function()
			require("neo-tree").setup({
				close_if_last_window = false,
				enable_git_status = true,
				enable_diagnostics = true,
				filesystem = {
					bind_to_cwd = true,
					follow_current_file = {
						enabled = true,
					},
				},
				window = {
					width = 30,
					mappings = {
						["<space>"] = "none",
						["l"] = "open",
						["L"] = "focus_preview",
						["s"] = "open_split",
						["S"] = "open_vsplit",
					},
				},
				default_component_configs = {
					indent = {
						with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
						expander_collapsed = "",
						expander_expanded = "",
						expander_highlight = "NeoTreeExpander",
					},
					modified = {
						symbol = "󰣕 ",
						highlight = "NeoTreeModified",
					},
					name = {
						trailing_slash = false,
						use_git_status_colors = false,
						highlight = "NeoTreeFileName",
					},
					diagnostics = {
						symbols = {
							error = " ",
							warn = " ",
							hint = " ",
							info = " ",
						},
					},
					git_status = {
						symbols = {
							-- Change type
							added = " ",
							modified = " ",
							removed = " ",
							deleted = "󰆴 ",
							-- Status type
							untracked = "",
							ignored = "",
							unstaged = "󰄱",
							staged = "",
							conflict = "",
						},
					},
				},
			})
		end,
	},

	{
		"nvim-tree/nvim-tree.lua",
		keys = {
			{
				"<leader>e",
				function()
					require("nvim-tree.api").tree.toggle({ path = vim.uv.cwd() })
				end,
				desc = "Explorer NvimTree (cwd)",
			},
		},
		config = function()
			local function my_on_attach(bufnr)
				local api = require("nvim-tree.api")

				local function opts(desc)
					return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
				end

				-- default mappings
				api.config.mappings.default_on_attach(bufnr)

				-- custom mappings
				vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
				vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts("Up"))
				vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
			end

			require("nvim-tree").setup({
				on_attach = my_on_attach,
				sort = {
					sorter = "case_sensitive",
				},
				view = {
					width = 30,
				},
				renderer = {
					hidden_display = "all",
					group_empty = true,
					icons = {
						git_placement = "right_align",
						glyphs = {
							modified = "󰣕 ",
							git = {
								untracked = "",
								ignored = "",
								unstaged = "",
								staged = "",
							},
						},
					},
				},
				git = {
					show_on_open_dirs = false,
				},
				modified = {
					enable = true,
					show_on_open_dirs = false,
				},
				filters = {

					dotfiles = true,
				},
			})
		end,
	},
}
