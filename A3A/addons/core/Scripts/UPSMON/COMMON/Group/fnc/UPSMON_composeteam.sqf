/****************************************************************
File: UPSMON_composeteam.sqf
Author: Azroul13

Description:
	Each units of the group is assigned to a team
Parameter(s):
	<--- group
Returns:
	----> Support Team (array of units)
	----> Assault Team (array of units)
	----> ATteam (array of units)
	----> AAteam (array of units)
****************************************************************/
private ["_grp","_units","_Assltteam","_Supportteam","_Atteam","_result","_units","_at","_unit","_weapon","_sweapon","_typeweapon"];

_grp = _this select 0;
	
_Assltteam = [];
_Supportteam = [];
_Atteam = [];
_AAteam = [];
_snpteam = [];
_mgteam = [];
_result = [];
	
if (({alive _x} count units _grp) == 0) exitwith {_result = [];_result;};
	
// add leader and people to team 1
_Supportteam pushback (vehicle (leader _grp));
_unitsleft = units _grp;
_unitsleft = _unitsleft - [leader _grp];
_unitsinvalid = [];
_vehiclesnbr = 0;

//Add vehicles with gunner in the support team
{
	If (alive _x) then
	{
		If (vehicle _x != _x) then
		{
			If (!(_x in (assignedCargo assignedVehicle _x))) then
			{
				If (!IsNull (gunner vehicle _x)) then
				{
					If (!(vehicle _x in _Supportteam)) then
					{
						_Supportteam pushback (vehicle _x);
						_vehiclesnbr = _vehiclesnbr + 1;
					};
					
					_unitsinvalid pushback _x;
				};
			};
		};
	}
	else
	{
		_unitsinvalid pushback _x;
	};
} foreach _unitsleft;

_unitsleft = _unitsleft -  _Supportteam;
_unitsleft = _unitsleft -  _unitsinvalid;


{
	If (alive _x) then
	{
		If (canmove _x) then
		{
			If (_x == vehicle _x) then
			{
				_weapon = currentweapon _x;
				_sweapon = secondaryWeapon _x;
				_typeweapon = tolower gettext (configFile / "CfgWeapons" / _weapon / "cursor");
				if (_sweapon != "") then 
				{
					_smagazineclass = (getArray (configFile / "CfgWeapons" / _sweapon / "magazines")) select 0;
					_ammo = tolower gettext (configFile >> "CfgMagazines" >> _smagazineclass >> "ammo");
					_irlock	= getNumber (configfile >> "CfgAmmo" >> _ammo >> "irLock");
					_laserlock	= getNumber (configfile >> "CfgAmmo" >> _ammo >> "laserLock");
					_airlock	= getNumber (configfile >> "CfgAmmo" >> _ammo >> "airLock");
					
					if (_airlock==2 && !(_ammo iskindof "BulletBase") && !(_x in _AAteam)) then
					{_AAteam pushback _x};
					if ((_irlock==0 || _laserlock==0) && 
					((_ammo iskindof "RocketBase") || (_ammo iskindof "MissileBase") || (_ammo iskindof "RocketBase") || (_ammo iskindof "MissileBase")) && !(_x in _ATteam)) then
					{_Atteam pushback _x};
				};
				
				if (!(_x in _Supportteam) && (_typeweapon in ["mg","srifle"] ||  _sweapon != "")) then
				{
					_Supportteam pushback _x;
					If (_typeweapon == "mg") then {_mgteam pushback _x;};
					If (_typeweapon == "srifle") then {_snpteam pushback _x;};
				};				
			};
		}
		else
		{
			_unitsinvalid pushback _x;
		};
	}
	else
	{
		_unitsinvalid pushback _x;
	};
} foreach _unitsleft;
	
//Add the rest to the Assltteam

_unitsleft = _unitsleft -  _unitsinvalid;
_Assltteam = _unitsleft - _Supportteam;


If ({alive _x && vehicle _x == _x} count units _grp <= 4) then
{
	If (_vehiclesnbr == 0) then
	{
		_Assltteam = units _grp;
	}
	else
	{
		if (count _Assltteam <= 1 && count _Supportteam > 1) then 
		{
			_arr2 = _Supportteam;
			
			{
				If (_x != vehicle (leader _grp)) then
				{
					If (count _arr2 > count _Assltteam) then
					{
						_Assltteam pushback _x;
						_arr2 = _arr2 - [_x];
					};
				};
			} foreach _Supportteam;
			
			_Supportteam = _arr2;
		};			
	};
}
else
{
	if (count _Assltteam <= 1 && count _Supportteam > 4) then 
	{
		_arr2 = _Supportteam;	
		{
			If (_x != vehicle (leader _grp)) then
			{
				If (vehicle _x == _x) then
				{
					If (count _arr2 > count _Assltteam) then
					{
						_Assltteam pushback _x;
						_arr2 = _arr2 - [_x];
					};
				};
			};
		} foreach _Supportteam;
	
		_Supportteam = _arr2;
	};	
};



{_x assignTeam "RED"} foreach _Assltteam;
{_x assignTeam "BLUE"} foreach _Supportteam;
	
_result = [_Supportteam,_Assltteam,_Atteam,_AAteam];
_result;