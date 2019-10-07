private ["_pos","_rnd","_posFire"];
_movedX = false;
if ((call A3A_fnc_getPetros) != (leader group (call A3A_fnc_getPetros))) then
	{
	groupPetros = createGroup teamPlayer;
	publicVariable "groupPetros";
	[(call A3A_fnc_getPetros)] join groupPetros;
	groupPetros selectLeader (call A3A_fnc_getPetros);
	};
[(call A3A_fnc_getPetros),"remove"] remoteExec ["A3A_fnc_flagaction",0,(call A3A_fnc_getPetros)];
(call A3A_fnc_getPetros) switchAction "PlayerStand";
(call A3A_fnc_getPetros) disableAI "MOVE";
(call A3A_fnc_getPetros) disableAI "AUTOTARGET";

[getPos (call A3A_fnc_getPetros)] call A3A_fnc_relocateHQObjects;

(call A3A_fnc_getPetros) setBehaviour "SAFE";
if (isNil "placementDone") then {placementDone = true; publicVariable "placementDone"};
sleep 5;
[Petros,"mission"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],(call A3A_fnc_getPetros)];

