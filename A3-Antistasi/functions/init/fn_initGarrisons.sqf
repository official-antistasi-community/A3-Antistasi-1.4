//Original Author: Barbolani
//Edited and updated by the Antistasi Community Development Team
scriptName "fn_initGarrisons";
#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
Info("InitGarrisons started");

// get terrain specific info
private _fileName = "Map\" + toLower worldName + "Info.sqf";
["garrison"] call compile preProcessFileLineNumbers _filename;

_fnc_initMarker =
{
	params ["_mrkCSAT", "_target", "_mrkType", "_mrkText", ["_useSideName", false]];

	{
		private _pos = getMarkerPos _x;
		private _mrk = createMarker [format ["Dum%1", _x], _pos];
		//TODO Multilanguage variable insted text
		_mrk setMarkerShape "ICON";

		if (_useSideName) then
		{
			killZones setVariable [_x, [], true];
			server setVariable [_x, 0, true];

			private _sideName = if (_x in _mrkCSAT) then {nameInvaders} else {nameOccupants};
			_mrk setMarkerText format [_mrkText, _sideName];
		}
		else
		{
			_mrk setMarkerText _mrkText;
		};

		if (_x in airportsX) then
		{
			private _flagType = if (_x in _mrkCSAT) then {flagCSATmrk} else {flagNATOmrk};
			_mrk setMarkerType _flagType;
		}
		else
		{
			_mrk setMarkerType _mrkType;
		};

		if (_x in _mrkCSAT) then
		{
			if !(_x in airportsX) then {_mrk setMarkerColor colorInvaders;} else {_mrk setMarkerColor "Default"};
			sidesX setVariable [_x, Invaders, true];
		}
		else
		{
			if !(_x in airportsX) then {_mrk setMarkerColor colorOccupants;} else {_mrk setMarkerColor "Default"};
			sidesX setVariable [_x, Occupants, true];
		};

		[_x] call A3A_fnc_createControls;
	} forEach _target;
};


_fnc_initGarrison =
{
	params ["_markerArray", "_type"];
	private ["_side", "_groupsRandom", "_garrNum", "_garrison", "_marker"];
	{
	    _marker = _x;
		_garrNum = [_marker] call A3A_fnc_garrisonSize;
		_side = sidesX getVariable [_marker, sideUnknown];
		if(_side != Occupants) then
		{
			_groupsRandom = groupsCSATSquad + groupsCSATMid;
		}
		else
		{
			if !(_type in ["Airport", "Outpost"]) then
			{
				_groupsRandom = groupsFIASquad + groupsFIAMid;
			}
			else
			{
 				_groupsRandom = groupsNATOSquad + groupsNATOMid;
			};
		};

		_garrison = [];
		while {count _garrison < _garrNum} do
		{
			_garrison append (selectRandom _groupsRandom);
		};
		_garrison resize _garrNum;
		garrison setVariable [_marker, _garrison, true];

	} forEach _markerArray;
};

private _mrkNATO = A3A_mrkNATO;
private _mrkCSAT = A3A_mrkCSAT;
private _controlsNATO = A3A_controlsNATO;
private _controlsCSAT = A3A_controlsCSAT;

if (debug) then
{
    Debug_1("Setting Control Marks for Worldname: %1", worldName);
};

if (gameMode == 1) then
{
	_controlsNATO = controlsX;
    _controlsNATO = _controlsNATO - _controlsCSAT;
	_mrkNATO = markersX - _mrkCSAT - ["Synd_HQ"];

	if (debug) then {
        Debug_1("_mrkCSAT: %1", _mrkCSAT);
        Debug_1("_mrkNATO: %1", _mrkNATO);
	};
}
else
{
	if (gameMode == 4) then
	{
		_mrkCSAT = markersX - ["Synd_HQ"];
		_controlsCSAT = controlsX;
	}
	else
	{
		_mrkNATO = markersX - ["Synd_HQ"];
		_controlsNATO = controlsX;
	};
};

{sidesX setVariable [_x, Occupants, true]} forEach _controlsNATO;
{sidesX setVariable [_x, Invaders, true]} forEach _controlsCSAT;

[_mrkCSAT, airportsX, flagCSATmrk, "%1 Airbase", true] call _fnc_initMarker;
[_mrkCSAT, resourcesX, "loc_rock", "Resources"] call _fnc_initMarker;
[_mrkCSAT, factories, "u_installation", "Factory"] call _fnc_initMarker;
[_mrkCSAT, outposts, "loc_bunker", "%1 Outpost", true] call _fnc_initMarker;
[_mrkCSAT, seaports, "b_naval", "Sea Port"] call _fnc_initMarker;

if (!(isNil "loadLastSave") && {loadLastSave}) exitWith {};

//Set carrier markers to the same as airbases below.
if (isServer) then {"NATO_carrier" setMarkertype flagNATOmrk};
if (isServer) then {"CSAT_carrier" setMarkertype flagCSATmrk};

if (debug) then {
    Debug("Setting up Airbase stuff.");
};

[airportsX, "Airport"] call _fnc_initGarrison;								//Old system
[airportsX, "Airport", [0,0,0]] call A3A_fnc_createGarrison;	//New system

if (debug) then {
    Debug("Setting up Resource stuff.");
};

[resourcesX, "Resource"] call _fnc_initGarrison;							//Old system
[resourcesX, "Other", [0,0,0]] call A3A_fnc_createGarrison;	//New system

if (debug) then {
    Debug("Setting up Factory stuff.");
};

[factories, "Factory"] call _fnc_initGarrison;
[factories, "Other", [0,0,0]] call A3A_fnc_createGarrison;

if (debug) then {
    Debug("Setting up Outpost stuff.");
};

[outposts, "Outpost"] call _fnc_initGarrison;
[outposts, "Outpost", [1,1,0]] call A3A_fnc_createGarrison;

if (debug) then {
    Debug("Setting up Seaport stuff.");
};

[seaports, "Seaport"] call _fnc_initGarrison;
[seaports, "Other", [1,0,0]] call A3A_fnc_createGarrison;

//New system, adding cities
[citiesX, "City", [0,0,0]] call A3A_fnc_createGarrison;

publicVariable "controlsX";		// because it adds to the array

Info("InitGarrisons completed");
