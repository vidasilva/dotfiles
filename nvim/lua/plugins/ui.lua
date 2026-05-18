-- ~/.config/nvim/lua/plugins/ui.lua

return {
    -- Icons
    { "nvim-tree/nvim-web-devicons" },

    -- Dracula Theme
    {
        "Mofiqul/dracula.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("dracula").setup({
                overrides = {
                    FloatBorder = { fg = "#bd93f9", bg = "#282a36" },
                    NormalFloat = { bg = "#282a36" },
                },
            })

            vim.cmd.colorscheme("dracula")
        end,
    },

    -- Colorizer
    {
        "NvChad/nvim-colorizer.lua",
        opts = {
            user_default_options = {
                names = false,
                RGB = true,
                RRGGBB = true,
                rgb_fn = true,
                hsl_fn = true,
            },
        },
    },

    -- Indentation
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            indent = {
                char = "▎",
            },
            scope = {
                enabled = true, -- Highlights the current active block
                show_start = true,
                show_end = false,
            },
        },
    },

    -- Lualine
    {
        "nvim-lualine/lualine.nvim",
        opts = {
            options = {
                theme = "dracula",
                icons_enabled = true,
                section_separators = { left = "", right = "" },
                component_separators = { left = "", right = "" },
            },
            sections = { 
                lualine_a = { { "mode", icon = "" } },
                lualine_b = { "branch", "diff", "diagnostics" },
                lualine_c = {
                    {
                        "filename",
                        path = 1, -- relative path
                        fmt = function(path)
                            local max_dirs = 3

                            local parts = vim.split(path, "/")
                            if #parts <= max_dirs + 1 then
                                return path
                            end

                            local tail = {}
                            for i = #parts - max_dirs, #parts do
                                table.insert(tail, parts[i])
                            end

                            return "…/" .. table.concat(tail, "/")
                        end,
                    },
                },
                lualine_x = { "filetype" },
                lualine_y = {},
                lualine_z = { { "location", icon = "" } },
            },
        },
    },

    -- Completion & Diagnostic Icons
    {
        "hrsh7th/nvim-cmp",
        dependencies = { 
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip", 
        },
        config = function()
            local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
            for type, icon in pairs(signs) do
                local name = "DiagnosticSign" .. type
                vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
            end
            vim.diagnostic.config({
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = " ",
                        [vim.diagnostic.severity.WARN]  = " ",
                        [vim.diagnostic.severity.HINT]  = "󰠠 ",
                        [vim.diagnostic.severity.INFO]  = " ",
                    },
                },
            })

            local cmp = require("cmp")
            local kind_icons = {
                Text = "󰉿",
                Method = "󰆧",
                Function = "󰊕",
                Constructor = "",
                Field = "󰜢",
                Variable = "󰀫",
                Class = "󰠱",
                Interface = "",
                Module = "",
                Property = "󰜢",
                Unit = "󰑭",
                Value = "󰎠",
                Enum = "",
                Keyword = "󰌋",
                Snippet = "",
                Color = "󰏘",
                File = "󰈙",
                Reference = "󰈇",
                Folder = "󰉋",
                EnumMember = "",
                Constant = "󰏿",
                Struct = "󰙅",
                Event = "",
                Operator = "󰆕",
                TypeParameter = "",
            }

            cmp.setup({
                snippet = { expand = function(args) require("luasnip").lsp_expand(args.body) end },
                window = {
                    completion = {
                        border = "rounded",
                        max_height = 12,
                        max_width = 40,
                        winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:PmenuSel",
                    },
                    documentation = {
                        border = "rounded",
                        max_height = 12,
                        max_width = 40,
                        winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
                    },
                },
                formatting = {
                    format = function(entry, vim_item)
                        vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
                        vim_item.menu = ({
                            nvim_lsp = "[LSP]",
                            buffer = "[BUF]",
                            path = "[PATH]",
                            luasnip = "[SNIP]",
                        })[entry.source.name]
                        return vim_item
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<Tab>"] = cmp.mapping.select_next_item(),
                    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                }),
                sources = { { name = "nvim_lsp" } },
            })
        end,
    },
}
