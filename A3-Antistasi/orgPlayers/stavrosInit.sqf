private ["_unit","_grupos","_oldUnit","_oldProviders","_HQ","_providerModule","_used"];
_unit = _this select 0;
_grupos = hcAllGroups theBoss;
_oldUnit = theBoss;

if (!isNil "_grupos") then
  {
  {
  _oldUnit hcRemoveGroup _x;
  } forEach _grupos;
  };
_oldUnit synchronizeObjectsRemove [HC_comandante];
//apoyo synchronizeObjectsRemove [_oldUnit];
HC_comandante synchronizeObjectsRemove [_oldUnit];
theBoss = _unit;
publicVariable "theBoss";
[group _unit, _unit] remoteExec ["selectLeader",_unit];
theBoss synchronizeObjectsAdd [HC_comandante];
HC_comandante synchronizeObjectsAdd [theBoss];
//apoyo synchronizeObjectsAdd [theBoss];
if (!isNil "_grupos") then
	{
  	{_unit hcSetGroup [_x]} forEach _grupos;
  	}
else
	{
	{
	if (_x getVariable ["esNATO",false]) then
		{
		_unit hcSetGroup [_x];
		};
	if ((leader _x getVariable ["GREENFORSpawn",false]) and (!isPlayer leader _x)) then
		{
		_unit hcSetGroup [_x];
		};
	} forEach allGroups;
	};

if (isNull _oldUnit) then
	{
	[_oldUnit,[group _oldUnit]] remoteExec ["hcSetGroup",_oldUnit];
	};
[] remoteExec ["A3A_fnc_statistics",[buenos,civilian]];