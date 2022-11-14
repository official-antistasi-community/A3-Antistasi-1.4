/****************************************************************
File: UPSMON_getequipment.sqf
Author: Azroul13

Description:
	In order to respawn a unit with the same loadout
	Called from UPSMON.sqf
Parameter(s):
	<--- unit
Returns:
	Array of equipments
****************************************************************/

private ["_unit","_maguniformunit","_magbackunit","_magvestunit","_uniform","_headgear","_vest","_bag","_classbag","_itemsunit","_weaponsunit","_equipmentarray","_assigneditems"];
_unit = _this;
_maguniformunit = [];
_magbackunit = [];
_magvestunit = [];


_uniform = uniform _unit;
If (_uniform != "") then {_maguniformunit = getMagazineCargo uniformContainer _unit;};

_headgear = headgear _unit;

_vest = vest _unit;
If (_vest != "") then {_magvestunit = getMagazineCargo vestContainer _unit;};

_bag = unitBackpack _unit;
_classbag = typeOf _bag;
If (_classbag != "") then {_magbackunit = getMagazineCargo backpackContainer _unit;};


_itemsunit = items _unit;
_assigneditems = [];//by BARBO
//_assigneditems = assignedItems _unit;//COMMENT BY BARBO
_primaryweapon = [];
_secondaryweapon = [];
_handgunweapon = [];
If (primaryweapon _unit != "") then
{
	_primaryweapon pushback (primaryweapon _unit);
	_primaryweapon pushback (primaryWeaponItems _unit);
	_primaryweapon pushback ((getArray (configFile >> "CfgWeapons" >> (primaryweapon _unit) >> "magazines")) select 0);
};

If (secondaryweapon _unit != "") then
{
	_secondaryweapon pushback (secondaryweapon _unit);
	_secondaryweapon pushback (secondaryWeaponItems _unit);
	_secondaryweapon pushback ((getArray (configFile >> "CfgWeapons" >> (secondaryweapon _unit) >> "magazines")) select 0);
};

If (handgunWeapon _unit != "") then
{
	_handgunweapon pushback (handgunWeapon _unit);
	_handgunweapon pushback (handgunItems _unit);
	_handgunweapon pushback ((getArray (configFile >> "CfgWeapons" >> (handgunWeapon _unit) >> "magazines")) select 0);
};

_weaponsunit = [_primaryweapon,_secondaryweapon,_handgunweapon];

_allmag = [] + [_maguniformunit] + [_magvestunit] + [_magbackunit];
_equipmentarray = [_uniform,_headgear,_vest,_classbag,_itemsunit,_assigneditems,_allmag,_weaponsunit];
_equipmentarray