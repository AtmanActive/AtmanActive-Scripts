-- @description Set render sample rate to 88200
-- @version 1.0
-- @author AtmanActive
-- @website https://github.com/AtmanActive/AA_ReaScripts
-- @changelog
--    + init
local SAMPLERATE = 88200;
reaper.defer
( function(); reaper.GetSetProjectInfo( 0, 'RENDER_SRATE', SAMPLERATE, 1 ); end );
