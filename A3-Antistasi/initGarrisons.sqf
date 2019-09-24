//Original Author: Barbolani
//Edited and updated by the Antstasi Community Development Team

diag_log format ["%1: [Antistasi] | INFO | InitGarrisons Started.", servertime];

_fnc_initGarrisons = {
	params ["_mrkCSAT", "_target", "_mrkType", "_mrkText", ["_useSideName", false]];
	private ["_pos", "_mrk", "_garrNum", "_garrison", "_groupsRandom"];

	{
		_pos = getMarkerPos _x;
		_mrk = createMarker [format ["Dum%1", _x], _pos];
		//TODO Multilanguage variable insted text
		_mrk setMarkerShape "ICON";
		_garrNum = ([_x] call A3A_fnc_garrisonSize) / 8;
		_garrison = [];

		if (_useSideName) then {
			killZones setVariable [_x, [], true];
			server setVariable [_x, 0, true];

			if (_x in _mrkCSAT) then {
				_mrkText = format [_mrkText, nameInvaders];
				_groupsRandom = [groupsCSATSquad, groupsFIASquad] select ((_target in outposts) && (gameMode == 4));
				if(_x in airportsX) then
				{
					_mrkType = flagCSATmrk;
				};
			} else {
				_mrkText = format [_mrkText, nameOccupants];
				_groupsRandom = groupsNATOSquad;
				if(_x in airportsX) then
				{
					_mrkType = flagNATOmrk;
				};
			};
		} else {
			_groupsRandom = groupsFIASquad;
		};

		if (_x in _mrkCSAT) then {
			_mrk setMarkerColor colorInvaders;
			sidesX setVariable [_x, Invaders, true];
		} else {
			_mrk setMarkerColor colorOccupants;
			sidesX setVariable [_x, Occupants, true];
		};

		for "_i" from 1 to _garrNum do {
			_garrison append (selectRandom _groupsRandom);
		};

		_mrk setMarkerType _mrkType;
		_mrk setMarkerText _mrkText;

		garrison setVariable [_x, _garrison, true];
		[_x] spawn A3A_fnc_createControls;
	} forEach _target;
};

private _mrkNATO = [];
private _mrkCSAT = [];
private _controlsNATO = [];
private _controlsCSAT = [];

if (debug) then {
	diag_log format ["%1: [Antistasi] | DEBUG | initGarrisons.sqf | Setting Control Marks for Worldname: %2  .", servertime, worldName];
};

if (gameMode == 1) then {
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
} else {
	if (gameMode == 4) then {
		_mrkCSAT = markersX - ["Synd_HQ"];
		_controlsCSAT = controlsX;
	} else {
		_mrkNATO = markersX - ["Synd_HQ"];
		_controlsNATO = controlsX;
	};
};

{sidesX setVariable [_x, Occupants, true]} forEach _controlsNATO;
{sidesX setVariable [_x, Invaders, true]} forEach _controlsCSAT;

if (debug) then {
	diag_log format ["%1: [Antistasi] | DEBUG | initGarrisons.sqf | Setting up Airbase stuff.", servertime];
};

[_mrkCSAT, airportsX, flagCSATmrk, "%1 Airbase", true] spawn _fnc_initGarrisons;

if (debug) then {
	diag_log format ["%1: [Antistasi] | DEBUG | initGarrisons.sqf | Setting up Resource stuff.", servertime];
};

[_mrkCSAT, resourcesX, "loc_rock", "Resources"] spawn _fnc_initGarrisons;

if (debug) then {
	diag_log format ["%1: [Antistasi] | DEBUG | initGarrisons.sqf | Setting up Factory stuff.", servertime];
};

[_mrkCSAT, factories, "u_installation", "Factory"] spawn _fnc_initGarrisons;

if (debug) then {
	diag_log format ["%1: [Antistasi] | DEBUG | initGarrisons.sqf | Setting up Outpost stuff.", servertime];
};

[_mrkCSAT, outposts, "loc_bunker", "%1 Outpost", true] spawn _fnc_initGarrisons;

if (debug) then {
	diag_log format ["%1: [Antistasi] | DEBUG | initGarrisons.sqf | Setting up Seaport stuff.", servertime];
};

[_mrkCSAT, seaports, "b_naval", "Sea Port"] spawn _fnc_initGarrisons;

sidesX setVariable ["NATO_carrier", Occupants, true];
sidesX setVariable ["CSAT_carrier", Invaders, true];

diag_log format ["%1: [Antistasi] | INFO | InitGarrison Completed.", servertime];
