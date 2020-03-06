private _unit = (_this select 0); //gets object from ace interaction menu (AIM)
private _player = (_this select 1); //gets player from AIM
private _vehicle = (_this select 2); // gets vehicle to loot to from AIM
private _unsorted_obj = (position _unit) nearObjects 2; //gets objects in a small radius around target body
private _vicFull = 0; // defines vehicle as not full
private _weaponsArray = []; //defines array for later
private _cfgWeapons = "true" configClasses (configFile >> "cfgWeapons"); //gets cfgWeapons classes
{
	private _weaponString = configName (_x);
	private _parents = [_x,true] call BIS_fnc_returnParents;
	
	if (("Rifle" in _parents) || ("Launcher" in _parents) || ("arifle" in _parents)) then {
		_weaponsArray pushBack [_weaponString];
	};
} forEach _cfgWeapons; //gets array of weapon strings for comparison

private _weaponsOnGround = [];
{
if ((weaponCargo _x) in _weaponsArray) then {
	_weaponsOnGround pushBack ((weaponCargo _x) select 0);

}}forEach _unsorted_obj; //sorts out weapons from _unsorted_obj

if ({(_vehicle canAdd _x)}forEach _weaponsOnGround) then{
{
    _vehicle addItemCargoGlobal [_x, 1];
} forEach _weaponsOnGround;
{
if ((weaponCargo _x) in _weaponsArray) then {
	clearWeaponCargoGlobal _x;
}}forEach _unsorted_obj;
} else {
_vicFull = 1;
}; //checks if can add weapons on the ground to vehicle then adds them and removes them from ground if it can, else sets variable _vicFull to 1



private _items = [];
private _backpacks = [];
if (_vicFull == 0) then {
	
    _items = magazines _unit;
    _items pushBack (weapons _unit);
    removeAllWeapons _unit;
	
    
    private _vest = vest _unit;
    if (!(_vest isEqualTo "") && (_vehicle canAdd (vest _unit))) then {
        _items pushBack _vest;
        removeVest _unit;
    };
    private _headgear = headgear _unit;
    if (!(_headgear isEqualTo "") && (_vehicle canAdd (headgear _unit))) then {
        _items pushBack _headgear;
        removeHeadgear _unit;
    };
    private _nvg = hmd _unit;
    if (!(_nvg isEqualTo "") && (_vehicle canAdd (hmd _unit))) then {
        _items pushBack _nvg;
        _unit unlinkItem _nvg;
    };
};
{
    _vehicle addItemCargoGlobal [_x, 1];
} forEach _items;

{
    _vehicle addBackpackCargoGlobal [_x, 1];
} forEach _backpacks;

if (_vicFull == 0) then{
private _displayName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
systemchat format ["Gear Looted to %1", _displayName];
} else {
systemchat "There is not enough space for all the gear";
}; //outcome depends on if the vehicle could add _weaponsOnGround to _vehicle