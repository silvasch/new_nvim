return {
    mappings = {
        n = {
            ["<C-Left>"] = {
                "<C-w><Left>",
                "Move to the window on the left",
            },
            ["<C-Right>"] = {
                "<C-w><Right>",
                "Move to the window on the right",
            },
            ["<C-Up>"] = {
                "<C-w><Up>",
                "Move to the upper window",
            },
            ["<C-Down>"] = {
                "<C-w><Down>",
                "Move to the lower window",
            },
            ["<C-h>"] = {
                "<C-w>s",
                "Split the window horizontally",
            },
            ["<C-v>"] = {
                "<C-w>v",
                "Split the window vertically",
            },
        }
    }
}
