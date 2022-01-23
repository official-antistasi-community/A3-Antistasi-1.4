/****************************************************************
File: UPSMON_Checkratio.sqf
Author: Azroul13

Description:
	Comparison between Allied and Enemies forces in 800 radius
Parameter(s):
	<--- Group
	<--- Array of allied groups
	<--- Array of enies units
Returns:
	---> Ratio Eni/Allies
	---> Array of importants targets
****************************************************************/
private ["_grp","_allies","_enies","_pointsallies","_pointsenies","_ratedveh","_Itarget","_result","_points","_vehicle","_MagazinesUnit","_Cargo","_armor","_assignedvehicles"];

_grp = _this select 0;
_allies = _this select 1;
_enies = _this select 2;
_pointsallies = 0;
_pointsenies = 0;
_ratedveh = [];
_typeofeni = [];
_enicapacity = [];
_assignedvehicles = [];

_allies pushback _grp;

{
	If(!IsNull _x) then
	{
		If (({alive _x} count units _x) > 0) then
		{
			_pointsallies = _pointsallies + (_x getvariable ["UPSMON_Grpratio",0]);
		};
	};
} count _allies > 0;

{
	_eni = _x;
	_points = 0;

	If (!IsNull _eni) then
	{
		If (alive _eni) then
		{
			if ((vehicle _eni) != _eni && !(Isnull assignedVehicle _eni) && !(_eni in (assignedCargo assignedVehicle _eni))) then
			{
				if (!((assignedVehicle _eni) in _assignedvehicles)) then
				{
					_vehicle = assignedVehicle _eni;
					_assignedvehicles pushback _vehicle;
					_MagazinesUnit=(magazines _vehicle);
					_Cargo  = getNumber  (configFile >> "CfgVehicles" >> typeof _vehicle >> "transportSoldier");
					_armor  = getNumber  (configFile >> "CfgVehicles" >> typeof _vehicle >> "armor");
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
									If (!("aa1" in _enicapacity)) then
									{
										_enicapacity pushback "aa1";
									};
								};
							};

							if (_airlock == 2) then
							{
								if (!(_ammo iskindof "BulletBase")) then
								{
									If (!("aa2" in _enicapacity)) then
									{
										_enicapacity pushback "aa2";
									};
								};
							};

							if (_irlock>0 || _laserlock>0) then
							{
								if (_ammo iskindof "MissileBase") then
								{
									If (!("at2" in _enicapacity)) then
									{
										_enicapacity pushback "at2";
									};
								};
							};

							if (_ammo iskindof "ShellBase") then
							{
								//if (!(arti in _typeofgrp)) then
								//{
									If (!("at3" in _enicapacity)) then
									{
										_enicapacity pushback "at3";
									};
								//};
							};

							if (_ammo iskindof "BulletBase") then
							{
								if (_hit >= 40) then
								{
									If (!("at1" in _enicapacity)) then
									{
										_enicapacity pushback "at1";
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
						If (!("car" in _typeofeni)) then
						{
							_typeofeni pushback "car";
						};

						If (_armor >= 500) then
						{
							If (!("heavy" in _typeofeni)) then
							{
								_typeofeni pushback "heavy";
							};
						};

						If (_armor >= 250 && _armor < 500) then
						{
							If (!("medium" in _typeofeni)) then
							{
								_typeofeni pushback "medium";
							};
						};

						If (_armor < 250) then
						{
							If (!("light" in _typeofeni)) then
							{
								_typeofeni pushback "light";
							};
						};
					};

					If (_vehicle iskindof "air") then
					{
						If (!("air" in _typeofeni)) then
						{
							_typeofeni pushback "air";
						};
					};

					If (_vehicle iskindof "Ship") then
					{
						If (!("Ship" in _typeofeni)) then
						{
							_typeofeni pushback "Ship";
						};
					};

					If (!IsNull (Gunner _vehicle)) then
					{
						If (!("armed" in _typeofeni)) then
						{
							_typeofeni pushback "armed";
						};
					};

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

					if (_airlock==2 && !(_ammo iskindof "BulletBase") && !("aa2" in _enicapacity) && (_ammo in _smagazineclass)) then
					{_enicapacity pushback "aa2";};
					if ((_irlock>0 || _laserlock>0) &&
					((_ammo iskindof "RocketBase") || (_ammo iskindof "MissileBase")) && !("at2" in _enicapacity) && (_ammo in _smagazineclass)) then
					{_enicapacity pushback "at2";};
					if ((_irlock==0 || _laserlock==0) &&
					((_ammo iskindof "RocketBase") || (_ammo iskindof "MissileBase")) && !("at1" in _enicapacity) && (_ammo in _smagazineclass)) then
					{_enicapacity pushback "at1";};

					If (_ammo iskindof "ShellBase" || (_ammo iskindof "RocketBase") || (_ammo iskindof "MissileBase") && !(_ammo in _ammorated) && (_ammo in _smagazineclass)) then
					{
						_points = _points + _hit;
						_ammorated pushback _ammo;
					};
				} foreach _MagazinesUnit;

				if (!("infantry" in _typeofeni)) then
				{_typeofeni pushback "infantry";};
			};
			_points = _points + ((1+(morale _eni)) + (1-(damage _eni)) + ((_eni skillFinal "Endurance") + (_eni skillFinal "courage")));
			_pointsenies = _points;
		};
	};
} foreach _enies;

//diag_log str _pointsenies;
//diag_log str _pointsallies;
if (_pointsallies == 0) then {_pointsallies = 0.1};//by Barbolani, to avoid bugs.
_ratio = _pointsenies/_pointsallies;

_result = [_ratio,_enicapacity,_typeofeni];
_result;