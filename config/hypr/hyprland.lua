-- This is an example Hyprland Lua config file.
-- Refer to the wiki for more information.
-- https://wiki.hypr.land/Configuring/Start/

-- Please note not all available settings / options are set here.
-- For a full list, see the wiki

-- You can (and should!!) split this configuration into multiple files
-- Create your files separately and then require them like this:
-- require("myColors")

require("programs")
require("monitors")
require("layouts")
require("environments")
require("permissions")
require("look_and_feel")
require("workspacerules")
require("inputs")
require("keybinds")
require("windowrules")

-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function()
    -- hl.exec_cmd("hyprpm reload -n")
    hl.exec_cmd("noctalia")
    -- hl.exec_cmd("WGPU_POWER_PREF=high ashell")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("fcitx5")
    hl.exec_cmd("flameshot")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("gtk-launch brave")
    -- hl.exec_cmd("gtk-launch discord")
    hl.exec_cmd("zeditor ~/arch_hyprland_config")
    -- hl.exec_cmd(terminal)
end)

----------------
----  MISC  ----
----------------

hl.config({
    misc = {
        force_default_wallpaper = -1,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = false, -- If true disables the random hyprland logo / anime girl background. :(
        middle_click_paste      = false  -- Set to true to enable pasting selected text with middle click
    },
})


local ok, module = pcall(require, "virtual_desktops.virtual_desktops")
if not ok then
    hl.notification.create(
        {
            text = "virtual desktop module failed to load",
            timeout = 10000,
            icon = "error",
        })
end
