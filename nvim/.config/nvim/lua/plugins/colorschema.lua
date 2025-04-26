return {
	{
		"neanias/everforest-nvim",
		event = "VeryLazy",
		priority = 1000, -- make sure to load this before all the other start plugins
		-- Optional; default configuration will be used if setup isn't called.
		config = function()
			require("everforest").setup({
				on_highlights = function(hl, palette)
					hl.DiagnosticError = { fg = palette.none, bg = palette.none, sp = palette.red }
					hl.DiagnosticWarn = { fg = palette.none, bg = palette.none, sp = palette.yellow }
					hl.DiagnosticInfo = { fg = palette.none, bg = palette.none, sp = palette.blue }
					hl.DiagnosticHint = { fg = palette.none, bg = palette.none, sp = palette.green }
					hl.TSBoolean = { fg = palette.purple, bg = palette.none, bold = true }
				end,
				background = "soft",
				transparent_background_level = 2,
				italics = true,
				disable_italic_comments = false,
				sign_column_background = "none",
				ui_contrast = "high",
				dim_inactive_windows = false,
				diagnostic_text_highlight = false,
				diagnostic_virtual_text = "coloured",
				diagnostic_line_highlight = true,
				spell_foreground = true,
				show_eob = true,
			})
		end,
	},
	{
		"sainnhe/gruvbox-material",
		event = "VeryLazy",
		priority = 1000,
		config = function()
			-- Optionally configure and load the colorscheme
			-- directly inside the plugin declaration.
			vim.g.gruvbox_material_enable_italic = true
			vim.g.gruvbox_material_enable_bold = true
			vim.g.gruvbox_material_foreground = "original" -- "material" | "mix" | "original"
			vim.g.gruvbox_material_transparent_background = 2
			vim.cmd.colorscheme("gruvbox-material")
		end,
	},
}
