-- ~/.config/themes/dracula/hypr.lua

local M = {}

M.background = "282A36"
M.foreground = "F8F8F2"
M.selection = "44475A"
M.comment = "6272A4"
M.red = "FF5555"
M.orange = "FFB86C"
M.yellow = "F1FA8C"
M.green = "50FA7B"
M.purple = "BD93F9"
M.cyan = "8BE9FD"
M.pink = "FF79C6"

function M.rgb(name)
  return "rgb(" .. M[name] .. ")"
end

function M.rgba(name, alpha)
  return "rgba(" .. M[name] .. alpha .. ")"
end

return M
