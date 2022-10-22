#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

if (petros != (leader group petros)) then
{
	private _groupPetros = createGroup teamPlayer;
	[petros] join _groupPetros;
	_groupPetros selectLeader petros;
};

petros switchAction "PlayerStand";
petros disableAI "MOVE";
petros disableAI "AUTOTARGET";
petros setBehaviour "SAFE";

// Put petros back on the server, otherwise might cause issues on disconnect
[group petros, 2] remoteExec ["setGroupOwner", 2];

[getPos petros, false] remoteExec ["A3A_fnc_relocateHQObjects", 2];

if (isNil "placementDone") then {placementDone = true; publicVariable "placementDone"};
sleep 5;
["HQPlaced", [getPos petros]] call EFUNC(Events,triggerEvent);
