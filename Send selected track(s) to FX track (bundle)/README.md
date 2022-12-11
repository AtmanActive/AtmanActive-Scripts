# Smart Send Selected Track(s) to SendFX

This is a bundle of LUA scripts for the most advanced [DAW](https://en.wikipedia.org/wiki/Digital_audio_workstation) in the world: [Reaper](https://reaper.fm).

The purpose of this action (script) is to automate adding of SendFX in one go to a selected track.

Also, the script(s) have been enhanced to enable non-destructive behavior when called on a track that already has one or more send FX established.
In this way, invoking the script can be automated, from a toolbar button in Reaper or from a button/knob on a MIDI control surface.

My ultimate goal with this is to find the way to execute-action-only-once-per-track-per-session which would then enable a real analog mixer-like workflow where you don't have to add sendFX manually for each track but as soon as you touch sendFX knob, the effect is already there. In the meantime, the script can be executed on each knob touch with a bit of CPU penalty.

On the other hand, if you have a brand new track and you don't touch the sendFX knob (i.e. you don't execute this action), then, your track has no sendFX established, therefore saving precious CPU power.

Here is how to use it:

## Installation:

Copy all files from this folder to your Reaper installation, [then import them into your Reaper](https://forum.cockos.com/showthread.php?t=186252). Additionally, add them to your toolbar or [CSI](https://github.com/GeoffAWaddington/CSIWiki/wiki) or [ReaLearn](https://www.helgoboss.org/projects/realearn/).

## Preparation:

When you first start your project, execute the script/action `aa_Create SendFX1234 tracks.lua` once.

Or, if you want to do it manually, create four tracks and name them "SendFX1", "SendFX2", "SendFX3" and "SendFX4".

Please note that these required names are just prefixes. 
You are free to name your tracks "SendFX1: Reverb", or "SendFX2: Delay", or however you wish, as long as the "SendFX1" or "SendFX2" or "SendFX3" or "SendFX4" part is there. It is important to keep these four tracks in order, meaning, they are one after the other as 1, 2, 3 and 4 since Reaper indexes sends on a track in the same order their destination tracks are present in the arrangement.

Now you can add insertFX to those four tracks to create your actual effects (reverb, delay, chorus, flanger...). 
If you are not yet sure which sound you are after, you can just leave the tracks muted, for now.

That's it. That's all preparation needed.

## Usage:

Later in your workflow, whenever you want to add sendFX bunch to a track, all you need to do is to select that track and execute the action `aa_Send selected track(s) to SendFX1234.lua`.

You can execute it from a toolbar, or you can create a keyboard shortcut, or you can assign it to a button on a MIDI surface controller using either [CSI](https://github.com/GeoffAWaddington/CSIWiki/wiki) or [ReaLearn](https://www.helgoboss.org/projects/realearn/).

When you execute it on the selected track, the track will get sent to those four SendFX tracks and you can now adjust sendFX levels to taste.

If you later on execute the same action on a track that already has four sendFX established - nothing will happen. 
The script is safe to be executed infinite number of times.

This way, if you have a knob dedicated to sendFX levels of a selected track, you can just touch the knob and start turning right to add sendFX level, as if you were doing it on an analog mixer, starting from -inf and slowly adding more and more sendFX volume until satisfied.
