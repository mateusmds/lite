local common = require('core.common')
local keymap = require('core.keymap')
local config = require('core.config')
local style  = require('core.style')

require('user.colors.monokai')
--require('user.colors.fall')
--require('user.colors.solarized')

-- personal configuration --
config.motiontrail_steps = 0640
config.memusage_active   = true
config.indent_size = 4

keymap.add({
    ["alt+escape"]   = "core:quit",
    ["ctrl+shift+f"] = "core:toggle-fullscreen",
    ["ctrl+e"]       = "eval:replace",
    ["ctrl+space"]   = "linter:move-to-next-warning",
})

-- delete old commands --
keymap.map["ctrl+w"] = nil
keymap.map["alt+return"] = nil

style.divider_size = common.round(2 * SCALE)

table.insert(
    config.luacheck_args,
    '--new-globals=love minetest renderer system ARGS PLATFORM SCALE EXEFILE PATHSEP'
)
style.linter = {}
style.linter["warning"] = {common.color('#EFDD66')}
style.linter["error"]   = {common.color('#EF4444')}
