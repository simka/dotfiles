local beautiful = require("beautiful")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup").widget
local env = require("env")

local awesomemenu = {
  { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
  { "restart", awesome.restart },
  { "quit", function() awesome.quit() end },
}

local powermenu = {
   { "suspend", "systemctl suspend"},
   { "hibernate", "systemctl hibernate"},
   { "reboot", "systemctl reboot"},
   { "poweroff", "systemctl poweroff"},
}

local appmenu = {
  { "chromium", "chromium" },
  { "deluge", "deluge" },
  { "firefox", "firefox" },
  { "gnucash", "gnucash" },
  { "ncmpcpp", env.term .. env.term_call[1] .. "ncmpcpp" .. env.term_call[2] .. "ncmpcpp"},
  { "nemo", "nemo" },
  { "ranger", env.term .. env.term_call[1] .. 'ranger' .. env.term_call[2] .. 'ranger' },
  { "spotify", "spotify" }
}

local mainmenu = awful.menu({ items = 
  {
    { "open terminal", env.term },
    { "apps", appmenu },
    { "awesome", awesomemenu },
    { "power", powermenu }
  }
})

return mainmenu
