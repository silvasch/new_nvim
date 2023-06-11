return {
    mappings = {
        n = {
            ["<leader>"] = {
                f = { "<cmd>Telescope find_files<cr>", "Open the file picker" },
            },
        },
    },
    plugins = {
        {
            "nvim-telescope/telescope.nvim",
            dependencies = {
                { "nvim-lua/plenary.nvim" },
                { "nvim-tree/nvim-web-devicons" },
            },
        },
    }
}
