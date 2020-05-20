_filename = "fn_setDataOnClient";

if (isServer) exitWith {[1, "Client-only function miscalled", _filename] call A3A_fnc_log};

params ["_varName", "_varValue"];

switch (_varName) do {
	case "destroyedBuildings": {
		destroyedBuildings = _varValue;
		{ hideObject _x } forEach destroyedBuildings;
	};
	default {
		missionNamespace setVariable ["_varName", "_varValue"];
	};
};

