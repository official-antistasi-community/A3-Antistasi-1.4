//Original Author: Barbolani
//Edited and updated by the Antstasi Community Development Team
scriptName "initVar.sqf";
private _fileName = "initVar.sqf";
[2,"initVar started",_fileName] call A3A_fnc_log;

call A3A_fnc_initVarCommon;

if (isServer) then {
	call A3A_fnc_initVarServer;
};

//Wait until the server has finished initVarServer, and we've received all required data.
waitUntil {!isNil "initVarServerCompleted"};

call A3A_fnc_initVarClient;

//Marks initVar as finished.
initVar = true;
["Server Information", "Variables Init Completed"] call A3A_fnc_customHint;
[2,"initVar completed",_fileName] call A3A_fnc_log;
