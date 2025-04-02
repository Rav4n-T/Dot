local M = {
	{
		"saghen/blink.cmp",
		-- optional: provides snippets for the snippet source

		event = { "InsertEnter" },
		dependencies = {
			-- { "luozhiya/fittencode.nvim" },
			{ dir = "~/Projectes/Git/fittencode.nvim" },
		},
		-- use a release tag to download pre-built binaries
		version = "1.*",
		-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
		-- build = 'cargo build --release',

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = {
				preset = "none",
				["<C-e>"] = { "show", "hide", "fallback" },
				["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
				["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
				["<Up>"] = { "select_prev", "fallback" },
				["<Down>"] = { "select_next", "fallback" },
				["<cr>"] = { "accept", "fallback" },
			},

			appearance = {
				nerd_font_variant = "mono",
				kind_icons = require("config.options").icons.kind_icons,
			},

			completion = {
				list = {
					selection = {
						preselect = false,
						auto_insert = true,
					},
				},
				menu = {
					auto_show = true,
					scrollbar = false,
					draw = {
						columns = {
							{ "kind_icon" },
							-- { "label", "label_description", gap = 2 },
							{ "label", gap = 2 },
							-- { "kind", "source_name", gap = 2 },
							{ "source_name", gap = 1 },
						},
					},
				},
				documentation = {
					auto_show = true,
					window = {
						scrollbar = false,
					},
				},
			},

			-- Default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, due to `opts_extend`
			sources = {
				default = function()
					local success, node = pcall(vim.treesitter.get_node)
					if
						success
						and node
						and vim.tbl_contains({ "comment", "line_comment", "block_comment" }, node:type())
					then
						return { "buffer", "fittencode" }
					else
						return { "lsp", "path", "snippets", "buffer", "fittencode" }
					end
				end,

				providers = {
					lsp = {
						min_keyword_length = 1,
						score_offset = 4,
					},
					path = {
						score_offset = 2,
						opts = {
							get_cwd = function(_)
								return vim.fn.getcwd()
							end,
						},
					},
					snippets = {
						min_keyword_length = 2,
						score_offset = 5,
					},
					buffer = {
						min_keyword_length = 2,
						score_offset = 3,
					},
					fittencode = {
						name = "FC",
						min_keyword_length = 2,
						module = "fittencode.sources.blink",
						score_offset = 8,
					},
				},
			},

			-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
			-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
			-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
			--
			-- See the fuzzy documentation for more information
			fuzzy = {
				implementation = "rust",
				sorts = {
					"exact",
					"score",
					"sort_text",
				},
			},

			cmdline = {
				completion = {
					list = {
						selection = {
							preselect = false,
							auto_insert = true,
						},
					},
					menu = { auto_show = true },
					ghost_text = { enabled = false },
				},
			},
		},
		opts_extend = { "sources.default" },
	},
}

return M
