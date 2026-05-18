-- ~/.config/nvim/lua/plugins/liveserver.lua

return {
    "barrett-ruth/live-server.nvim",
    dependencies = { "williamboman/mason.nvim" },
    cmd = { "LiveServerStart", "LiveServerStop" },
    opts = {
        args = { "--port=5500" }
    },
    keys = {
        { "<F2>", "<cmd>LiveServerStart<CR>", desc = "Start Live Server" },
        { "<F3>", "<cmd>LiveServerStop<CR>", desc = "Stop Live Server" },
    },
}
