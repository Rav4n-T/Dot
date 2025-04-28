local M = {}

local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")
local cond = require("nvim-autopairs.conds")

M.autospace = function()
	local brackets = { { "(", ")" }, { "[", "]" }, { "{", "}" } }
	npairs.add_rules({
		-- Rule for a pair with left-side ' ' and right side ' '
		Rule(" ", " ")
			-- Pair will only occur if the conditional function returns true
			:with_pair(function(opts)
				-- We are checking if we are inserting a space in (), [], or {}
				local pair = opts.line:sub(opts.col - 1, opts.col)
				return vim.tbl_contains({
					brackets[1][1] .. brackets[1][2],
					brackets[2][1] .. brackets[2][2],
					brackets[3][1] .. brackets[3][2],
				}, pair)
			end)
			:with_move(cond.none())
			:with_cr(cond.none())
			-- We only want to delete the pair of spaces when the cursor is as such: ( | )
			:with_del(function(opts)
				local col = vim.api.nvim_win_get_cursor(0)[2]
				local context = opts.line:sub(col - 1, col + 2)
				return vim.tbl_contains({
					brackets[1][1] .. "  " .. brackets[1][2],
					brackets[2][1] .. "  " .. brackets[2][2],
					brackets[3][1] .. "  " .. brackets[3][2],
				}, context)
			end),
	})
	-- For each pair of brackets we will add another rule
	for _, bracket in pairs(brackets) do
		npairs.add_rules({
			-- Each of these rules is for a pair with left-side '( ' and right-side ' )' for each bracket type
			Rule(bracket[1] .. " ", " " .. bracket[2])
				:with_pair(cond.none())
				:with_move(function(opts)
					return opts.char == bracket[2]
				end)
				:with_del(cond.none())
				:use_key(bracket[2])
				-- Removes the trailing whitespace that can occur without this
				:replace_map_cr(function(_)
					return "<C-c>2xi<CR><C-c>O"
				end),
		})
	end
end

M.jsarrow = function()
	Rule("%(.*%)%s*%=>$", " {  }", { "typescript", "typescriptreact", "javascript" })
		:use_regex(true)
		:set_end_pair_length(2)
end

M.generics = function()
	npairs.add_rule(Rule("<", ">", {
		-- if you use nvim-ts-autotag, you may want to exclude these filetypes from this rule
		-- so that it doesn't conflict with nvim-ts-autotag
		"-html",
		"-javascriptreact",
		"-typescriptreact",
	}):with_pair(
		-- regex will make it so that it will auto-pair on
		-- `a<` but not `a <`
		-- The `:?:?` part makes it also
		-- work on Rust generics like `some_func::<T>()`
		cond.before_regex("%a+:?:?$", 3)
	):with_move(function(opts)
		return opts.char == ">"
	end))
end

return M
