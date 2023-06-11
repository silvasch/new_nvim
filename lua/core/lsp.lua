-- servers = {
--     rust_analyzer = {
--         settings = {
--             ["rust_analyzer"] = {}
--         }
--     }
-- }
function setup_lsp(servers)
    local lsp = require("lsp-zero").preset("recommended")
    local lspconfig = require("lspconfig")

    local server_names = {}

    for server_name, server_settings in pairs(servers) do
        table.insert(server_names, server_name)
        lspconfig[server_name].setup(server_settings)
    end

    lsp.setup_servers(server_names)

    lsp.nvim_workspace()

    lsp.setup()
end

return {
    get_lsp_plugin_entry = function(servers)
        return {
            "VonHeikemen/lsp-zero.nvim",
            branch = "v1.x",
            dependencies = {
                -- lsp support
                { "neovim/nvim-lspconfig" },             -- required

                -- autocompletion
                { "hrsh7th/nvim-cmp", },        -- required
                { "hrsh7th/cmp-nvim-lsp" },     -- required
                { "hrsh7th/cmp-buffer" },       -- optional
                { "hrsh7th/cmp-path" },         -- optional
                { "saadparwaiz1/cmp_luasnip" }, -- optional
                { "hrsh7th/cmp-nvim-lua" },     -- optional

                -- snippets
                { "L3MON4D3/LuaSnip" },             -- required
                { "rafamadriz/friendly-snippets" }, -- optional
            },
            config = function() setup_lsp(servers) end,
        }
    end
}
