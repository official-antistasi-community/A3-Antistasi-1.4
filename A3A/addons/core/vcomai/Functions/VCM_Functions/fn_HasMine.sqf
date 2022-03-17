
/*
	Author: Genesis

	Description:
		This function will determine if the unit has a mine, satchel, or another explosive that could be used to blow shit up. 

	Parameter(s):
		0: OBJECT - Unit

	Returns:
		ARRAY - format [_hasSatchel, _actualObj, _hasMine, _satchelArray];
*/

private _hasMine = false;
private _magsAmmo = magazinesAmmo _this;
private "_pushArray";
if (isNil "_magsAmmo") exitWith {_pushArray = [false,[],false,[]];_pushArray};
private _hasSatchel = false;
private _actualObj = [];
private _satchelArray = [];

{
	private _mag = _x select 0;
	private _value = (configfile >> "CfgMagazines" >> _mag >> "nameSound") call BIS_fnc_getCfgData;
	
	if (_value isEqualTo "satchelcharge") then 
	{
		
		_satchelArray pushback [((configfile >> "CfgMagazines" >> _mag >> "ammo") call BIS_fnc_getCfgData),_mag];
		_hasSatchel = true;

	};
	if (_value isEqualTo "mine") then
	{
		_hasMine = true;
		_actualObj pushback [((configfile >> "CfgMagazines" >> _mag >> "ammo") call BIS_fnc_getCfgData),_mag];		
	};
	
	
} forEach _magsAmmo;

_pushArray = [_hasSatchel,_actualObj,_hasMine,_satchelArray];

_pushArray