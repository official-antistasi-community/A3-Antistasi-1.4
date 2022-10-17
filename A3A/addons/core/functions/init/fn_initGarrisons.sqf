//Original Author: Barbolani
//Edited and updated by the Antistasi Community Development Team
scriptName "fn_initGarrisons";
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
Info("InitGarrisons started");

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

			private _sideName = if (_x in _mrkCSAT) then {FactionGet(inv,"name")} else {FactionGet(occ,"name")};
			_mrk setMarkerText format [_mrkText, _sideName];
		}
		else
		{
			_mrk setMarkerText _mrkText;
		};

		if (_x in airportsX) then
		{
			private _flagType = if (_x in _mrkCSAT) then {FactionGet(inv,"flagMarkerType")} else {FactionGet(occ,"flagMarkerType")};
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
	private ["_side", "_faction", "_groupsRandom", "_garrNum", "_garrison", "_marker"];
	{
	    _marker = _x;
		_garrNum = [_marker] call A3A_fnc_garrisonSize;
		_side = sidesX getVariable [_marker, sideUnknown];
		_faction = Faction(_side);
		if(_side != Occupants) then
		{
			_groupsRandom = (_faction get "groupsSquads") + (_faction get "groupsMedium");
		}
		else
		{
			if !(_type in ["Airport", "Outpost"]) then
			{
				_groupsRandom = (_faction get "groupsMilitiaSquads") + (_faction get "groupsMilitiaMedium");
			}
			else
			{
 				_groupsRandom = (_faction get "groupsSquads") + (_faction get "groupsMedium");
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

private _mapInfoRoot = if (isClass (missionConfigFile/"A3A"/"mapInfo"/toLower worldName)) then {missionConfigFile} else {configFile};
getArray (_mapInfoRoot/"A3A"/"mapInfo"/toLower worldName/"garrison") params [["_mrkNATO", [], [[]]], ["_mrkCSAT",[],[[]]], ["_controlsNATO", [], [[]]], ["_controlsCSAT",[],[[]]]];

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

[_mrkCSAT, airportsX, FactionGet(inv,"flagMarkerType"), "%1 Airbase", true] call _fnc_initMarker;
[_mrkCSAT, resourcesX, "loc_rock", "Resources"] call _fnc_initMarker;
[_mrkCSAT, factories, "u_installation", "Factory"] call _fnc_initMarker;
[_mrkCSAT, outposts, "loc_bunker", "%1 Outpost", true] call _fnc_initMarker;
[_mrkCSAT, seaports, "b_naval", "Sea Port"] call _fnc_initMarker;

if (!(isNil "loadLastSave") && {loadLastSave}) exitWith {};

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
