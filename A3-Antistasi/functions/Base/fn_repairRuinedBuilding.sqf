//Repairs a destroyed building.
//Parameter can either be the ruin of a building, or the building itself buried underneath the ruins.

if (!isServer) exitWith { [1, "Server-only function miscalled", "fn_repairRuinedBuilding"] call A3A_fnc_log };

params ["_target"];

private _buildingToRepair = objNull;
private _ruins = objNull;

if (_target isKindOf "Ruins") then {
	//If it's been killed during play, it's  stored in here.
	_buildingToRepair = _target getVariable ["building", objNull];
	//Check if it's been made into a ruin by BIS_fnc_createRuin, rather than killed during play.
	if (isNull _buildingToRepair) then {
		_buildingToRepair = _target getVariable ["BIS_fnc_createRuin_object", objNull];
	};
	_ruins = _target;
} else {
	_buildingToRepair = _target;
	//If it's been killed during play, it's  stored in here.
	_ruins = _target getVariable ["ruins", objNull];
	//Check if it's been made into a ruin by BIS_fnc_createRuin
	if (isNull _ruins) then {
		_ruins = _target getVariable ["BIS_fnc_createRuin_ruin", objNull];
	};
};

//Haven't located the matching building - abort!
if (isNull _buildingToRepair || isNull _ruins) exitWith {false;};

_buildingToRepair setDammage 0;

deleteVehicle _ruins;

private _oldPos = getPos _buildingToRepair;
_buildingToRepair setPos [_oldPos select 0, _oldPos select 1, 0];

//Make sure we unhide, in case it was hidden by BIS_fnc_createRuin
[_buildingToRepair, false] remoteExec ["hideObject", 0, _buildingToRepair];

destroyedBuildings = destroyedBuildings - [_buildingToRepair];

true;
