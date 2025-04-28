return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = "VeryLazy",
		dependencies = {
			-- { "HiPhish/rainbow-delimiters.nvim" },
			{ "nvim-treesitter/nvim-treesitter-textobjects" },
		},
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")
			---@diagnostic disable-next-line missing-fields
			configs.setup({
				ensure_installed = "all",
				highlight = {
					enable = true,
					disable = function(_, buf) -- first args is lang
						local max_filesize = 50 * 1024
						local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
						if ok and stats and stats.size > max_filesize then
							return true
						end
					end,
				},
				indent = {
					enable = true,
				},
				textobjects = {
					select = {
						enable = true,

						-- Automatically jump forward to textobj, similar to targets.vim
						lookahead = true,

						keymaps = {
							-- You can use the capture groups defined in textobjects.scm
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							-- You can optionally set descriptions to the mappings (used in the desc parameter of
							-- nvim_buf_set_keymap) which plugins like which-key display
							["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
							-- You can also use captures from other query groups like `locals.scm`
							["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
						},
					},
				},
			})
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		ft = { "javascript", "javascriptreact", "typescript", "typescriptreact", "html" },
		config = true,
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
		config = function(_, opts)
			local npairs = require("nvim-autopairs")
			local autopair_utils = require("utils.autopair")
			npairs.setup(opts)
			autopair_utils.autospace()
			autopair_utils.jsarrow()
			autopair_utils.generics()
		end,
	},
	{
		"echasnovski/mini.surround",
		version = false,
		event = "InsertEnter",
		config = function()
			require("mini.surround").setup()
		end,
	},

	-- Comment
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		ft = { "javascript", "javascriptreact", "typescript", "typescriptreact", "html", "vue" },
		lazy = true,
		config = function()
			local tcc = require("ts_context_commentstring")
			local tcc_internal = require("ts_context_commentstring.internal")

			tcc.setup({
				enable_autocmd = false,
			})

			local orig_get_option = vim.filetype.get_option
			local custom_get_option = function(filetype, option)
				return option == "commentstring" and tcc_internal.calculate_commentstring()
					or orig_get_option(filetype, option)
			end
			vim.filetype.get_option = custom_get_option
		end,
	},

	-- Format
	{
		"stevearc/conform.nvim",
		event = "InsertLeave",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				c = { "clang_format" },
				cpp = { "clang_format" },
				java = { "clang_format" },
				rust = { "rustfmt" },
				go = { "goimports-reviser" },
				python = function(bufnr)
					if require("conform").get_formatter_info("ruff_format", bufnr).available then
						return { "ruff_format" }
					else
						return { "isort", "black" }
					end
				end,
				javascript = { "prettier" },
				typescript = { "prettier" },
				vue = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				less = { "prettier" },
				scss = { "prettier" },
				json = { "prettier" },
				jsonc = { "prettier" },
				markdown = { "prettier" },
				yaml = { "prettier" },
				sql = { "sqlfmt" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = false,
			},
		},

		init = function()
			local map = vim.keymap.set
			local create_command = vim.api.nvim_create_user_command
			-- create user command
			create_command("Format", function(args)
				local range = nil
				if args.count ~= -1 then
					local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
					range = {
						start = { args.line1, 0 },
						["end"] = { args.line2, end_line:len() },
					}
				end
				require("conform").format({ async = true, lsp_fallback = true, range = range })
			end, { range = true })
			-- Format
			map("v", "<leader>f", "<cmd>Format<cr>", { desc = "format current selection", remap = true, silent = true })
			map("n", "<leader>af", "<cmd>Format<cr>", { desc = "format current file", remap = true, silent = true })
		end,
	},
	{
		"jake-stewart/multicursor.nvim",
		event = "VeryLazy",
		branch = "1.0",
		config = function()
			local mc = require("multicursor-nvim")
			mc.setup()

			local map = vim.keymap.set

			-- Disable and enable cursors.
			map({ "n", "x" }, "<leader>tm", mc.toggleCursor, { desc = "toggle cursor" })

			-- Mappings defined in a keymap layer only apply when there are
			-- multiple cursors. This lets you have overlapping mappings.
			mc.addKeymapLayer(function(layerSet)
				-- Add or skip cursor above/below the main cursor.
				layerSet({ "n", "x" }, "<up>", function()
					mc.lineAddCursor(-1)
				end, { desc = "add up line cursor" })
				layerSet({ "n", "x" }, "<down>", function()
					mc.lineAddCursor(1)
				end, { desc = "add down line cursor" })
				layerSet({ "n", "x" }, "Q", function()
					mc.lineSkipCursor(-1)
				end, { desc = "skip up line cursor" })
				layerSet({ "n", "x" }, "q", function()
					mc.lineSkipCursor(1)
				end, { desc = "skip down line cursor" })

				-- Add or skip adding a new cursor by matching word/selection
				layerSet({ "n", "x" }, "n", function()
					mc.matchAddCursor(1)
				end, { desc = "add down match cursor" })
				layerSet({ "n", "x" }, "q", function()
					mc.matchSkipCursor(1)
				end, { desc = "skip down match cursor" })
				layerSet({ "n", "x" }, "N", function()
					mc.matchAddCursor(-1)
				end, { desc = "add up match cursor" })
				layerSet({ "n", "x" }, "Q", function()
					mc.matchSkipCursor(-1)
				end, { desc = "skip up match cursor" })

				-- Add and remove cursors with control + left click.
				layerSet("n", "<c-leftmouse>", mc.handleMouse)
				layerSet("n", "<c-leftdrag>", mc.handleMouseDrag)
				layerSet("n", "<c-leftrelease>", mc.handleMouseRelease)

				layerSet({ "n", "x" }, "m", mc.toggleCursor, { desc = "toggle cursor" })
				-- Select a different cursor as the main one.
				layerSet({ "n", "x" }, "<left>", mc.prevCursor, { desc = "select prev cursor" })
				layerSet({ "n", "x" }, "<right>", mc.nextCursor, { desc = "select next cursor" })

				-- Delete the main cursor.
				-- layerSet({ "n", "x" }, "<leader>mx", mc.deleteCursor, { desc = "del cursor" })

				-- Enable and clear cursors using escape.
				layerSet("n", "<esc>", function()
					if not mc.cursorsEnabled() then
						mc.enableCursors()
					else
						mc.clearCursors()
					end
				end)
			end)

			-- Customize how cursors look.
			local hl = vim.api.nvim_set_hl
			hl(0, "MultiCursorCursor", { link = "Cursor" })
			hl(0, "MultiCursorVisual", { link = "Visual" })
			hl(0, "MultiCursorSign", { link = "SignColumn" })
			hl(0, "MultiCursorMatchPreview", { link = "Search" })
			hl(0, "MultiCursorDisabledCursor", { link = "Visual" })
			hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
			hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
		end,
	},
}
