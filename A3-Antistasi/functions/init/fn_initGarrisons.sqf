//Original Author: Barbolani
//Edited and updated by the Antistasi Community Development Team

diag_log format ["%1: [Antistasi] | INFO | InitGarrisons Started.", servertime];

_fnc_initMarker =
{
	if(loadLastSave) exitWith {};
	params ["_mrkCSAT", "_target", "_mrkType", "_mrkText", ["_useSideName", false]];
	private ["_pos", "_mrk", "_garrNum", "_garrison", "_groupsRandom"];

	{
		_pos = getMarkerPos _x;
		_mrk = createMarker [format ["Dum%1", _x], _pos];
		//TODO Multilanguage variable insted text
		_mrk setMarkerShape "ICON";

		if (_useSideName) then
		{
			killZones setVariable [_x, [], true];
			server setVariable [_x, 0, true];

			if (_x in _mrkCSAT) then
			{
				_mrkText = format [_mrkText, nameInvaders];
				if(_x in airportsX) then
				{
					_mrkType = flagCSATmrk;
				};
			}
			else
			{
				_mrkText = format [_mrkText, nameOccupants];
				if(_x in airportsX) then
				{
					_mrkType = flagNATOmrk;
				};
			};
		};

		if (_x in _mrkCSAT) then
		{
			_mrk setMarkerColor colorInvaders;
			sidesX setVariable [_x, Invaders, true];
		}
		else
		{
			_mrk setMarkerColor colorOccupants;
			sidesX setVariable [_x, Occupants, true];
		};

		_mrk setMarkerType _mrkType;
		_mrk setMarkerText _mrkText;

		[_x] spawn A3A_fnc_createControls;
	} forEach _target;
};


_fnc_initGarrison =
{
	if(loadLastSave) exitWith {};
	params ["_markerArray", "_type"];
	private ["_side", "_groupsRandom", "_garrNum", "_garrisonOld", "_marker"];
	{
	    _marker = _x;
			_garrNum = ([_marker] call A3A_fnc_garrisonSize) / 8;
			_side = sidesX getVariable [_marker, sideUnknown];
			while {_side == sideUnknown} do
			{
				diag_log format ["Side unknown for %1, sleeping 1!", _marker];
				sleep 1;
				_side = sidesX getVariable [_marker, sideUnknown];
			};
			if(_side != Occupants) then
			{
				_groupsRandom = [groupsCSATSquad, groupsFIASquad] select ((_marker in outposts) && (gameMode == 4));
			}
			else
			{
				if(_type != "Airport" && {_type != "Outpost"}) then
				{
					_groupsRandom = groupsFIASquad;
				}
				else
				{
	 				_groupsRandom = groupsNATOSquad;
				};
			};
			//Old system, keeping it intact for the moment
			_garrisonOld = [];
			for "_i" from 1 to _garrNum do
			{
				_garrisonOld append (selectRandom _groupsRandom);
			};
			//

			//Old system, keeping it runing for now
			garrison setVariable [_marker, _garrisonOld, true];
	} forEach _markerArray;
};

private _mrkNATO = [];
private _mrkCSAT = [];
private _controlsNATO = [];
private _controlsCSAT = [];

if (debug) then
{
	diag_log format ["%1: [Antistasi] | DEBUG | initGarrisons.sqf | Setting Control Marks for Worldname: %2  .", servertime, worldName];
};

if (gameMode == 1) then
{
	_controlsNATO = controlsX;
	switch (toLower worldName) do {
		case "tanoa": {
			_mrkCSAT = ["airport_1", "seaport_5", "outpost_10", "control_20"];
			_controlsNATO = _controlsNATO - ["control_20"];
			_controlsCSAT = ["control_20"];
		};
		case "altis": {
			_mrkCSAT = ["airport_2", "seaport_4", "outpost_5", "control_52", "control_33"];
			_controlsNATO = _controlsNATO - ["control_52", "control_33"];
			_controlsCSAT = ["control_52", "control_33"];
		};
		case "chernarus_summer": {
			_mrkCSAT = ["outpost_21"];
		};
	};
	_mrkNATO = markersX - _mrkCSAT - ["Synd_HQ"];

	if (debug) then {
		diag_log format ["%1: [Antistasi] | DEBUG | initGarrisons.sqf | _mrkCSAT: %2.", servertime, _mrkCSAT];
		diag_log format ["%1: [Antistasi] | DEBUG | initGarrisons.sqf | _mrkNATO: %2.", servertime, _mrkNATO];
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

if (debug) then {
	diag_log format ["%1: [Antistasi] | DEBUG | initGarrisons.sqf | Setting up Airbase stuff.", servertime];
};

[_mrkCSAT, airportsX, flagCSATmrk, "%1 Airbase", true] spawn _fnc_initMarker;
[airportsX, "Airport"] call _fnc_initGarrison;								//Old system
[airportsX, "Airport", [0,0,0]] spawn A3A_fnc_createGarrison;	//New system


if (debug) then {
	diag_log format ["%1: [Antistasi] | DEBUG | initGarrisons.sqf | Setting up Resource stuff.", servertime];
};

[_mrkCSAT, resourcesX, "loc_rock", "Resources"] spawn _fnc_initMarker;
[resourcesX, "Resource"] call _fnc_initGarrison;							//Old system
[resourcesX, "Other", [0,0,0]] spawn A3A_fnc_createGarrison;	//New system

if (debug) then {
	diag_log format ["%1: [Antistasi] | DEBUG | initGarrisons.sqf | Setting up Factory stuff.", servertime];
};

[_mrkCSAT, factories, "u_installation", "Factory"] spawn _fnc_initMarker;
[factories, "Factory"] call _fnc_initGarrison;
[factories, "Other", [0,0,0]] spawn A3A_fnc_createGarrison;

if (debug) then {
	diag_log format ["%1: [Antistasi] | DEBUG | initGarrisons.sqf | Setting up Outpost stuff.", servertime];
};

[_mrkCSAT, outposts, "loc_bunker", "%1 Outpost", true] spawn _fnc_initMarker;
[outposts, "Outpost"] call _fnc_initGarrison;
[outposts, "Outpost", [1,1,0]] spawn A3A_fnc_createGarrison;

if (debug) then {
	diag_log format ["%1: [Antistasi] | DEBUG | initGarrisons.sqf | Setting up Seaport stuff.", servertime];
};

[_mrkCSAT, seaports, "b_naval", "Sea Port"] spawn _fnc_initMarker;
[seaports, "Seaport"] call _fnc_initGarrison;
[seaports, "Other", [1,0,0]] spawn A3A_fnc_createGarrison;

//New system, adding cities
[citiesX, "City", [0,0,0]] spawn A3A_fnc_createGarrison;

sidesX setVariable ["NATO_carrier", Occupants, true];
sidesX setVariable ["CSAT_carrier", Invaders, true];

diag_log format ["%1: [Antistasi] | INFO | InitGarrison Completed.", servertime];
