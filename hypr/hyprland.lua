-- ~/.config/hypr/hyprland.lua

----------------
-- MONITORS
----------------

hl.monitor({
  output = "",
  mode = "preferred",
  position = "auto",
  scale = "auto",
})

----------------
-- PROGRAMS
----------------

local terminal = "kitty"
local menu = "wofi"
local browser = "firefox"
local mainMod = "SUPER"

----------------
-- AUTOSTART
----------------

hl.on("hyprland.start", function()
  hl.exec_cmd("~/.config/waybar/scripts/launch.sh")
  hl.exec_cmd("hyprpaper")
  hl.exec_cmd("hyprsunset")
  hl.exec_cmd("hypridle")
  hl.exec_cmd("systemctl --user start hyprpolkitagent")
  hl.exec_cmd("swayosd-server")
  hl.exec_cmd("dunst")
end)

----------------
-- LOOK AND FEEL
----------------

local colors = dofile(os.getenv("HOME") .. "/.config/themes/dracula/hypr.lua")
local accent = colors.purple

hl.config({
  general = {
    gaps_in = 3.5,
    gaps_out = 7,
    border_size = 2,
    layout = "dwindle",
    allow_tearing = false,

    col = {
      active_border = colors.rgb("purple"),
      inactive_border = colors.rgb("selection", "aa"),
    },
  },

  decoration = {
    rounding = 3,
    active_opacity = 1,
    inactive_opacity = 0.90,

    shadow = {
      enabled = true,
      range = 90,
      offset = { 1, 2 },
      render_power = 3,
      scale = 0.97,
      color = colors.rgba("background", "66"),
    },

    blur = {
      enabled = true,
      size = 3,
      passes = 1,
      vibrancy = 0.1696,
    },
  },

  animations = {
    enabled = true,
  },

  dwindle = {
    preserve_split = true,
  },

  master = {
    new_status = "master",
  },

  misc = {
    force_default_wallpaper = -1,
    disable_hyprland_logo = false,
  },

  input = {
    kb_layout = "br",
    kb_variant = "thinkpad",
    kb_model = "",
    kb_options = "",
    kb_rules = "",

    numlock_by_default = true,
    follow_mouse = 1,
    sensitivity = 0,
  },
})

----------------
-- ANIMATIONS
----------------

hl.curve("linear", {
  type = "bezier",
  points = {
    { 0.0, 0.0 },
    { 1.0, 1.0 },
  },
})

hl.animation({
  leaf = "workspaces",
  enabled = true,
  speed = 3,
  bezier = "linear",
  style = "slidevert",
})

hl.animation({
  leaf = "windows",
  enabled = true,
  speed = 2.5,
  bezier = "linear",
  style = "popin",
})

hl.animation({
  leaf = "fade",
  enabled = true,
  speed = 2.5,
  bezier = "linear",
})

hl.window_rule({
  name = "kitty-on-workspace-3",
  match = {
    class = "kitty"
  }
})

hl.window_rule({
  name = "firefox-on-workspace-2",
  match = {
    class = "firefox"
  }
})

hl.window_rule({
  name = "steam-on-workspace-1",
  match = {
    class = "steam"
  }
})
----------------
-- KEYBINDINGS
----------------

-- Session / launcher
hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + CTRL + Delete", hl.dsp.exec_cmd("~/.config/hypr/scripts/power_menu.sh"))

hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd("~/.config/wofi/scripts/launch.sh"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))

-- Windows
hl.bind(mainMod .. " + Backspace", hl.dsp.window.close())
hl.bind(mainMod .. " + C", hl.dsp.window.close())

hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())

-- Dwindle-only split toggle
hl.bind(mainMod .. " + ccedilla", hl.dsp.layout("togglesplit"))

-- Special workspace / scratchpad
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Move focus
hl.bind(mainMod .. " + Left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))

hl.bind(mainMod .. " + Right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))

hl.bind(mainMod .. " + Up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))

hl.bind(mainMod .. " + Down", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Workspaces 1-10
for i = 1, 10 do
  local key = i % 10 -- 10 goes on key 0

  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Relative workspace switching
hl.bind(mainMod .. " + ALT + Up", hl.dsp.focus({ workspace = "-1" }))
hl.bind(mainMod .. " + ALT + Down", hl.dsp.focus({ workspace = "+1" }))
hl.bind(mainMod .. " + ALT + K", hl.dsp.focus({ workspace = "-1" }))
hl.bind(mainMod .. " + ALT + J", hl.dsp.focus({ workspace = "+1" }))

hl.bind(mainMod .. " + ALT + mouse_up", hl.dsp.focus({ workspace = "-1" }))
hl.bind(mainMod .. " + ALT + mouse_down", hl.dsp.focus({ workspace = "+1" }))

-- Move window to relative workspace
hl.bind(mainMod .. " + SHIFT + Up", hl.dsp.window.move({ workspace = "-1" }))
hl.bind(mainMod .. " + SHIFT + Down", hl.dsp.window.move({ workspace = "+1" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ workspace = "-1" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ workspace = "+1" }))

hl.bind(mainMod .. " + SHIFT + mouse_up", hl.dsp.window.move({ workspace = "-1" }))
hl.bind(mainMod .. " + SHIFT + mouse_down", hl.dsp.window.move({ workspace = "+1" }))

-- Move windows directionally
hl.bind(mainMod .. " + CTRL + Left", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + CTRL + H", hl.dsp.window.move({ direction = "left" }))

hl.bind(mainMod .. " + CTRL + Right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + CTRL + L", hl.dsp.window.move({ direction = "right" }))

hl.bind(mainMod .. " + CTRL + Up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + CTRL + K", hl.dsp.window.move({ direction = "up" }))

hl.bind(mainMod .. " + CTRL + Down", hl.dsp.window.move({ direction = "down" }))
hl.bind(mainMod .. " + CTRL + J", hl.dsp.window.move({ direction = "down" }))

-- Mouse move / resize
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

----------------
-- MEDIA KEYS
----------------

-- Volume with SwayOSD
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("swayosd-client --output-volume raise"), {
  locked = true,
  repeating = true,
})

hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("swayosd-client --output-volume lower"), {
  locked = true,
  repeating = true,
})

hl.bind("XF86AudioMute", hl.dsp.exec_cmd("swayosd-client --output-volume mute-toggle"), {
  locked = true,
})

hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("swayosd-client --input-volume mute-toggle"), {
  locked = true,
})

-- LCD brightness via hyprsunset gamma
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("hyprctl hyprsunset gamma -10"), {
  locked = true,
  repeating = true,
})

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("hyprctl hyprsunset gamma +10"), {
  locked = true,
  repeating = true,
})

-- Player controls
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), {
  locked = true,
})

hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), {
  locked = true,
})

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), {
  locked = true,
})

hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), {
  locked = true,
})

-- Screenshot
hl.bind("Print", hl.dsp.exec_cmd("~/.config/hypr/scripts/screenshot.sh"))
