
params ["_varName", "_varValue"];
A3A_saveTarget params ["_serverID", "_campaignID", "_map"];

if (isNil "_varValue") exitWith {};			// hmm...

// Simple version for new missionProfileNamespace saves
if (_serverID isEqualType false) exitWith {
	missionProfileNamespace setVariable [format ["%1%2", _varName, _campaignID], _varValue];
};

private _saveExt = if (_map == "Tanoa") then {
	format["%1%2%3",_serverID,_campaignID,"WotP"];
} else {
	format["%1%2%3%4",_serverID,_campaignID,"Antistasi",_map];
};
profileNamespace setVariable [_varName + _saveExt, _varValue];
