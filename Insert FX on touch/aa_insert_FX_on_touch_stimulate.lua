--[[
 * ReaScript Name: Insert FX
 * Description: Insert FX on selected tracks. FX name is can be edited witing the script code.
 * Instructions: Run
 * Screenshot:
 * Author: X-Raym
 * Author URI: http://extremraym.com
 * Repository: GitHub > X-Raym > EEL Scripts for Cockos REAPER
 * Repository URI: https://github.com/X-Raym/REAPER-EEL-Scripts
 * File URI:
 * Licence: GPL v3
 * Forum Thread: 
 * Forum Thread URI: 
 * REAPER: 5.0
 * Extensions: None
 * Version: 1.0
--]]



local scr_title = 'aa_insert_FX_on_touch_stimulate.lua'
for key in pairs(reaper) do _G[key]=reaper[key]  end 


  ---------------------------------------------------
  function eugen27771_GetTrackStateChunk(track)
    if not track then return end
    local fast_str, track_chunk
    fast_str = SNM_CreateFastString("")
    if SNM_GetSetObjectState(track, fast_str, false, false) then track_chunk = SNM_GetFastString(fast_str) end
    SNM_DeleteFastString(fast_str)  
    return track_chunk
  end 
  ---------------------------------------------------
  function msg(s) if s then ShowConsoleMsg(s..'\n') end end
  ---------------------------------------------------
  function literalize(str) -- http://stackoverflow.com/questions/1745448/lua-plain-string-gsub
     if str then  return str:gsub("[%(%)%.%%%+%-%*%?%[%]%^%$]", function(c) return "%" .. c end) end
  end
  -----------------------------------------------------------------------







function SetFXName(track, fx, new_name)
if not new_name then return end
local edited_line,edited_line_id, segm
-- get ref guid
  if not track or not tonumber(fx) then return end
  local FX_GUID = reaper.TrackFX_GetFXGUID( track, fx )
  if not FX_GUID then return else FX_GUID = FX_GUID:gsub('-',''):sub(2,-2) end
  local plug_type = reaper.TrackFX_GetIOSize( track, fx )
-- get chunk t
  local chunk = eugen27771_GetTrackStateChunk(track)--reaper.GetTrackStateChunk( track, '', false )
  local t = {} for line in chunk:gmatch("[^\r\n]+") do t[#t+1] = line end
-- find edit line
  local search
  for i = #t, 1, -1 do
	local t_check = t[i]:gsub('-','')
	if t_check:find(FX_GUID) then search = true  end
	if t[i]:find('<') and search and not t[i]:find('JS_SER') then
	  edited_line = t[i]:sub(2)
	  edited_line_id = i
	  break
	end
  end
-- parse line
  if not edited_line then return end
  local t1 = {}
  for word in edited_line:gmatch('[%S]+') do t1[#t1+1] = word end
  local t2 = {}
  for i = 1, #t1 do
	segm = t1[i]
	if not q then t2[#t2+1] = segm else t2[#t2] = t2[#t2]..' '..segm end
	if segm:find('"') and not segm:find('""') then if not q then q = true else q = nil end end
  end
  
  if not (plug_type == 2 or plug_type == 3) then return end
  if plug_type == 2 then t2[3] = '"'..new_name..'"' end -- if JS
  if plug_type == 3 then t2[5] = '"'..new_name..'"' end -- if VST

  local out_line = table.concat(t2,' ')
  t[edited_line_id] = '<'..out_line
  local out_chunk = table.concat(t,'\n')
  SetTrackStateChunk( track, out_chunk, true )
  UpdateArrange()
end















  function main(tr)
	
	
	local fxId = TrackFX_AddByName( tr, "VST3:Stimulate (Viator DSP)", false, 0 )
	--reaper.ShowConsoleMsg( fxId )
	if fxId < 0 then
		fxId = TrackFX_AddByName( tr, "VST3:Stimulate (Viator DSP)", false, -1 )
        --SetFXName( tr, fxId, "JS: Time Adjustment Delay" )
        --SNM_AddTCPFXParm( tr, fxId, 0 )
	end 
	
  end
  ---------------------------------------------------





Undo_BeginBlock()

for i = 1, CountSelectedTracks(0) do
tr = GetSelectedTrack( 0, i - 1 )
main( tr )
end

Undo_EndBlock( scr_title, 1 )


