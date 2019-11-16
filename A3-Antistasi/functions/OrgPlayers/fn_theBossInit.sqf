private ["_unit","_groups","_oldUnit","_oldProviders","_HQ","_providerModule","_used"];
_unit = _this select 0;
_groups = hcAllGroups theBoss;
_oldUnit = theBoss;

if (!isNil "_groups") then
  {
  {
  _oldUnit hcRemoveGroup _x;
  } forEach _groups;
  };
_oldUnit synchronizeObjectsRemove [HC_commanderX];
//apoyo synchronizeObjectsRemove [_oldUnit];
HC_commanderX synchronizeObjectsRemove [_oldUnit];
theBoss = _unit;
publicVariable "theBoss";
[group _unit, _unit] remoteExec ["selectLeader",_unit];
theBoss synchronizeObjectsAdd [HC_commanderX];
HC_commanderX synchronizeObjectsAdd [theBoss];
//apoyo synchronizeObjectsAdd [theBoss];
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