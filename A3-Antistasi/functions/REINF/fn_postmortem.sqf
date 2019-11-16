_victim = _this select 0;
sleep cleantime;
deleteVehicle _victim;
_groupX = group _victim;
if (!isNull _groupX) then
	{
	if ({alive _x} count units _groupX == 0) then {deleteGroup _groupX};
	}
else
	{
	if (_victim in staticsToSave) then {staticsToSave = staticsToSave - [_victim]; publicVariable "staticsToSave";};
	};
