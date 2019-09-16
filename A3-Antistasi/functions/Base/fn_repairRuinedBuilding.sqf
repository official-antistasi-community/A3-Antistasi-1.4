//Repairs a destroyed building.
//Parameter can either be the ruin of a building, or the building itself buried underneath the ruins.

params ["_target"];

private _buildingToRepair = objNull;
private _ruins = objNull;

if (_target isKindOf "Ruins") then {
	_buildingToRepair = _target getVariable ["building", objNull];
	_ruins = _target;
} else {
	_buildingToRepair = _target;
	_ruins = _target getVariable ["ruins", objNull];
};

//Haven't located the matching building - abort!
if (isNull _buildingToRepair || isNull _ruins) exitWith {false;};

_buildingToRepair setDammage 0;

deleteVehicle _ruins;

private _oldPos = getPos _buildingToRepair;
_buildingToRepair setPos [_oldPos select 0, _oldPos select 1, 0];

true;
