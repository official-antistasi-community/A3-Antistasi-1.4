_units = (_this select 0); //gets object from ace interaction menu
_unsorted_vic = (position _units) nearEntities [["Air", "Car", "Motorcycle", "Tank"], 25]; //pulls all vics in 25m radius of player
_sorted_vic = [_unsorted_vic, [], { _units distance _x }, "ASCEND"] call BIS_fnc_sortBy; //sorts array for closest to player
_dead = allDeadMen;
_deadNear = [];
_unsorted_obj = (position _units) nearObjects 2;
{
if (_x in _dead) then
	{
	_deadNear pushBack _x;
	};
}forEach _unsorted_obj;


_weaponsArray = [];
_cfgWeapons = "true" configClasses (configFile >> "cfgWeapons");
_vehicle = (_sorted_vic select 0);
{
	_weaponString = configName (_x);
	_parents = [_x,true] call BIS_fnc_returnParents;
	
	if (("Rifle" in _parents) || ("Launcher" in _parents) || ("arifle" in _parents)) then {
		_weaponsArray pushBack [_weaponString];
	};
} forEach _cfgWeapons;

_weaponsOnGround = [];
_WOG = [];
{
if ((weaponCargo _x) in _weaponsArray) then {
	_weaponsOnGround pushBack (weaponCargo _x);
}}forEach _unsorted_obj;
{
	_WOG pushBack (_x select 0);
}forEach _weaponsOnGround;
{
    _vehicle addItemCargoGlobal [_x, 1];
} forEach _WOG;

{
if ((weaponCargo _x) in _weaponsArray) then {
	clearWeaponCargoGlobal _x;
}}forEach _unsorted_obj;



{
_target = _x;
_vehicle = (_sorted_vic select 0);
private _items = [];
private _backpacks = [];
private _isMan = _target isKindOf "CAManBase";
private _targetTypeStr = ["ground", "body"] select _isMan;


if (_isMan) then {
    _items = magazines _target;
    _items pushback weapons _target;

    removeAllWeapons _target;
    
    // private _backpack = backpack _target;
    // if !(_backpack isEqualTo "") then {
        // _backpacks pushBack _backpack;
        // removeBackpackGlobal _target;
    // }; 
	//causes duplication off backpack items because backpack class spawns with items
    
    private _vest = vest _target;
    if !(_vest isEqualTo "") then {
        _items pushBack _vest;
        removeVest _target;
    };
    private _headgear = headgear _target;
    if !(_headgear isEqualTo "") then {
        _items pushBack _headgear;
        removeHeadgear _target;
    };
    private _nvg = hmd _target;
    if !(_nvg isEqualTo "") then {
        _items pushBack _nvg;
        _target unlinkItem _nvg;
    };
    

} else {
    _items = itemCargo _target;
    _items append weaponCargo _target;
    _backpacks = backpackCargo _target;
    
    clearWeaponCargoGlobal _target;
    clearMagazineCargoGlobal _target;
    clearBackpackCargoGlobal _target;
};

{
    _vehicle addItemCargoGlobal [_x, 1];
} forEach _items;

{
    _vehicle addBackpackCargoGlobal [_x, 1];
} forEach _backpacks;
}forEach (_deadNear select [0, 1000]);

systemchat "Gear Looted to closest vehicle";