return {
    mappings = {
        n = {
            ["<leader>"] = {
                t = { "<cmd>ToggleTerm<cr>", "Open the terminal"},
            }
        }
    },
    plugins = {
        {
            "akinsho/toggleterm.nvim",
            config = true,
        }
    }
}
