/*
    Author: [Joris-Jan van 't Land] [Hazey] [Killzone_Kid] [Genesis]
    Description:
		Function to generate position in the world according to several parameters.

    Arguments:
    	0: (Optional) ARRAY - center position
			Note: passing [] (empty Array), the world's "safePositionAnchor" entry will be used.
				
		1: (Optional) NUMBER - minimum distance from the center position
		2: (Optional) NUMBER - maximum distance from the center position
			Note: passing -1, the world's "safePositionRadius" entry will be used.
				
		3: (Optional) NUMBER - minimum distance from the nearest object
		4: (Optional) NUMBER - water mode
			0 - cannot be in water
			1 - can either be in water or not
			2 - must be in water
						
		5: (Optional) NUMBER - maximum terrain gradient (hill steepness)
		6: (Optional) NUMBER - shore mode:
			0 - does not have to be at a shore
			1 - must be at a shore

    Return Value:
    	ARRAY - position solution

    Scope: Any
    Environment: Any
    Public: No

    Example: 
		[_markPos, 0, 20, 20, 2, 0, 0] call A3A_fnc_getSafePos;

    License: MIT License
*/

params ["_checkPos","_minDistance","_maxDistance","_objectProximity","_waterMode","_maxGradient","_shoreMode"];

// support object for center pos as well
if (_checkPos isEqualType objNull) then {_checkPos = getPos _checkPos};

private _defaultMaxDistance = worldSize / 2;

if (_maxDistance < 0) then  {
	_maxDistance = getNumber (configFile >> "CfgWorlds" >> worldName >> "safePositionRadius");
	if (_maxDistance <= 0) then {_maxDistance = _defaultMaxDistance};
};

private _checkProximity = _objectProximity > 0;

_shoreMode = _shoreMode != 0;

private _gradientRadius = 1 max _objectProximity * 0.1;

private _FinalResult = _checkPos;


// We add a limit of 3000 to avoid locking up the game if improper params are passed.
// It is possible a while loop could lock up if bad params are provided.
private _Pass = true;
for "_i" from 1 to 3000 do {
	_Pass = true;
	
	_FinalResult = _checkPos getPos [(_minDistance + (random _maxdistance)), random 360];

	// position is roughly suitable
	if (_FinalResult isFlatEmpty [-1, -1, _maxGradient, _gradientRadius, _waterMode, _shoreMode] isEqualTo []) then {_Pass = false;};
	
	// away from other objects
	if (_checkProximity && {!(nearestTerrainObjects [_FinalResult, ["TREE", "SMALL TREE", "BUSH", "BUILDING", "HOUSE", "FOREST BORDER", "FOREST TRIANGLE", "FOREST SQUARE", "CHURCH", "CHAPEL", "CROSS", "BUNKER", "FORTRESS", "FOUNTAIN", "VIEW-TOWER", "LIGHTHOUSE", "QUAY", "FUELSTATION", "HOSPITAL", "FENCE", "WALL", "HIDE", "BUSSTOP", "ROAD", "FOREST", "TRANSMITTER", "STACK", "RUIN", "TOURISM", "WATERTOWER", "TRACK", "MAIN ROAD", "ROCK", "ROCKS", "POWER LINES", "RAILWAY", "POWERSOLAR", "POWERWAVE", "POWERWIND", "SHIPWRECK", "TRAIL"], _objectProximity, false, true] isEqualTo [])}) then {_Pass = false;};	
	
	// not inside something
	if !(lineIntersectsSurfaces [AGLtoASL _FinalResult, AGLtoASL _FinalResult vectorAdd [0, 0, 50], objNull, objNull, false, 1, "GEOM", "NONE"] isEqualTo []) then {_Pass = false};
	
	if (_Pass) exitWith {};
};

if !(_Pass) then {
	// If nothing suitable is found, we fall back to using randomPos around the checkPosition.
	if (_waterMode == 0) then {
		_FinalResult = [[[_checkPos, _maxdistance]], ["water"]] call BIS_fnc_randomPos;
	};
	if (_waterMode == 1) then {
		_FinalResult = [[[_checkPos, _maxdistance]], []] call BIS_fnc_randomPos;
	};
	if (_waterMode == 2) then {
		_FinalResult = [[[_checkPos, _maxdistance]], ["ground"]] call BIS_fnc_randomPos;
	};
};

_FinalResult