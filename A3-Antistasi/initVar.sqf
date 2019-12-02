//Original Author: Barbolani
//Edited and updated by the Antstasi Community Development Team
scriptName "initVar.sqf";
private _fileName = "initVar.sqf";
[2,"initVar started",_fileName] call A3A_fnc_log;

call compile preprocessFileLineNumbers "initVarCommon.sqf";

if (isServer) then {
	call compile preprocessFileLineNumbers "initVarServer.sqf";
};

//Wait until the server has finished initVarServer, and we've received all required data.
waitUntil {!isNil "initVarServerCompleted"};

call compile preprocessFileLineNumbers "initVarClient.sqf";

//Marks initVar as finished.
initVar = true;
if (isMultiplayer) then {[[petros,"hint","Variables Init Completed"],"A3A_fnc_commsMP"] call BIS_fnc_MP;};
[2,"initVar completed",_fileName] call A3A_fnc_log;
