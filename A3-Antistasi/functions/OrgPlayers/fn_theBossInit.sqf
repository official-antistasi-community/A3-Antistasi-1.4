private ["_unit","_groups","_oldUnit","_oldProviders","_HQ","_providerModule","_used"];
private _filename = "fn_theBossInit";
_unit = _this select 0;
_groups = hcAllGroups theBoss;
_oldUnit = theBoss;

[3, format ["Player %1 has been selected for Boss position.",name _unit],_filename] call A3A_fnc_log;
[3, format ["Removing %1 from Boss roles.",name theBoss],_filename] call A3A_fnc_log;

if (!isNil "_groups") then
  {
	{
		_oldUnit hcRemoveGroup _x;
	} forEach _groups;
  };
_oldUnit synchronizeObjectsRemove [HC_commanderX];
//apoyo synchronizeObjectsRemove [_oldUnit];
HC_commanderX synchronizeObjectsRemove [_oldUnit];

[3, format ["New boss %1 being set.", _unit],_filename] call A3A_fnc_log;
theBoss = _unit;
publicVariable "theBoss";

[group _unit, _unit] remoteExec ["selectLeader",_unit];
theBoss synchronizeObjectsAdd [HC_commanderX];
HC_commanderX synchronizeObjectsAdd [theBoss];
//apoyo synchronizeObjectsAdd [theBoss];

[3, format ["Player %1 should now be boss: %2.", name _unit, name theBoss],_filename] call A3A_fnc_log;

if (!isNil "_groups") then
	{
  	{_unit hcSetGroup [_x]} forEach _groups;
  	}
else
	{
	{
	if (_x getVariable ["esNATO",false]) then
		{
		_unit hcSetGroup [_x];
		};
	if ((leader _x getVariable ["spawner",false]) and (!isPlayer leader _x) and (side _x == teamPlayer)) then
		{
		_unit hcSetGroup [_x];
		};
	} forEach allGroups;
	};

if (isNull _oldUnit) then
	{
	[_oldUnit,[group _oldUnit]] remoteExec ["hcSetGroup",_oldUnit];
	};
[] remoteExec ["A3A_fnc_statistics",[teamPlayer,civilian]];