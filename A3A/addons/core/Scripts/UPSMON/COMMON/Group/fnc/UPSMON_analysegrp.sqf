/****************************************************************
File: UPSMON_analysegrp.sqf
Author: Azroul13

Description:
	get all information about the group
Parameter(s):
	<--- Group
Returns:
	----> type of the group (array) ["arti","infantry","incargo","tank","transport","armed","apc","car","ship","static","staticbag"]
	----> Capacity of the group (array) ["aa1","aa2","at1","at2","at3"] [AAcapability but without missile,AA missile,At Rocket,At missile,At gun]
	----> Assigned vehicles (array)
****************************************************************/

private ["_grp","_assignedvehicles","_typeofgrp","_capacityofgrp","_result","_vehicleClass","_MagazinesUnit","_Cargo","_gunner","_ammo","_irlock","_laserlock","_airlock","_checkbag","_staticteam","_points","_vehicle"];
_grp = _this select 0;
	
_assignedvehicles = [];
_typeofgrp = [];
_capacityofgrp = [];
_engagementrange = 600;
_result = [];
_points = 0;
	
if (({alive _x} count units _grp) == 0) exitwith {_result = [_typeofgrp,_capacityofgrp,_assignedvehicles,_engagementrange];_result;};

_artibatteryarray = [];

{
	If (alive _x) then
	{
		if ((vehicle _x) != _x && !(Isnull assignedVehicle _x) && !(_x in (assignedCargo assignedVehicle _x))) then 
		{
			if (!((assignedVehicle _x) in _assignedvehicles)) then 
			{
				_vehicle = assignedVehicle _x;
				_assignedvehicles pushback _vehicle;
				_MagazinesUnit = (magazines _vehicle);
				_Cargo  = getNumber  (configFile >> "CfgVehicles" >> typeof _vehicle >> "transportSoldier");
				_armor  = getNumber  (configFile >> "CfgVehicles" >> typeof _vehicle >> "armor");
				_support =  tolower gettext (configFile >> "CfgVehicles" >> typeof _vehicle >> "vehicleClass");
				_cfgArtillery = getnumber (configFile >> "cfgVehicles" >> typeOf (_vehicle) >> "artilleryScanner");
				_repair = getnumber (configFile >> "cfgVehicles" >> typeOf (_vehicle) >> "transportRepair");
				_fuel = getnumber (configFile >> "cfgVehicles" >> typeOf (_vehicle) >> "transportFuel");
				_munsupply = getnumber (configFile >> "cfgVehicles" >> typeOf (_vehicle) >> "attendant");
				
				_gunner = gunner _vehicle;
				_ammorated = [];
					
				_points = _points + 1;
					
				If (!IsNull _gunner) then
				{
					If (alive _gunner) then
					{
						{
							_ammo = tolower gettext (configFile >> "CfgMagazines" >> _x >> "ammo");
							_irlock	= getNumber (configfile >> "CfgAmmo" >> _ammo >> "irLock");
							_laserlock	= getNumber (configfile >> "CfgAmmo" >> _ammo >> "laserLock");
							_airlock	= getNumber (configfile >> "CfgAmmo" >> _ammo >> "airLock");
							_hit	= getNumber (configfile >> "CfgAmmo" >> _ammo >> "hit");
					
							if (_airlock == 1) then
							{
								if (_ammo iskindof "BulletBase") then
								{
									If (!("aa1" in _capacityofgrp)) then
									{
										_capacityofgrp pushback "aa1";
									};
								};
							};
							
							if (_airlock == 2) then
							{
								if (!(_ammo iskindof "BulletBase")) then
								{
									If (!("aa2" in _capacityofgrp)) then
									{
										_capacityofgrp pushback "aa2";
									};
								};
							};

							if (_irlock>0 || _laserlock>0) then
							{
								if (_ammo iskindof "MissileBase") then
								{
									If (!("at2" in _capacityofgrp)) then
									{
										_capacityofgrp pushback "at2";
									};
								};
							};

							if (_ammo iskindof "ShellBase") then
							{
								if (!("arti" in _typeofgrp)) then
								{
									If (!("at3" in _capacityofgrp)) then
									{
										_capacityofgrp pushback "at3";
									};
								};
							};
					
							if (_ammo iskindof "BulletBase") then
							{
								if (_hit >= 40) then
								{
									If (!("at1" in _capacityofgrp)) then
									{
										_capacityofgrp pushback "at1";
									};						
								};
							};

							If (!(_ammo in _ammorated)) then
							{
								_points = _points + _hit;
								_ammorated pushback _ammo;
							};
						
						} foreach _MagazinesUnit;
					};
				};
					
				_points = _points + _armor;

				If (_vehicle iskindof "car") then
				{
					If (!("car" in _typeofgrp)) then
					{
						_typeofgrp pushback "car";
					};
					
					If (_armor >= 500) then
					{
						If (!("heavy" in _typeofgrp)) then
						{
							_typeofgrp pushback "heavy";
						};
					};
				
					If (_armor >= 250 && _armor < 500) then
					{
						If (!("medium" in _typeofgrp)) then
						{
							_typeofgrp pushback "medium";
						};
					};
				
					If (_armor < 250) then
					{
						If (!("light" in _typeofgrp)) then
						{
							_typeofgrp pushback "light";
						};
					};					
				};

				If (_vehicle iskindof "staticweapon") then
				{
					If (!("static" in _typeofgrp)) then
					{
						_typeofgrp pushback "static";
					};
				};

				If (_vehicle iskindof "air") then
				{
					If (!("air" in _typeofgrp)) then
					{
						_typeofgrp pushback "air";
					};
				};
				
				If (_vehicle iskindof "PLANE") then
				{
					If ("aa2" in _capacityofgrp || "aa1" in _capacityofgrp || "at1" in _capacityofgrp || "at2" in _capacityofgrp) then
					{
						If (!("plane" in _typeofgrp)) then
						{
							_typeofgrp pushback "plane";
						};
					};
				};
				
				If (_vehicle iskindof "Ship") then
				{
					If (!("Ship" in _typeofgrp)) then
					{
						_typeofgrp pushback "Ship";
					};
				};
				
				If (_cargo >= 6) then
				{
					If (!("transport" in _typeofgrp)) then
					{
						_typeofgrp pushback "transport";
					};
				};
				
				If (!IsNull (Gunner _vehicle)) then
				{
					If (!("armed" in _capacityofgrp)) then
					{
						_capacityofgrp pushback "armed";
						_engagementrange = 1000;
					};
				};
				
				If (_cfgArtillery == 1) then 
				{
					If (!(_vehicle in _artibatteryarray)) then
					{
						_artibatteryarray pushback _vehicle;
						_grp setvariable ["UPSMON_Battery",_artibatteryarray];
					};
					
					If (!("arti" in _typeofgrp)) then
					{
						_typeofgrp pushback "arti";
					};
				};
				
				If (_support == "Support") then 
				{
					If (!("supply" in _typeofgrp)) then
					{
						_typeofgrp pushback "supply";
					};
					
					If (_repair > 0) then
					{
						if (!("repair" in _capacityofgrp)) then
						{
							_capacityofgrp pushback "repair";
						};
					};
										
					If (_fuel > 0) then
					{
						if (!("fuel" in _capacityofgrp)) then
						{
							_capacityofgrp pushback "fuel";
						};
					};
					
					If (_munsupply > 0) then
					{
						if (!("ammo" in _capacityofgrp)) then
						{
							_capacityofgrp pushback "ammo";
						};
					};
					
					If (!("support" in _typeofgrp)) then
					{
						_typeofgrp pushback "support";
					};
				};
				
				if (_vehicle iskindof "tank" && !("tank" in _typeofgrp)) then 
				{_typeofgrp pushback "tank";};
				if (_vehicle iskindof "Wheeled_APC_F" && !("apc" in _typeofgrp)) then 
				{_typeofgrp pushback "apc";};
					
			};		
		}
		else
		{
			If (vehicle _x != _x) then
			{
				If (!((assignedVehicle _x) in _assignedvehicles)) then
				{
					_assignedvehicles pushback (assignedVehicle _x);
				}
			};
			
			_sweapon = secondaryWeapon _x;
			_MagazinesUnit=(magazines _x);
			_smagazineclass = [];
			If (_sweapon != "") then 
			{
				_smagazineclass = getArray (configFile >> "CfgWeapons" >> _sweapon >> "magazines");
			};
			_ammorated = [];
			
			_points = _points + 1;
				
			{
				_ammo = tolower gettext (configFile >> "CfgMagazines" >> _x >> "ammo");
				_irlock	= getNumber (configfile >> "CfgAmmo" >> _ammo >> "irLock");
				_laserlock	= getNumber (configfile >> "CfgAmmo" >> _ammo >> "laserLock");
				_airlock	= getNumber (configfile >> "CfgAmmo" >> _ammo >> "airLock");
				_hit	= getNumber (configfile >> "CfgAmmo" >> _ammo >> "hit");

				If (_airlock==2) then
				{
					if (!(_ammo iskindof "BulletBase")) then
					{
						If (_ammo in _smagazineclass) then
						{
							If (!("aa2" in _capacityofgrp)) then
							{
								_capacityofgrp pushback "aa2";
							};
						};
					};
				};
				
				If (_irlock>0 || _laserlock>0) then
				{
					if ((_ammo iskindof "RocketBase") || (_ammo iskindof "MissileBase")) then
					{
						If (_ammo in _smagazineclass) then
						{
							If (!("at2" in _capacityofgrp)) then
							{
								_capacityofgrp pushback "at2";
							};
						};
					};
				};

				If (_irlock==0 || _laserlock==0) then
				{
					if ((_ammo iskindof "RocketBase") || (_ammo iskindof "MissileBase")) then
					{
						If (_ammo in _smagazineclass) then
						{
							If (!("at1" in _capacityofgrp)) then
							{
								_capacityofgrp pushback "at1";
							};
						};
					};
				};
				
				If (_ammo iskindof "ShellBase" || (_ammo iskindof "RocketBase") || (_ammo iskindof "MissileBase") && !(_ammo in _ammorated) && (_ammo in _smagazineclass)) then
				{
					_points = _points + _hit;
					_ammorated pushback _ammo;
				};
			} foreach _MagazinesUnit;
				
			if (!("infantry" in _typeofgrp)) then 
			{_typeofgrp pushback "infantry";};
		};
		_points = _points + ((1+(morale _x)) + (1-(damage _x)) + ((_x skillFinal "Endurance") + (_x skillFinal "courage")));
	};
	
} foreach units _grp;
	
_checkbag = [_grp] call UPSMON_GetStaticTeam;
_staticteam = _checkbag select 0;
If (count _staticteam == 2) then
{
	_cfgArtillery = getnumber (configFile >> "cfgVehicles" >> (_checkbag select 1) >> "artilleryScanner");
	
	_capacityofgrp pushback ["staticbag"];
	_engagementrange = 1000;
	
	If (_cfgArtillery == 1) then
	{
		If (!("arti" in _typeofgrp)) then
		{
			_typeofgrp pushback "arti";
		};
		
		If (!((_staticteam select 0) in _artibatteryarray)) then
		{
			_artibatteryarray pushback _staticteam;
			_grp setvariable ["UPSMON_Battery",_artibatteryarray];
		};

		If (count (_grp getvariable ["UPSMON_Mortarmun",[]]) == 0) then
		{
			_rounds = [_checkbag select 1] call UPSMON_GetDefaultmun;
			_grp setvariable ["UPSMON_Mortarmun",_rounds];
		};
	};
};

[_grp,_typeofgrp] call UPSMON_AddtoArray;

_points = _points;

{
	If (!IsNull _x) then
	{
		If ((_renfgroup getvariable ["UPSMON_GrpToRenf",ObjNull]) == _grp) then
		{
			If (({alive _x && !(captive _x)} count units _x) > 0) then
			{
				_points = _points + (_x getvariable ["UPSMON_Grpratio",0]);
			};
		};
	};
} foreach (_grp getvariable ["UPSMON_RenfGrps",[]]);

_grp setvariable ["UPSMON_Grpratio",_points];
_grp setvariable ["UPSMON_GroupCapacity",_capacityofgrp];
_grp setvariable ["UPSMON_typeofgrp",_typeofgrp];
_grp setvariable ["UPSMON_Assignedvehicle",_assignedvehicles];

If (count _assignedvehicles > 0) then
{
	_array = [];
	
	{
		If (canmove _x) then
		{
			If (driver _x in units _grp) then
			{
				_array pushback _x;
			};
		};
	} foreach _assignedvehicles;
	_grp setvariable ["UPSMON_LastAssignedvehicle",_array];
};

If (count (_grp getvariable ["UPSMON_LastAssignedvehicle",_assignedvehicles]) > 0) then
{
	_array = [];
	
	{
		If (!IsNull _x) then
		{
			If (canmove _x) then
			{
				If (driver _x in units _grp) then
				{
					_array pushback _x;
				};
			};
		};
	} foreach _assignedvehicles;
	_grp setvariable ["UPSMON_LastAssignedvehicle",_array];
};
	
//if (UPSMON_Debug>0) then {diag_log format ["Grpcompos/ typeofgrp:%1 Capacity:%2 Assignedvehicles:%3 range:%4 Points:%5",_typeofgrp,_capacityofgrp,_assignedvehicles,_engagementrange,_points];};
	
_result = [_typeofgrp,_capacityofgrp,_assignedvehicles,_engagementrange];
_result;