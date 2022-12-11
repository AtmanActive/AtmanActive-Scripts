-- @description Set render directory to '\Exports' relative windows folder
-- @version 1.0
-- @author AtmanActive
-- @website https://github.com/AtmanActive/AA_ReaScripts
-- @changelog
--    + init

reaper.defer
( function(); reaper.GetSetProjectInfo_String( 0, 'RENDER_FILE', '\\Exports', true ); end );
