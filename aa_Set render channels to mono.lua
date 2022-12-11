-- @description Set render channels to mono
-- @version 1.0
-- @author AtmanActive
-- @website https://github.com/AtmanActive/AA_ReaScripts
-- @changelog
--    + init

reaper.defer
( function(); reaper.GetSetProjectInfo( 0, 'RENDER_CHANNELS', 1, 1 ); end );
