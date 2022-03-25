/*
    Author: [Hazey]
    Description:
		Create Ambient Civ's within city

    Arguments:
    	<Marker> City Marker where you would like the Ambient Civilians created.
		Note, the marker must be provided from citiesX

    Return Value:
    	N/A

    Scope: Any
    Environment: Any
    Public: No

    Example: 
		[[_marker], "A3A_fnc_createAmbientCivs"] call A3A_fnc_scheduler;

    License: MIT License
*/

diag_log text format["Hazey Debug--- Creating hashmap for Civilian Ambient Tracks"];

// This really shouldn't be called again, also it really doesn't matter as if a key already exists
// It will just overwrite the current key, not create a new one.
if !(isNil "A3A_Civilian_Amb_Tracks") exitWith {};

// Create Public HashMap for Civilian Audio Tracks
A3A_Civilian_Amb_Tracks = createHashMap;

// Songs
A3A_Civilian_Amb_Tracks set ["A3A_Audio_Civ_Song1", 180];
A3A_Civilian_Amb_Tracks set ["A3A_Audio_Civ_Song2", 188];
A3A_Civilian_Amb_Tracks set ["A3A_Audio_Civ_Song3", 199];
A3A_Civilian_Amb_Tracks set ["A3A_Audio_Civ_Song4", 246];
A3A_Civilian_Amb_Tracks set ["A3A_Audio_Civ_Song5", 335];
A3A_Civilian_Amb_Tracks set ["A3A_Audio_Civ_Song6", 199];

// Radio Broadcasts
A3A_Civilian_Amb_Tracks set ["A3A_Audio_Civ_Radio1", 177];
A3A_Civilian_Amb_Tracks set ["A3A_Audio_Civ_Radio2", 235];
A3A_Civilian_Amb_Tracks set ["A3A_Audio_Civ_Radio3", 246];
A3A_Civilian_Amb_Tracks set ["A3A_Audio_Civ_Radio4", 292];
A3A_Civilian_Amb_Tracks set ["A3A_Audio_Civ_Radio5", 189];
A3A_Civilian_Amb_Tracks set ["A3A_Audio_Civ_Radio6", 203];

// Dog Sounds
A3A_Civilian_Amb_Tracks set ["A3A_Audio_Civ_Dog1", 7];
A3A_Civilian_Amb_Tracks set ["A3A_Audio_Civ_Dog2", 7];
A3A_Civilian_Amb_Tracks set ["A3A_Audio_Civ_Dog3", 7];
A3A_Civilian_Amb_Tracks set ["A3A_Audio_Civ_Dog4", 7];
A3A_Civilian_Amb_Tracks set ["A3A_Audio_Civ_Dog5", 7];
A3A_Civilian_Amb_Tracks set ["A3A_Audio_Civ_Dog6", 7];
A3A_Civilian_Amb_Tracks set ["A3A_Audio_Civ_Dog7", 7];
A3A_Civilian_Amb_Tracks set ["A3A_Audio_Civ_Dog8", 7];
A3A_Civilian_Amb_Tracks set ["A3A_Audio_Civ_Dog9", 8];
A3A_Civilian_Amb_Tracks set ["A3A_Audio_Civ_Dog10", 7];
A3A_Civilian_Amb_Tracks set ["A3A_Audio_Civ_Dog11", 7];
A3A_Civilian_Amb_Tracks set ["A3A_Audio_Civ_Dog12", 7];
A3A_Civilian_Amb_Tracks set ["A3A_Audio_Civ_Dog13", 7];
A3A_Civilian_Amb_Tracks set ["A3A_Audio_Civ_Dog14", 7];
A3A_Civilian_Amb_Tracks set ["A3A_Audio_Civ_Dog15", 7];
A3A_Civilian_Amb_Tracks set ["A3A_Audio_Civ_Dog16", 7];
A3A_Civilian_Amb_Tracks set ["A3A_Audio_Civ_Dog17", 8];
A3A_Civilian_Amb_Tracks set ["A3A_Audio_Civ_Dog18", 7];
A3A_Civilian_Amb_Tracks set ["A3A_Audio_Civ_Dog19", 7];
A3A_Civilian_Amb_Tracks set ["A3A_Audio_Civ_Dog20", 7];

diag_log text format["Hazey Debug--- Hashmap A3A_Civilian_Amb_Tracks: %1", A3A_Civilian_Amb_Tracks];