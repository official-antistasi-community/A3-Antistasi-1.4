/****************************************************************
File: UPSMON_fnc_filter.sqf
Author: Robalo

Description:
	Filter cover objects
Parameter(s):
	<--- Object
Returns:
	boolean
****************************************************************/
private ["_type","_z","_bbox","_dz","_dy"]; 
    
if (_this isKindOf "Man") exitWith {false};
if (_this isKindOf "STATICWEAPON") exitWith {false}; 
if (_this isKindOf "Bird") exitWith {false}; 
if (_this isKindOf "BulletCore") exitWith {false}; 
if (_this isKindOf "Grenade") exitWith {false}; 
if (_this isKindOf "WeaponHolder") exitWith {false}; 
if (_this isKindOf "WeaponHolderSimulated") exitWith {false};
if (_this isKindOf "Sound") exitWith {false};
//if (!isTouchingGround _this) exitWith {false};
if (isBurning _this) exitWith {false};
if (["slop", (format ["%1", _this])] call BIS_fnc_inString) exitWith {false};
if (["fence", (format ["%1", _this])] call BIS_fnc_inString) then 
{
	If (!(_this isKindOf "Strategic")) exitwith {false};
};
 
_type = typeOf _this; 
if (_type == "") then 
{ 
    if (damage _this == 1) exitWith {false}; 
} else { 
	//if (_type in ["#soundonvehicle","#mark","#crater","#crateronvehicle","#soundonvehicle","#particlesource","#lightpoint","#slop"]) exitWith {false}; 
};
   
_z = (getPosATL _this) select 2; 
if (_z > 0.3) exitWith {false}; 
_bbox = boundingBoxReal _this;
_dz = ((_bbox select 1) select 2) - ((_bbox select 0) select 2);
_dy = abs(((_bbox select 1) select 0) - ((_bbox select 0) select 0));//width
if ((_dz > 0.35) && (_dy > 0.35) ) exitWith {true};

false