//Original Author: Barbolani
//Edited and updated by the Antstasi Community Development Team

if (isDedicated) exitWith {};

_fnc_addTextX = {
	params ["_nameSide", "_chance", "_textX", "_vehTemplate", "_nameVeh"];

	_vehTemplate = [[_vehTemplate], _vehTemplate] select (_vehTemplate isEqualType []);

	if (random 100 < _chance) then {
		if ((_vehTemplate findIf {[_x] call A3A_fnc_vehAvailable}) >= 0) then {
			_textX = format ["%1 %2 %3 Available<br/>", _textX, _nameSide, _nameVeh];
		} else {
			_textX = format ["%1 %2 %3 Unavailable<br/>", _textX, _nameSide, _nameVeh];
		}
	};

	_textX
};

params ["_markerX"];

private _chance = [8, 100] select (debug);
private _sideX = Occupants;

if (count _this == 1) then {
	if (_markerX isEqualType "") then {
		_chance = [15, 30] select (_markerX in airportsX);
		_sideX = sidesX getVariable [_markerX, Occupants];
	} else {
		_sideX = side (group _markerX);
		_chance = random 25;
	};
};

private _textX = format ["<t size='0.6' color='#C1C0BB'>Intel Found.<br/> <t size='0.5' color='#C1C0BB'><br/>"];
private _minesAAF = allmines - (detectedMines teamPlayer);

if (_sideX == Occupants) then {
	_textX = [nameOccupants, _chance, _textX, vehNATOPlane, "Planes"] call _fnc_addTextX;
	_textX = [nameOccupants, _chance, _textX, vehNATOAttackHelis, "Attack Helis"] call _fnc_addTextX;
	_textX = [nameOccupants, _chance, _textX, vehNATOAPC, "APCs"] call _fnc_addTextX;
	_textX = [nameOccupants, _chance, _textX, vehNATOTank, "Tanks"] call _fnc_addTextX;
	_textX = [nameOccupants, _chance, _textX, vehNATOAA, "AA Tanks"] call _fnc_addTextX;
	_minesAAF = _minesAAF - (detectedMines Invaders);
} else {
	_textX = [nameInvaders, _chance, _textX, vehCSATPlane, "Planes"] call _fnc_addTextX;
	_textX = [nameInvaders, _chance, _textX, vehCSATAttackHelis, "Attack Helis"] call _fnc_addTextX;
	_textX = [nameInvaders, _chance, _textX, vehCSATAPC, "APCs"] call _fnc_addTextX;
	_textX = [nameInvaders, _chance, _textX, vehCSATTank, "Tanks"] call _fnc_addTextX;
	_textX = [nameInvaders, _chance, _textX, vehCSATAA, "AA Tanks"] call _fnc_addTextX;
	_minesAAF = _minesAAF - (detectedMines Occupants);
};

private _revealMineX = false;

if (count _minesAAF > 0) then {
	{
		if (random 100 < _chance) then {
			teamPlayer revealMine _x;
			_revealMineX = true;
		};
	} forEach _minesAAF;
};

if (_revealMineX) then {
	_textX = format ["%1 New Mines marked on your map<br/>", _textX];
};

if (_textX == "<t size='0.6' color='#C1C0BB'>Intel Found.<br/> <t size='0.5' color='#C1C0BB'><br/>") then {
	_textX = format ["<t size='0.6' color='#C1C0BB'>Intel Not Found.<br/> <t size='0.5' color='#C1C0BB'><br/>"];
};

[_textX, [safeZoneX, (0.2 * safeZoneW)], [0.25, 0.5], 30, 0, 0, 4] spawn bis_fnc_dynamicText;
