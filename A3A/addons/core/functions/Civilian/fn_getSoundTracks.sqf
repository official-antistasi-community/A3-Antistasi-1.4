// Returns Array of all sound tracks and lengths

params ["_locationType"];
private _trackList = [];

if ((_locationType == "Mediterranean") || (_locationType == "default")) then {
	_trackList pushBack ["A3A_Audio_Civ_Song1", 180];
	_trackList pushBack ["A3A_Audio_Civ_Song2", 188];
	_trackList pushBack ["A3A_Audio_Civ_Song3", 199];
	_trackList pushBack ["A3A_Audio_Civ_Song4", 246];
	_trackList pushBack ["A3A_Audio_Civ_Song5", 335];
	_trackList pushBack ["A3A_Audio_Civ_Song6", 199];
};

_trackList