return {
	-- {
	-- 	"gen740/SmoothCursor.nvim",
	-- 	event = "CursorMoved",
	-- 	opts = {
	-- 		fancy = {
	-- 			enable = true,
	-- 			head = { cursor = "", texthl = "SmoothCursor", linehl = nil },
	-- 		},
	-- 	},
	-- },
	-- {
	-- 	"sphamba/smear-cursor.nvim",
	-- 	opts = {
	-- 		cursor_color = "#ff8800",
	-- 		stiffness = 0.3,
	-- 		trailing_stiffness = 0.1,
	-- 		trailing_exponent = 5,
	-- 		hide_target_hack = true,
	-- 		gamma = 1,
	-- 	},
	-- },
	{
		"lewis6991/gitsigns.nvim",
		enabled = false,
		cond = function()
			local git_dir = vim.fn.finddir(".git", vim.fn.getcwd() .. ";")
			if git_dir ~= "" then
				return true
			else
				return false
			end
		end,
		event = "BufEnter",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "┃" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
			numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
			linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
			word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
			watch_gitdir = {
				interval = 1000,
				follow_files = true,
			},
			attach_to_untracked = true,
			current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
				delay = 1000,
				ignore_whitespace = false,
			},
			current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
			sign_priority = 6,
			update_debounce = 100,
			status_formatter = nil, -- Use default
			max_file_length = 40000, -- Disable if file is longer than this (in lines)
			preview_config = {
				-- Options passed to nvim_open_win
				border = "single",
				style = "minimal",
				relative = "cursor",
				row = 0,
				col = 1,
			},
		},
	},
}
