_muerto = _this select 0;
sleep cleantime;
deleteVehicle _muerto;
_grupo = group _muerto;
if (!isNull _grupo) then
	{
	if ({alive _x} count units _grupo == 0) then {deleteGroup _grupo};
	}
else
	{
	if (_muerto in staticsToSave) then {staticsToSave = staticsToSave - [_muerto]; publicVariable "staticsToSave";};
	};
