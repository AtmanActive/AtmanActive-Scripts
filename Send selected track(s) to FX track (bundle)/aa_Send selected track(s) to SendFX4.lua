-- @noindex

package.path = debug.getinfo(1,"S").source:match[[^@?(.*[\/])[^\/]-$]] .."?.lua;".. package.path
require 'aa_Send selected track(s) to SendFX track function'

local send_fx_prefix = "SendFX4"
local send_fx_slot   = 3

SendTrackToFX( send_fx_prefix, send_fx_slot ) -- call function