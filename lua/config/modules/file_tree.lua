return {
    mappings = {
        n = {
            ["<leader>"] = {
                e = {
                    "<cmd>Neotree<cr>",
                    "Open the file tree",
                },
                E = {
                    "<cmd>NeoTreeClose<cr>",
                    "Close the file tree",
                }
            }
        }
    },
    plugins = {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = {
            close_if_last_window = true,
        }
    }
}
