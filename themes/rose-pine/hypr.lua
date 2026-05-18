-- ~/.config/themes/rose-pine/hypr.lua

local M = {}

M.base = "191724"
M.surface = "1f1d2e"
M.overlay = "26233a"
M.muted = "6e6a86"
M.subtle = "908caa"
M.text = "e0def4"
M.love = "eb6f92"
M.gold = "f6c177"
M.rose = "ebbcba"
M.pine = "31748f"
M.foam = "9ccfd8"
M.iris = "c4a7e7"
M.highlight_low = "21202e"
M.highlight_med = "403d52"
M.highlight_high = "524f67"

function M.rgb(name)
  return "rgb(" .. M[name] .. ")"
end

function M.rgba(name, alpha)
  return "rgba(" .. M[name] .. alpha .. ")"
end

return M
