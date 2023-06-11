return {
    lsp = {
        mappings = {},
        servers = {
            rust_analyzer = {}
        },
    },
    plugins = {
        {
            "saecki/crates.nvim",
            tag = "v0.3.0",
            dependencies = {
                "nvim-lua/plenary.nvim",
            },
            config = true,
        },
    }
}
