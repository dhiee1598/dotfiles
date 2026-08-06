-- Hyprland configuration (Lua format, required by Hyprland 0.57+).
---@diagnostic disable: undefined-global -- `hl` is injected by Hyprland at runtime.

-- Monitors
hl.monitor({ output = "HDMI-A-1", mode = "1920x1080@60", position = "0x0", scale = 1 })
hl.monitor({ output = "eDP-1", mode = "1920x1080@60", position = "0x0", scale = 1 })

-- Environment
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("GTK_IM_MODULE", "xim")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")

-- Autostart (the Lua equivalent of exec-once)
hl.on("hyprland.start", function()
	hl.exec_cmd("waybar & hyprpaper & swaync & hypridle & swayosd-server")
	hl.exec_cmd("dbus-update-activation-environment --systemd --all")
	-- graphical-session.target never activates under plain Hyprland, so start
	-- the portal frontend directly to make libadwaita honor prefer-dark.
	hl.exec_cmd("sleep 1 && /usr/lib/xdg-desktop-portal -r")
	hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'")
	hl.exec_cmd("hyprctl setcursor Bibata-Modern-Ice 24")
end)

-- Core settings
hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 14,
		border_size = 2,
		col = {
			active_border = {
				colors = { "rgb(0891b2)", "rgb(0e7490)", "rgb(155e75)" },
				angle = 45,
			},
			inactive_border = "rgb(08242b)",
		},
		layout = "dwindle",
		resize_on_border = true,
	},

	decoration = {
		rounding = 14,
		active_opacity = 0.98,
		inactive_opacity = 0.86,
		fullscreen_opacity = 1.0,
		blur = {
			enabled = true,
			size = 8,
			passes = 3,
			new_optimizations = true,
			ignore_opacity = false,
			xray = false,
			contrast = 1.08,
			brightness = 0.92,
			vibrancy = 0.22,
			vibrancy_darkness = 0.18,
		},
		shadow = {
			enabled = true,
			range = 38,
			render_power = 4,
			color = 0x7a000000,
			color_inactive = 0x42000000,
		},
	},

	animations = { enabled = true },

	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		numlock_by_default = true,
		follow_mouse = 1,
		mouse_refocus = false,
		touchpad = {
			natural_scroll = false,
			scroll_factor = 1.0,
		},
		sensitivity = 0,
	},

	master = { new_status = "master" },
	dwindle = { preserve_split = true },

	binds = {
		workspace_back_and_forth = true,
		allow_workspace_cycles = true,
		pass_mouse_when_bound = false,
	},

	cursor = { no_hardware_cursors = true },

	misc = {
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
		initial_workspace_tracking = 0,
	},
})

-- Animation curves and leaves
hl.curve("smooth", { type = "bezier", points = { { 0.22, 1 }, { 0.36, 1 } } })
hl.curve("pop", { type = "bezier", points = { { 0.16, 1 }, { 0.30, 1 } } })
hl.curve("softOut", { type = "bezier", points = { { 0.40, 0 }, { 0.20, 1 } } })
hl.curve("liner", { type = "bezier", points = { { 1, 1 }, { 1, 1 } } })

hl.animation({ leaf = "windows", enabled = true, speed = 5, bezier = "smooth", style = "slide" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 5, bezier = "pop", style = "slide" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 4, bezier = "softOut", style = "popin 85%" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 4, bezier = "smooth", style = "slide" })
hl.animation({ leaf = "border", enabled = true, speed = 1, bezier = "liner" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 45, bezier = "liner", style = "loop" })
hl.animation({ leaf = "fade", enabled = true, speed = 8, bezier = "softOut" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 5, bezier = "smooth", style = "slide" })

-- Keybindings
local mainMod = "SUPER"
local terminal = "kitty"
local menu = "sleep 0.2;pkill rofi || rofi -show drun -replace"

hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + space", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + F4", hl.dsp.exec_cmd("wlogout"))
hl.bind(mainMod .. " + q", hl.dsp.window.close())
hl.bind(mainMod .. " + f", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + t", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + a", hl.dsp.layout("togglesplit"))

hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + SHIFT + h", hl.dsp.window.swap({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + l", hl.dsp.window.swap({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + k", hl.dsp.window.swap({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + j", hl.dsp.window.swap({ direction = "d" }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.resize({ x = 100, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.resize({ x = -100, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.resize({ x = 0, y = 100, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.resize({ x = 0, y = -100, relative = true }), { repeating = true })

hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m output"))
hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m region"))

for i = 1, 10 do
	local key = i % 10
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + Tab", hl.dsp.focus({ workspace = "m+1" }))
hl.bind(mainMod .. " + SHIFT + Tab", hl.dsp.focus({ workspace = "m-1" }))
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + CTRL + e", hl.dsp.focus({ workspace = "empty" }))

local mediaBinds = {
	{ "XF86MonBrightnessUp", "swayosd-client --brightness raise" },
	{ "XF86MonBrightnessDown", "swayosd-client --brightness lower" },
	{ "XF86AudioRaiseVolume", "swayosd-client --output-volume raise" },
	{ "XF86AudioLowerVolume", "swayosd-client --output-volume lower" },
	{ "XF86AudioMute", "swayosd-client --output-volume mute-toggle" },
	{ "XF86AudioPlay", "playerctl play-pause" },
	{ "XF86AudioPause", "playerctl pause" },
	{ "XF86AudioNext", "playerctl next" },
	{ "XF86AudioPrev", "playerctl previous" },
	{ "XF86AudioMicMute", "pactl set-source-mute @DEFAULT_SOURCE@ toggle" },
	{ "code:238", "brightnessctl -d smc::kbd_backlight s +10" },
	{ "code:237", "brightnessctl -d smc::kbd_backlight s 10-" },
}

for _, binding in ipairs(mediaBinds) do
	hl.bind(binding[1], hl.dsp.exec_cmd(binding[2]))
end

-- Preserve the existing named Picture-in-Picture rule. It intentionally only
-- matches windows that are already floating and pinned.
hl.window_rule({
	name = "Picture-in-Picture",
	match = { float = true, pin = true },
})
