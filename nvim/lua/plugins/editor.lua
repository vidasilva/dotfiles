-- ~/.config/nvim/lua/plugins/editor.lua

return {
    -- Auto Pairs
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {} 
    },

    -- File Explorer (NvimTree)
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("nvim-tree").setup({
                view = {
                    width = 45,
                    relativenumber = true,
                },
                renderer = { group_empty = true },
                filters = { dotfiles = true },
                actions = {
                    open_file = {
                        quit_on_open = true,
                    },
                },
            })
            vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { silent = true })
        end,
    },

    -- Toggle Terminal
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            require("toggleterm").setup({
                open_mapping = [[<c-\>]],
                direction = "float",
                float_opts = { 
                    border = "curved",
                    highlights = {
                        border = "SomeHighlightGroup",
                        background = "SomeOtherHighlightGroup",
                    }
                },
            })
        end,
    },
}
