return {
	-- {
	-- 	"askfiy/http-client.nvim",
	-- 	ft = { "http" },
	-- 	config = function()
	-- 		local map = vim.keymap.set
	-- 		local http = require("http-client")
	--
	-- 		http.setup({})
	--
	-- 		map("n", "<leader>hr", "<cmd>HttpClient sendRequest<cr>", { desc = "runs the current request" })
	-- 	end,
	-- },
	{
		"mistweaverco/kulala.nvim",
		-- keys = {
		-- 	{ "<leader>Rs", desc = "Send request" },
		-- 	{ "<leader>Ra", desc = "Send all requests" },
		-- 	{ "<leader>Rb", desc = "Open scratchpad" },
		-- },
		ft = { "http", "rest" },
		opts = {
			-- your configuration comes here
			global_keymaps = true,
			-- global_keymaps = {
			-- 	["Send request"] = { -- sets global mapping
			-- 		"<leader>rs",
			-- 		function()
			-- 			require("kulala").run()
			-- 		end,
			-- 		mode = { "n", "v" }, -- optional mode, default is n
			-- 		desc = "Send request", -- optional description, otherwise inferred from the key
			-- 	},
			-- 	["Send all requests"] = {
			-- 		"<leader>ra",
			-- 		function()
			-- 			require("kulala").run_all()
			-- 		end,
			-- 		mode = { "n", "v" },
			-- 		ft = "http", -- sets mapping for *.http files only
			-- 	},
			-- 	["Replay the last request"] = {
			-- 		"<leader>rr",
			-- 		function()
			-- 			require("kulala").replay()
			-- 		end,
			-- 		ft = { "http", "rest" }, -- sets mapping for specified file types
			-- 	},
			-- 	["Find request"] = false, -- set to false to disable
			-- },
		},
	},
}
