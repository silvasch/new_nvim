return {
    plugins = {
        { "stevearc/dressing.nvim", config = true },
        { "rcarriga/nvim-notify" },
        { "nvim-tree/nvim-web-devicons" },
        {
            "folke/noice.nvim",
            config = true,
            event = "VeryLazy",
            dependencies = {
                "MunifTanjim/nui.nvim",
                "rcarriga/nvim-notify",
            }
        },
    },
}
