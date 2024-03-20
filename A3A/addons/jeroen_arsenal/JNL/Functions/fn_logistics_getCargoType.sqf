/*
	Author: Jeroen Notenbomer

	Description:
	Returns the type of object that you want to load

	Parameter(s):
	OBJECT vehicle
	OBJECT object to load on vehicle

	Returns:
	//-1 if type of this is not found, otherwise returns the cargo type
*/


params ["_object"];

//private _simulation =  tolower gettext (configfile >> "CfgVehicles" >> (typeOf _object) >> "simulation");
//private _type  = if(_simulation isEqualTo "tankx")then{0}else{1};//0 = weapon, 1 = cargo
_objectModel = getText(configfile >> "CfgVehicles" >> typeOf _object >> "model");
_return = -1;
if (_object isKindOf "CAManBase") exitWith {1};
{
	if(_x select 0 isEqualTo _objectModel) exitWith {_return = _x select 3;};
}forEach jnl_attachmentOffset;

_return