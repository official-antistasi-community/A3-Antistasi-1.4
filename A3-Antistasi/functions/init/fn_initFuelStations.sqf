/*
Author: [Killerswin2]
    set fuelcargo or acefuelcargo from lasted save or start
Arguments:
	nil
Return Value:
    nil

Scope: Server
Environment: Unscheduled
Public: yes
Dependencies:

Example:
    [] call A3A_fnc_initFuelStations
*/

private _fnc_mapInfo = compile preProcessFileLineNumbers ("Map\"+ toLower worldName +"Info.sqf");
("fuelStation" call _fnc_mapInfo) params [["_posFuelStation", [], [[]]], ["_blacklistIndexFuel",[],[[]]]];

private _fuelAmountArray = profileNamespace getVariable ["A3A_fuelAmountleftArray"];

if (!(isNil "_fuelAmountArray")) then {
	//get last fuel from save
} else {
	// first time to set fuel
	if(A3A_hasACE) then {
		[A3A_fuelStations[_i], 50000] ace_refuel_fnc_setFuel; // only call on fuels that are not blacklisted and first zone init.
	};
};