private ["_pos","_rnd","_posFire"];
_movedX = false;
if (petros != (leader group petros)) then
{
	private _groupPetros = createGroup teamPlayer;
	[petros] join _groupPetros;
	_groupPetros selectLeader petros;
};
[petros,"remove"] remoteExec ["A3A_fnc_flagaction",0,petros];
petros switchAction "PlayerStand";
petros disableAI "MOVE";
petros disableAI "AUTOTARGET";

[getPos petros] call A3A_fnc_relocateHQObjects;

petros setBehaviour "SAFE";
if (isNil "placementDone") then {placementDone = true; publicVariable "placementDone"};
sleep 5;
[Petros,"mission"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],petros];

