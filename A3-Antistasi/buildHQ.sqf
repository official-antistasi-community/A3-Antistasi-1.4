private ["_pos","_rnd","_posFire"];
_movedX = false;
if (petros != (leader group petros)) then
	{
	_movedX = true;
	groupPetros = createGroup rebelSide;
	publicVariable "groupPetros";
	[petros] join groupPetros;
	};
[petros,"remove"] remoteExec ["A3A_fnc_flagaction",0,petros];
petros switchAction "PlayerStand";
petros disableAI "MOVE";
petros disableAI "AUTOTARGET";

[getPos petros] call A3A_fnc_relocateHQObjects;

//if (_movedX) then {_nul = [] call A3A_fnc_empty};
petros setBehaviour "SAFE";
if (isNil "placementDone") then {placementDone = true; publicVariable "placementDone"};
sleep 5;
[Petros,"mission"] remoteExec ["A3A_fnc_flagaction",[rebelSide,civilian],petros];

