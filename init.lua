local utils = require("utils")

local config = require("config")
local modules = config.modules


function load_module(module_name)
	local module = require("config.modules." .. module_name)

	local opts = {}
    local gs = {}
    local plugins = {}

	if not (module.dependencies == nil) then
		for _, dependency in ipairs(module.dependencies) do
			local module_options = load_module(dependency)

			if not (module_options.opts == nil) then
                table.insert(opts, module_options.opts)
			end
			if not (module_options.gs == nil) then
                table.insert(gs, module_options.gs)
			end

			if not (module_options.plugins == nil) then
                table.insert(plugins, module_options.plugins)
			end
		end
	end

	if not (module.opts == nil) then
        table.insert(opts, module.opts)
	end
	if not (module.gs == nil) then
        table.insert(gs, module.gs)
	end
	if not (module.plugins == nil) then
        table.insert(plugins, module.plugins)
	end

	return {
		opts = opts,
        gs = gs,
        plugins = plugins,
	}
end


local opts = {}
local gs = {}
local plugins = {}
local has_plugins = false


for _, module_name in ipairs(modules) do
	local module_options = load_module(module_name)

	table.insert(opts, module_options.opts)
	table.insert(gs, module_options.gs)
 	if module_options.has_plugins then
	    table.insert(plugins, module_options.plugins)
        has_plugins = true
    end
end

opts = utils.flatten(opts)
gs = utils.flatten(gs)
plugins = utils.flatten(plugins)

local opts_helpers = require("core.opts")
opts_helpers.load_opts(opts)
opts_helpers.load_gs(gs)

print(vim.inspect(plugins))
local has_plugins = false
for _, _ in ipairs(plugins) do
    has_plugins = true
end

if has_plugins then
    local plugins_helper = require("core.plugins")
    plugins_helper.load_plugins(plugins)
end

