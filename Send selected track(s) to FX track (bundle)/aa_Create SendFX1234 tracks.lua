-- @noindex

function CreateSendFXTrack( send_fx_prefix )


    local selected_tracks = reaper.CountSelectedTracks(0)
    

    local function GetFX()
        
        track_count = reaper.GetNumTracks()  
        
        for i = 0, track_count-1 do -- loop thru all tracks
            
            track = reaper.GetTrack(0, i) -- get current track
            _, track_name = reaper.GetTrackName(track, "")
            
            if string.match(string.sub( track_name, 1, #send_fx_prefix ), send_fx_prefix) then -- prefix equals send_fx_prefix
                
                return track -- send_fx_prefix track found
                
            end
        end
        return false -- no send_fx_prefix track found
    end
    
    
    local function Main(fx_track)
        
        for i = 0, selected_tracks-1 do -- loop thru all selected tracks
            
            track = reaper.GetSelectedTrack(0, i) -- get current selected track
            _, track_name = reaper.GetTrackName(track, "")
            
            if not string.match(string.sub( track_name, 1, #send_fx_prefix ), send_fx_prefix) then -- prefix is not send_fx_prefix
                
				_, send_name = reaper.GetTrackSendName( track, send_fx_slot )
				
				if not string.match( string.sub( send_name, 1, #send_fx_prefix ), send_fx_prefix ) then
					
					sendIdx = reaper.CreateTrackSend( track, fx_track )
					
					reaper.SetTrackSendInfo_Value( track, 0, sendIdx, "D_VOL", 0 )
					
				end
				
            else
                reaper.ShowMessageBox("Please don't select the "..send_fx_prefix.." track itself", "Error", 0)
                return false
            end
        end
    end
    
	
	local fx_track = GetFX()
	if fx_track == false then -- fx_track doesn't exist
		reaper.InsertTrackAtIndex( 0, false )
		local new_fx_track = reaper.GetTrack( 0, 0 )
		reaper.GetSetMediaTrackInfo_String( new_fx_track, "P_NAME", send_fx_prefix, 1 )
		reaper.SetMediaTrackInfo_Value( new_fx_track, "B_MUTE", 1 )
	end
    
end


CreateSendFXTrack( "SendFX4" )
CreateSendFXTrack( "SendFX3" )
CreateSendFXTrack( "SendFX2" )
CreateSendFXTrack( "SendFX1" )
