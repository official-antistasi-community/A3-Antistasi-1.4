_filename = "fn_requestDataFromServer";

if (!isServer) exitWith { [1, "Server-only function miscalled", _filename] call A3A_fnc_log };
if (!isRemoteExecuted) exitWith { [1, "Function not remote executed", _filename] call A3A_fnc_log };

if (isNil "serverInitDone") then { waitUntil {sleep 1; !(isNil "serverInitDone")} };

params ["_varName"];

_varValue = missionNamespace getVariable _varName;
if (isNil "_varValue") exitWith {
	[1, format ["Var %1 not defined on server", _varName], _filename] call A3A_fnc_log
};

[_varName, _varValue] remoteExec ["A3A_fnc_setDataOnClient", remoteExecutedOwner];
