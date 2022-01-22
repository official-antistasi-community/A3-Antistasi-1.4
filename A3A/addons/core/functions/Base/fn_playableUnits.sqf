/**
	Wrapper around playableUnits that gives us consistent behaviour (or desired behaviour?) in both singleplayer and multiplayer.
**/

if (isMultiplayer) then {
	playableUnits;
} else {
	[player];
};