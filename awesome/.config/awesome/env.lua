local env = {}

-- variables
env.term = os.getenv("TERMINAL") or "kitty"
env.editor = os.getenv("EDITOR") or "nvim"
env.term_call = { " --class=" , " -e " }
env.editor_cmd = env.term .. env.term_call[2] .. env.editor

-- theme
env.theme_dir = os.getenv("HOME") .. "/.config/awesome/themes/"
env.theme_name = "default"

-- keycodes
env.modkey = "Mod4"
env.mehkey = { "Alt", "Shift", "Control" }
env.hyperkey = { "Alt", "Shift", "Control", "Mod4" }

return env
