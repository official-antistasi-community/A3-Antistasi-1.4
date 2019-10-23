/****************************************************************
File: UPSMON_Rearm.sqf
Author: Azroul13

Description:
	
Parameter(s):
	<--- Array of units
Returns:
	Array of units
****************************************************************/

private ["_unit","_magsneeded","_supplylist","_supplies","_supply","_ammo","_points","_ammoclass","_array","_list","_containers"];

_unit = _this select 0;
_magsneeded = _this select 1;
_supplylist = [];

If (!(_unit getvariable ["UPSMON_Rearming",false])) then
{
	If (canmove _unit) then
	{
		If (unitready _unit) then
		{
			If (IsNull(assignedTarget _unit) || (getposATL (assignedTarget _unit)) vectordistance (getposATL _unit) > 300) then
			{
				If (_unit getvariable ["UPSMON_SUPSTATUS",""] == "") then
				{
					If (vehicle _unit == _unit) then
					{
						_supplies = (getposATL _unit) nearSupplies 50;
						
						{
							If (!(_x getvariable ["UPSMON_Supplyuse",false])) then
							{
								_supply = _x;
								_ammo = [];
								if (_supply != _unit) then
								{
									If (_supply iskindof "MAN") then
									{
										If (alive _supply) then
										{
											if (side _supply == side _unit) then
											{
												_ammo = (getMagazineCargo backpackContainer _supply) select 0;
											};
										}
										else
										{
											_containers = [];
											_containers pushback (backpackContainer _supply);
											_containers pushback (vestContainer _supply);
											_containers pushback (uniformContainer _supply);
											{
												_ammo = [_ammo, (getMagazineCargo _x) select 0] call BIS_fnc_arrayPushStack
											} foreach _containers;
										};
									}
									else
									{
										If (_supply iskindof "CAR" || _supply iskindof "TANK" || _supply iskindof "AIR") then
										{
											If ((IsNull (driver _supply)) || !alive (driver _supply) || (side (driver _supply) == side _unit)) then
											{
												_ammo = (getMagazineCargo _supply) select 0;
											};
										}
										else
										{
											_ammo = (getMagazineCargo _supply) select 0;
										};
									};
								};
							
								If (count _ammo > 0) then
								{
									_points = 0;
									_ammoclass = [];							
									If ({_x in (_magsneeded select 0)} count _ammo > 0) then
									{
										{
											if (_x in (_magsneeded select 0)) then
											{
												If (_unit canAdd _x) then
												{
													_ammoclass pushback _x;
												};
											};
										} foreach _ammo;
										_points = _points + 100;
									};
								
									If ({_x in (_magsneeded select 1)} count _ammo > 0) then
									{
										{
											if (_x in (_magsneeded select 1)) then
											{
												If (_unit canAdd _x) then
												{
													_ammoclass pushback _x;
												};
											};
										} foreach _ammo;
										_points = _points + 50;
									};								
								
									_supplylist pushback [_supply,_ammoclass,_points];
								};
							};
						} foreach _supplies;
						
						If (count _supplylist > 0) then
						{
							_list = [_supplylist, [], {_x select 2}, "DESCEND"] call BIS_fnc_sortBy;
							_array = _list select 0;
							_array resize 2;
							[_unit,_array] spawn UPSMON_DoRearm;
						};
					};
				};
			};
		};
	};
};