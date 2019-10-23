/****************************************************************
File: UPSMON_SetLeaderGrp.sqf
Author: Azroul13

Description:
	Set the leader of the group
Parameter(s):
	<--- Unit or Group
Returns:
	---> Leader
****************************************************************/

private ["_unit","_Leader", "_grp"];

_unit = _this select 0;
_grp = group _unit;
_Leader = leader (_grp);

if ((_unit iskindof "Man")) then {

	if(_unit != _Leader) then {
		_grp selectLeader _unit;
	};

} else {

	if (!isnull(commander _unit) ) then {
		_unit = commander _unit;
	}else{
		if (!isnull(driver _unit) ) then {
			_unit = driver _unit;
		}else{
			_unit = gunner _unit;
		};
	};
	_grp selectLeader _unit;
};

_Leader