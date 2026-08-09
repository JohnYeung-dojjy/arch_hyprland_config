-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name           = "suppress-maximize-events",
    match          = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)
local suppressFullscreenRule = hl.window_rule({
    -- Ignore fullscreen requests from steam games.
    name           = "suppress-steam-fullscreen-events",
    match          = { class = "steam_app.*" },
    suppress_event = "fullscreen",
})

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name     = "fix-xwayland-drags",
    match    = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

-- Noctalia Settings
hl.window_rule({
    match = { class = "dev.noctalia.Noctalia" },
    float = true,
    size = { 1080, 920 },
})

-- https://github.com/flameshot-org/flameshot/blob/master/docs/UsageHyprlandSwayWlroots.md
hl.window_rule({
    match     = { class = "flameshot" },
    no_anim   = true,
    pin       = true,
    float     = true,
    decorate  = false,
    no_blur   = true,
    no_shadow = true,
})

hl.window_rule({
    match = { class = "flameshot", title = "flameshot-pin" },
    move  = { "cursor_x-(window_w*0.5)", "cursor_y-(window_h*0.5)" },
})
hl.window_rule({
    match = { class = "flameshot", title = "flameshot" },
    move  = { 0, 0 },
})

hl.window_rule {
    name = "float-file-manager",
    match = {
        class = ".*dolphin$",
    },
    float = true,
    size = "(monitor_w*0.8) (monitor_h*0.8)",
}

hl.window_rule {
    name = "float-file-manager-from-browser",
    match = {
        class = "xdg-desktop-portal-gtk",
    },
    float = true,
    size = "(monitor_w*0.8) (monitor_h*0.8)",
}

hl.window_rule {
    name = "float-network-manager",
    match = {
        title = "iwgtk",
    },
    float = true,
    size = "(monitor_w*0.5) (monitor_h*0.5)",
}

hl.window_rule {
    name = "tile-steam-games",
    match = {
        class = "steam_app.*",
    },
    float = false,
}
