-- ~/.config/nvim/lua/core/options.lua

-- Basics
vim.opt.compatible = false
vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")

-- UI
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "dracula",
    callback = function()
        vim.api.nvim_set_hl(0, "CursorLineNr", { 
            fg = "#F1FA8C", 
            bg = "#282A36",
            bold = true 
        })
    end,
})

vim.api.nvim_create_autocmd("BufEnter", {
    nested = true,
    callback = function()
        if
            vim.bo.filetype == "NvimTree"
            and #vim.api.nvim_list_wins() == 1
            then
                vim.cmd("quit")
            end
        end,
    })

    vim.opt.showcmd = true
    vim.opt.wildmenu = true
    vim.opt.lazyredraw = true
    vim.opt.encoding = "utf-8"
    vim.opt.showmode = false
    vim.opt.showtabline = 0
    vim.opt.termguicolors = true
    vim.opt.winblend = 5
    vim.opt.pumblend = 0
    vim.opt.pumheight = 12

    -- Tabs / Indentation
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.expandtab = true
    vim.opt.smartindent = true
    vim.opt.autoindent = true

    -- Search
    vim.opt.ignorecase = true
    vim.opt.smartcase = true
    vim.opt.incsearch = true
    vim.opt.hlsearch = true

    -- Behavior
    vim.opt.hidden = true
    vim.opt.wrap = false
    vim.opt.backspace = { "indent", "eol", "start" }
    vim.opt.clipboard = "unnamedplus"
    vim.opt.mouse = "a"

    -- Splits
    vim.opt.splitbelow = true
    vim.opt.splitright = true

    -- Performance
    vim.opt.updatetime = 300
    vim.opt.timeoutlen = 500

    -- Files
    vim.opt.undofile = true
    vim.opt.swapfile = false
    vim.opt.backup = false

    vim.diagnostic.config({
        float = {
            border = "rounded",
        },
    })

    -- Default border style for all floating windows
    vim.lsp.handlers["textDocument/hover"] =
    vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
        max_width = math.floor(vim.o.columns * 0.5),
        max_height = math.floor(vim.o.lines * 0.3),
        focusable = true,
        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
    })

    vim.lsp.handlers["textDocument/signatureHelp"] =
    vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
        max_width = math.floor(vim.o.columns * 0.5),
        max_height = math.floor(vim.o.lines * 0.3),
        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
    })

    vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function()
            vim.api.nvim_set_hl(0, "ToggleTermBorder", { fg = "#bd93f9", bg = "#282a36" })
            vim.api.nvim_set_hl(0, "ToggleTermNormal", { bg = "#282a36" })
        end,
    })

