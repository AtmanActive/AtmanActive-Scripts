editor = reaper.MIDIEditor_GetActive()
if editor then
    for t = 0, math.huge do
        take = reaper.MIDIEditor_EnumTakes(editor, t, true)
        if not take then 
            break 
        elseif reaper.MIDI_EnumSelNotes(take, -1) ~= -1 then -- Any selected notes?
            reaper.MIDI_DisableSort(take)
            i = -1
            ::nextNote::
                i = reaper.MIDI_EnumSelNotes(take, i)
                if i == -1 then goto gotAllNotes end
                ok, sel, muted, startTick, endTick, chan, pitch, vel = reaper.MIDI_GetNote(take, i)
                reaper.MIDI_SetNote(take, i, nil, nil, startTick+1, endTick+1, nil, nil, nil, true)
                goto nextNote
            ::gotAllNotes::
            reaper.MIDI_Sort(take)
        end
    end 
end