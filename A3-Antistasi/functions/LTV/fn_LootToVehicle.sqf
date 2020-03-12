params ["_unit","_player","_passedVehicle"];
private _unsorted_obj = (position _unit) nearObjects ["weaponHolderSimulated", 2]; //gets objects in a small radius around target body
private _vicFull = 0; // defines vehicle as not full
private _weaponsOnGround = [];
if (_passedVehicle == false) then {
    private _temp = [((position _player) nearEntities [["Car", "Motorcycle", "Tank"], 25]), [], { _player distance _x }, "ASCEND"] call BIS_fnc_sortBy;
    _vehicle = _temp select 0;
} else {
    _vehicle = _passedVehicle;
};
hint str _vehicle;
{
    if (((weaponCargo _x)select 0) in allWeapons) then{
        _weaponsOnGround pushback ((weaponCargo _x)select 0);
    }
}forEach _unsorted_obj; //finds all weapons on ground

if (!isNil "_weaponsOnGround") then {
    {
        if (_vehicle canAdd _x) then {
                _vehicle addItemCargoGlobal [_x, 1];
                {clearWeaponCargoGlobal _x;}forEach _unsorted_obj; 
        } else {
                _vicFull = 1;
        }
    }forEach _weaponsOnGround;
}; //if there are weapons on ground, then check if can add to vehicle. if it can then adds it and clears weapons from ground.

private _items = [];
private _backpacks = [];
if (_vicFull == 0) then {
    _items = magazines _unit;
    _items pushBack (weapons _unit);
    removeAllWeapons _unit;
 
    private _vest = vest _unit;
    if !(_vest isEqualTo "") then {
        if (_vehicle canAdd (vest _unit)) then {
            _items pushBack _vest;
            removeVest _unit;
        } else {_vicfull = 1}
    };

    private _headgear = headgear _unit;
    if !(_headgear isEqualTo "") then {
        if (_vehicle canAdd (headgear _unit)) then {
            _items pushBack _headgear;
            removeHeadgear _unit;
        } else {_vicfull = 1}
    };

    private _nvg = hmd _unit;
    if !(_nvg isEqualTo "") then {
        if (_vehicle canAdd (hmd _unit)) then {
            _items pushBack _nvg;
            _unit unlinkItem _nvg;
        } else {_vicfull = 1}
    };

    if ("ItemGPS" in (assignedItems _unit)) then {
        if (_vehicle canAdd "ItemGPS") then {
            _items pushBack "ItemGPS";
         _unit unlinkItem "ItemGPS";
        } else {_vicFull = 1}
    };
};

{
    _vehicle addItemCargoGlobal [_x, 1];
} forEach _items;

{
    _vehicle addBackpackCargoGlobal [_x, 1];
} forEach _backpacks;

private _displayName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
if (_vicFull == 0) then{
systemchat format ["Gear Looted to %1", _displayName];
} else {
systemchat format ["There is not enough space for all the gear, some gear may have been looted to %1", _displayName];
}; //outcome depends on if the vehicle could add _weaponsOnGround to _vehicle