/*
  SHK_pos

  Version 0.23
  Author: Shuko (shuko@quakenet, miika@miikajarvinen.fi)
  Contributors: Hatifnat

  Forum: http://forums.bistudio.com/showthread.php?162695-SHK_pos

  Marker Based Selection
    Required Parameters:
      0 String   Area marker's name.

    Optional Parameters:
      1 Number            Water position. Default is only land positions allowed.
                            0   Find closest land. Search outwards 360 degrees (20 degree steps) and 20m steps.
                            1   Allow water positions.
                            2   Find only water positions.
      2 Array or String   One or multiple blacklist area markers which are excluded from the main marker area.
      3 Array, Number, Object or Vehicle Type         Force finding large enough empty position.
                            0   Max range from the selection position to look for empty space. Default is 200.
                            1   Vehicle or vehicle type to fit into an empty space.

                            Examples:
                              [...,[300,heli]]       Array with distance and vehicle object.
                              [...,350]              Only distance given
                              [...,(typeof heli)]    Only vehicle type given
                              [...,heli]             Only vehicle object given

  Position Based Selection
    Required Parameters:
      0 Object or Position  Anchor point from where the relative position is calculated from.
      1 Array or Number     Distance from anchor.

    Optional Parameters:
      2 Array of Number     Direction from anchor. Default is random between 0 and 360.
      3 Number              Water position. Default is only land positions allowed.
                              0   Find closest land. Search outwards 360 degrees (20 degree steps) and 20m steps.
                              1   Allow water positions.
                              2   Find only water positions.
      4 Array               Road positions.
                              0  Number  Road position forcing. Default is 0.
                                   0    Do not search for road positions.
                                   1    Find closest road position. Return the generated random position if none found.
                                   2    Find closest road position. Return empty array if none found.
                              1  Number   Road search range. Default is 200m.
      5 Array, Number, Object or Vehicle Type         Force finding large enough empty position.
                              0   Max range from the selection position to look for empty space. Default is 200.
                              1   Vehicle or vehicle type to fit into an empty space.

                            Examples:
                              [...,[300,heli]]       Array with distance and vehicle object.
                              [...,350]              Only distance given
                              [...,(typeof heli)]    Only vehicle type given
                              [...,heli]             Only vehicle object given

  Usage:
    Preprocess the file in init.sqf:
      call compile preprocessfile "SHK_pos\shk_pos_init.sqf";

    Actually getting the position:
      pos = [parameters] call SHK_pos;
*/



private ["_pos"];
_pos = [];

// Only marker is given as parameter
if (_this isEqualType "STRING") then {
	_pos = [_this] call UPSMON_fnc_getPosMarker;

// Parameter array
} else {
    if ((_this select 0) isEqualType "STRING") then {
      	_pos = _this call UPSMON_fnc_getPosMarker;
    } else {
     	 _pos = _this call UPSMON_fnc_getPos;
    };
};

// Return position
_pos