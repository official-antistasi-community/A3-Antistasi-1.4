
private ["_bld"];
_bld = _this select 0;
_nbrdoors = round (count ((configfile >> "cfgVehicles" >> (typeOf _bld) >> "UserActions") call bis_fnc_returnchildren))/2;
sleep 20;

for "_i" from 0 to _nbrdoors do
{
	//[_bld, "door_" + str _i + "_rot", "Door_Handle_" + str _i + "_rot_1", "Door_Handle_" + str _i + "_rot_2"] execVM "\A3\Structures_F\scripts\fn_Door_close.sqf";//cambiado para compatibilizar con nexus
	[_bld, "door_" + str _i + "_rot", "Door_Handle_" + str _i + "_rot_1", "Door_Handle_" + str _i + "_rot_2"] spawn BIS_fnc_DoorClose;//cambiado para compatibilizar con nexus
};
