local awful = require("awful")
local filesystem = require('gears.filesystem')

local autostart = {}

-- Autostart windowless processes
local function run_once(cmd_arr)
  for _, cmd in ipairs(cmd_arr) do
    local findme = cmd
    local firstspace = cmd:find(' ')
    if firstspace then
      findme = cmd:sub(0, firstspace - 1)
    end
    awful.spawn.with_shell(string.format(
      'pgrep -u $USER -x %s > /dev/null || pgrep -u $USER -x -f %s > /dev/null || (%s)',
      findme, findme, cmd
    ))
  end
end

function autostart.run()
  run_once({'cadence-session-start -s'})
  run_once({'compton -b'})
  run_once({'keepassxc'})
  run_once({'mopidy'})
  run_once({'nm-applet'})
  run_once({'redshift'})
  run_once({'udiskie --smart-tray'})
  run_once({'unclutter'})
  run_once({'discord'})
  run_once({'deluge'})
  run_once({'spotify'})
end

return autostart
