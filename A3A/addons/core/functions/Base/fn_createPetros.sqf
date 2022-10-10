#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params [["_location", []]];

private _oldPetros = if (isNil "petros") then {objNull} else {petros};
private _groupPetros = if (!isNull _oldPetros && {side group _oldPetros == teamPlayer}) then {group _oldPetros} else {createGroup teamPlayer};

// Hack-fix for bugged case where petros is killed by enemy while being moved
if (count _location > 0 && count units _groupPetros > 1) then { _groupPetros = createGroup teamPlayer };

private _position = if (count _location > 0) then {
	_location
} else {
	if (getPos _oldPetros isEqualTo [0,0,0]) then {
		getMarkerPos respawnTeamPlayer
	} else {
		getPos _oldPetros
	};
};

petros = [_groupPetros, FactionGet(reb,"unitPetros"), _position, [], 10, "NONE"] call A3A_fnc_createUnit;
publicVariable "petros";

deleteVehicle _oldPetros;		// Petros should now be leader unless there's a player in the group

call A3A_fnc_initPetros;
