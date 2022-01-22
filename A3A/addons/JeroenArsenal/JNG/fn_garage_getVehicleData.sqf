#include "defineCommon.inc"

params [ ["_vehicle",objNull,[objNull]] ];

private _index = _vehicle call jn_fnc_garage_getVehicleIndex;
if (_index == -1) exitWith {nil};

private _type = typeOf _vehicle;
private _cfg = (configfile >> "CfgVehicles" >> _type);
private _name = _vehicle getVariable ["JNA_Name",gettext (_cfg >> "displayName")];
private _index = _vehicle call jn_fnc_garage_getVehicleIndex;


//damage
private _damage = getAllHitPointsDamage _vehicle;
if(_damage isEqualTo [])then{
	_damage = getDammage _vehicle;
}else{
	_damage = _damage select 2;
};

//Ammo
private _ammoClassic = [];
{
	//magazinesAllTurrets type
	private _magazine = _x select 0;
	private _turret = _x select 1;
	private _ammo = _x select 2;

	//skip pylon ammo
	if (gettext (configfile >> "CfgMagazines" >> _magazine >> "pylonWeapon") isEqualTo "")then{
		private _found = false;
		{
			private _turret2 = _x select 0;
			private _magazine2 = _x select 1;
			private _ammo2 = _x select 2;
			if(_turret isEqualTo _turret2 && _magazine2 isEqualTo _magazine)exitWith{
				_found = true;
				_ammoClassic set [_foreachindex,[_turret, _magazine, (_ammo + _ammo2)]];
			};
		} forEach _ammoClassic;

		if(!_found)then{
			_ammoClassic pushback [_turret, _magazine, _ammo];
		};
	};
} forEach magazinesAllTurrets _vehicle;

//pylon ammo
private _ammoPylon = [];
{
	private _type = _x;
	private _amount = _vehicle ammoOnPylon (_foreachindex + 1);
	_ammoPylon pushback [_type,_amount];
} forEach getPylonMagazines _vehicle;

//texture

private _toPlain = {
	_this = tolower _this;
	//remove first \
	if(_this select [0,1] isEqualTo "\")then{_this = _this select [1,count _this];};
	//remove .paa
	if(_this select [(count _this)-4,count _this] isEqualTo ".paa")then{
		_this = _this select [0,(count _this)-4];
	};
	_this//return
};
private _texture = "";
private _currentTexture = getObjectTextures _vehicle;
{
	_currentTexture set [_foreachindex, _x call _toPlain];
} forEach _currentTexture;

{
	private _configName = configname _x;
	private _displayName = gettext (_x >> "displayName");
	private _found = false;
	if (_displayName != "") then {
		_found = true;
		{
			private _texture = _x call _toPlain;
			if!(_texture in _currentTexture)exitWith{_found = false;};
		} forEach getarray (_x >> "textures");
	};
	if(_found) exitWith{_texture = _configName;};

} foreach (configproperties [_cfg >> "textureSources","isclass _x",true]);

//animations
private _animations = [];
{
	private _configName = configname _x;
	if(_vehicle animationPhase _configName == 1)then{
		_animations pushback _configName;
	};
} foreach (configproperties [_cfg >> "animationSources","isclass _x",true]);

//attachtedWeapons
private _attachItem = [];
{
	private _typeAndNodeID = _x getVariable ["jnl_cargo",[-1,0]];
	private _type = _typeAndNodeID select 0;
	private _nodeID = _typeAndNodeID select 1;
	if(_type == 0)exitWith{
		_attachItem = ((_x call jn_fnc_garage_getVehicleData) select 0);
	};
} forEach attachedObjects _vehicle;


//set defaults
private _beingChanged = "";
private _locked = getPlayerUID player;
private _lockedName = name player;

//return
COMPILE_SAVE

[_data, _index]



