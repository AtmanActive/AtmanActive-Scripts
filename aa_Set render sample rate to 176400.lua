-- @description Set render sample rate to 176400
-- @version 1.0
-- @author AtmanActive
-- @website https://github.com/AtmanActive/AA_ReaScripts
-- @changelog
--    + init
local SAMPLERATE = 176400;
reaper.defer
( function(); reaper.GetSetProjectInfo( 0, 'RENDER_SRATE', SAMPLERATE, 1 ); end );
