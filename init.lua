local config = require("config")
local modules = config.modules


function load_module(module_name)
	local module = require("config.modules." .. module_name)

	local opts = {}
    local gs = {}

	if not (module.dependencies == nil) then
		for _, dependency in ipairs(module.dependencies) do
			local module_options = load_module(dependency)

			if not (module_options.opts == nil) then
				for name, value in pairs(module_options.opts) do
					opts[name] = value
				end
			end
			if not (module_options.gs == nil) then
				for name, value in pairs(module_options.gs) do
					gs[name] = value
				end
			end
		end
	end

	if not (module.opts == nil) then
		for name, value in pairs(module.opts) do
			opts[name] = value
		end
	end
	if not (module.gs == nil) then
		for name, value in pairs(module.gs) do
			gs[name] = value
		end
	end

	return {
		opts = opts,
        gs = gs,
	}
end


local opts = {}
local gs = {}


for _, module_name in ipairs(modules) do
	local module_options = load_module(module_name)

	if not (module_options.opts == nil) then
		for name, value in pairs(module_options.opts) do
			opts[name] = value
		end
	end
	if not (module_options.gs == nil) then
		for name, value in pairs(module_options.gs) do
			gs[name] = value
		end
	end
end

local opts_helpers = require("core.opts")
opts_helpers.load_opts(opts)
opts_helpers.load_gs(gs)


