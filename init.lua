local flatten = require("utils.flatten")

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
                table.insert(opts, module_options.opts)
			end
			if not (module_options.gs == nil) then
                table.insert(gs, module_options.gs)
			end
		end
	end

	if not (module.opts == nil) then
        table.insert(opts, module.opts)
	end
	if not (module.gs == nil) then
        table.insert(gs, module.gs)
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
	    table.insert(opts, module_options.opts)
    end
	if not (module_options.gs == nil) then
	    table.insert(gs, module_options.gs)
	end
end

opts = flatten(opts)
gs = flatten(gs)

local opts_helpers = require("core.opts")
opts_helpers.load_opts(opts)
opts_helpers.load_gs(gs)


