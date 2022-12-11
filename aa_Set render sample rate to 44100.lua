-- @description Set render sample rate to 44100
-- @version 1.0
-- @author AtmanActive
-- @website https://github.com/AtmanActive/AA_ReaScripts
-- @changelog
--    + init
local SAMPLERATE = 44100;
reaper.defer
( function(); reaper.GetSetProjectInfo( 0, 'RENDER_SRATE', SAMPLERATE, 1 ); end );
