comment "Music playlist";
	currentTrackNumber = 0;

	allMusicTracks = 
	[
		"Fallout",
		"Defcon",
		"Wasteland",
		"MAD"
	];

comment "Add music event";
_ehID = addMusicEventHandler ["MusicStop",
{
	currentTrackNumber = (currentTrackNumber + 1);
	if(currentTrackNumber >= (count allMusicTracks)) then {currentTrackNumber = 0;};
	[allMusicTracks select currentTrackNumber] remoteExec ["playMusic",0];
}];

comment "Play first track";
[allMusicTracks select round random ((count allMusicTracks)-1)] remoteExec ["playMusic",0];