local M = {}

local opts = require("config.options").options

function M.setup()
    -- set neowvim options
    for opt_model, opts_sets in pairs(opts) do
        for opt_key, opt_val in pairs(opts_sets) do
	    vim[opt_model][opt_key] = opt_val
	end
    end

end

return M
