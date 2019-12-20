params [["_location", []]];

_oldPetros = if (isNil "petros") then {objNull}	else {petros};

groupPetros = if (! isNull _oldPetros && {side group _oldPetros == teamPlayer}) then {group _oldPetros} else {createGroup teamPlayer};
publicVariable "groupPetros";

private _position = if (count _location > 0) then {
	_location
} else {
	if (getPos _oldPetros isEqualTo [0,0,0]) then {
		getMarkerPos respawnTeamPlayer
	} else {
		getPos _oldPetros
	};
};

petros = groupPetros createUnit [typePetros, _position, [], 10, "NONE"];
publicVariable "petros";

groupPetros setGroupIdGlobal ["Petros","GroupColor4"];
petros setIdentity "friendlyX";

if (worldName == "Tanoa") then {petros setName "Maru"} else {petros setName "Petros"};

petros disableAI "MOVE";
petros disableAI "AUTOTARGET";

if (petros == leader groupPetros) then {
	[Petros,"mission"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],petros]
} else {
	[Petros,"buildHQ"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],petros]
};

call A3A_fnc_initPetros;

deleteVehicle _oldPetros;