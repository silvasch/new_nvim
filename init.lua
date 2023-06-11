-- opts helper functions
local opts = require("core.opts")
local load_opts = opts.load_opts
local load_gs = opts.load_gs

-- load configs
local config = require("config")
local modules = config.modules

-- store opts here
local opts = {}
local gs = {}

-- store plugins here
local plugins = {}
local has_plugins = false

-- lsps
local lsps = {}
local has_lsp = false

-- mappings
local mappings = {
    n = {},
    i = {},
    v = {},
    t = {},
}
local has_mappings = false

-- combine module configs
for _, module_name in ipairs(modules) do
	local module = require("config.modules." .. module_name)

    -- opts
    if not (module.opts == nil) then
		for k, v in pairs(module.opts) do
			opts[k] = v
		end
	end
    if not (module.gs == nil) then
        for k, v in pairs(module.gs) do
            gs[k] = v
        end
    end

    -- plugins
    if not (module.plugins == nil) then
        for _, plugin in ipairs(module.plugins) do
            table.insert(plugins, plugin)
            has_plugins = true
        end
    end

    -- lsps
    if not (module.lsp == nil) then
        if not (module.lsp.servers == nil) then
            for lsp_name, lsp_settings in pairs(module.lsp.servers) do
                lsps[lsp_name] = lsp_settings
                has_lsp = true
            end
        end
    end

    -- mappings
    if not(module.mappings == nil) then
        for mode, mapping in pairs(module.mappings) do
            table.insert(mappings[mode], mapping)
        end
        has_mappings = true
    end
end


-- load opts
load_opts(opts)
load_gs(gs)

-- lsp
if has_lsp then
    for _, module_name in ipairs(modules) do
	    local module = require("config.modules." .. module_name)
        if not (module.lsp == nil) then
            if not (module.lsp.mappings == nil) then
                for mode, mapping in pairs(module.lsp.mappings) do
                    table.insert(mappings[mode], mapping)
                end
                has_mappings = true
            end
        end
    end
    local get_lsp_plugin_entry = require("core.lsp").get_lsp_plugin_entry
    table.insert(plugins, get_lsp_plugin_entry(lsps))
end

if has_mappings then
    if config.use_which_key then
        table.insert(plugins, { "folke/which-key.nvim", config = true })
    end
end

-- load plugins
if has_plugins then
    local load_plugins = require("core.plugins").load_plugins
    load_plugins(plugins)
end

if has_mappings then
    local load_mappings = require("core.mappings").load_mappings
    load_mappings(mappings, config.use_which_key)
end

if not (config.colorscheme == nil) then vim.cmd("colorscheme " .. config.colorscheme) end
