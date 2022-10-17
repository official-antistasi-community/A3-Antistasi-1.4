/*
    Function: A3A_fnc_TV_verifyLoadout

    Author: 
        - Håkon

    Description:
        Verifies a single loadout data in the format setUnitLoadout expects.

    Params: 
        _primary - Primary weapon array
        _launcher - Launcher weapon array
        _handgun - Handgun weapon array
        _uniform - Uniform array
        _vest - Vest array
        _backpack - Backpack array
        _helmet - Helmet
        _facewear - Facewear (empty string)
        _binocular - Binocular "weapon" array
        _linkedItems - Linked items

    Return Value:
        Loadout valid
        Invalid reasons

    Scope: 
        Any

    Environment: 
        Any

    Public: 
        Yes

    Dependencies:
        NONE

    Example: 
        _loadout call A3A_fnc_TV_verifyLoadout;

    License: 
        MIT License

*/
#define MUZZLE_TYPE 101
#define OPTIC_TYPE 201
#define POINTER_TYPE 301
#define BIPOD_TYPE 302


params [
    "_primary"
    ,"_launcher"
    ,"_handgun"
    ,"_uniform"
    ,"_vest"
    ,"_backpack"
    ,"_helmet"
    ,"_facewear"
    ,"_binocular"
    ,"_linkedItems"
];

//=====================|
// Validator functions |
//=====================|
// Only root validator push invalidReasons to the array to prevent overflow
// Formating and logging is handled by parent function

private _invalidReasons = [];
private _compatibleItemsWeapon = [];
private _fnc_validClassCaseSensitive = {
    params ["_cfg", "_class"];
    if (_class isEqualTo "") exitWith { true };
    if !(_class isEqualType "") exitWith {
        _invalidReasons pushBack ("Invalid data type: "+ str _class + " | Data type: "+ typeName _class + " | Expected: String");
        false;
    };
    if !(isClass (configFile/_cfg/_class) && configName (configFile/_cfg/_class) isEqualTo _class) exitWith {
        _invalidReasons pushBack ( if (isClass (configFile/_cfg/_class)) then {
            "Bad case on classname: "+_class+", expected: "+ configName (configFile/_cfg/_class)
        } else {
            "Invalid classname: "+_class
        });
        false;
    };
    true;
};

private _fnc_getCompatibleAttachements = {
    params ["_cfg", "_masterCfg"];
    if (isClass _cfg) then {
        (configProperties [_cfg, "true", true]) apply {configName _x};
    } else {
        getArray _cfg apply { configName (configFile/_masterCfg/_x) };
    };
};

//Weapon validators
//dependency on _compatibleItemsWeapon
private _fnc_validMuzzle = { //valid class and muzzle compatible with weapon
    params ["_weapon", "_muzzle"];
    if (_muzzle isEqualTo "") exitWith {true};
    if !(["CfgWeapons",_muzzle] call _fnc_validClassCaseSensitive) exitWith {false};

    if (MUZZLE_TYPE != getNumber ( configFile >> "CfgWeapons" >> _muzzle >> "itemInfo" >> "type" )) exitWith {
        _invalidReasons pushBack ("Muzzle: trying to add "+_muzzle+" | It is not an muzzle, verify if its in right slot");
        false;
    };


    if !(_muzzle in _compatibleItemsWeapon) exitWith {
        private _compatibleMuzzles = _compatibleItemsWeapon select { MUZZLE_TYPE == getNumber ( configFile >> "CfgWeapons" >> _x >> "itemInfo" >> "type" ) };
        _invalidReasons pushBack ("Muzzle: "+_muzzle+" is incompatible with "+_weapon+" | Comaptible muzzles: "+ str _compatibleMuzzles);
        false;
    };
    true;
};

// dependency on _compatibleItemsWeapon
private _fnc_validRail = { //valid class and rail compatible with weapon
    params ["_weapon", "_rail"];
    if (_rail isEqualTo "") exitWith {true};
    if !(["CfgWeapons",_rail] call _fnc_validClassCaseSensitive) exitWith {false};

    if (POINTER_TYPE != getNumber ( configFile >> "CfgWeapons" >> _rail >> "itemInfo" >> "type" )) exitWith {
        _invalidReasons pushBack ("Rail: trying to add "+_rail+" | It is not an rail, verify if its in right slot");
        false;
    };

    if !(_rail in _compatibleItemsWeapon) exitWith {
        private _compatibleRails = _compatibleItemsWeapon select { POINTER_TYPE == getNumber ( configFile >> "CfgWeapons" >> _x >> "itemInfo" >> "type" ) };
        _invalidReasons pushBack ("Rail: "+_rail+" is incompatible with "+_weapon+" | Comaptible rails: "+ str _compatibleRails);
        false;
    };
    true;
};

// dependency on _compatibleItemsWeapon
private _fnc_validOptic = { //valid class and optic compatible with weapon
    params ["_weapon", "_optic"];
    if (_optic isEqualTo "") exitWith {true};
    if !(["CfgWeapons",_optic] call _fnc_validClassCaseSensitive) exitWith {false};

    if (OPTIC_TYPE != getNumber ( configFile >> "CfgWeapons" >> _optic >> "itemInfo" >> "type" )) exitWith {
        _invalidReasons pushBack ("Optic: trying to add "+_optic+" | It is not an optic, verify if its in right slot");
        false;
    };

    if !(_optic in _compatibleItemsWeapon) exitWith {
        // print out list of compatibleItems
        private _compatibleOptics = _compatibleItemsWeapon select { OPTIC_TYPE == getNumber ( configFile >> "CfgWeapons" >> _x >> "itemInfo" >> "type" ) };
        _invalidReasons pushBack ("Optic: "+_optic+" is incompatible with "+_weapon+" | Comaptible optics: "+ str _compatibleOptics);
        false;
    };
    true;
};


private _fnc_validateWeaponMagazine = { //valid class and compatible with weapon and bullet count in range of mag max
    params ["_weapon", "_magazine"];
    if (_magazine isEqualTo []) exitWith {true};

    _magazine params ["_magClass", "_bulletCount"];
    if (_magClass isEqualTo "") exitWith {true};
    if !(["CfgMagazines", _magClass] call _fnc_validClassCaseSensitive) exitWith {false};

    private _compatibleMagazines = compatibleMagazines _weapon;

    private _maxCount = getNumber (configFile/"CfgMagazines"/_magClass/"count");
    if !(_magClass in _compatibleMagazines && { _bulletCount <= _maxCount }) exitWith {
        if (_bulletCount > _maxCount) then { _invalidReasons pushBack ("Mag bullet count excedes capaciy of "+str _maxCount+" bullets") };
        if !(_magClass in _compatibleMagazines) then { _invalidReasons pushBack ("Magazine "+_magClass+" is not compatible with "+_weapon+", Compatible magazines: "+str _compatibleMagazines) };
        false;
    };
    true;
};

// dependency on _compatibleItemsWeapon
private _fnc_validBipod = { //valid class and bipod compatible with weapon
    params ["_weapon", "_bipod"];
    if (_bipod isEqualTo "") exitWith {true};
    if !(["CfgWeapons",_bipod] call _fnc_validClassCaseSensitive) exitWith {false};

    if (BIPOD_TYPE != getNumber ( configFile >> "CfgWeapons" >> _bipod >> "itemInfo" >> "type" )) exitWith {
        _invalidReasons pushBack ("Bipod: trying to add "+_bipod+" | It is not an bipod, verify if its in right slot");
        false;
    };

    if !(_bipod in _compatibleItemsWeapon) exitWith {
        // print out list of compatibleItems
        private _compatibleBipods = _compatibleItemsWeapon select { BIPOD_TYPE == getNumber ( configFile >> "CfgWeapons" >> _x >> "itemInfo" >> "type" ) };
        _invalidReasons pushBack ("Bipod: "+_bipod+" is incompatible with "+_weapon+" | Comaptible bipods: "+ str _compatibleBipods);
        false;
    };
    true;
};

private _fnc_validateWeapon = { // weapon and all its attachments including magazines are valid
    params [["_baseWeapon",""], "_muzzle", "_rail", "_optic", "_priMag", "_secMag", "_bipod"];
    if (_baseWeapon isEqualTo "") exitWith {true};
    _compatibleItemsWeapon = (compatibleItems _baseWeapon);
    ["CfgWeapons",_baseWeapon] call _fnc_validClassCaseSensitive
    && { [_baseWeapon, _muzzle] call _fnc_validMuzzle }
    && { [_baseWeapon, _rail] call _fnc_validRail }
    && { [_baseWeapon, _optic] call _fnc_validOptic }
    && { [_baseWeapon, _priMag] call _fnc_validateWeaponMagazine }
    && { [_baseWeapon, _secMag] call _fnc_validateWeaponMagazine }
    && { [_baseWeapon, _bipod] call _fnc_validBipod };
};

//container validator
_fnc_validContainerMag = { //magazines within a container is valid
    params ["_class", "_magCount", "_bulletCount"];
    private _maxCount = getNumber (configFile/"CfgMagazines"/_class/"count");
    ["CfgMagazines",_class] call _fnc_validClassCaseSensitive
    && _bulletCount <= _maxCount //we ignore mag quantity as that would be a much more complex calc for little to no gain as loadout items vary with modsett not just template
};

_fnc_validateContainerContents = { //container and its contents are valid
    private _valid = true;
    {
        if (_x#0 isEqualTo "") exitWith {true};
        if (count _x > 2) then {
            if !(_x call _fnc_validContainerMag) then {_valid = false};
        } else {
            if !(["CfgWeapons",_x#0] call _fnc_validClassCaseSensitive) then {_valid = false};
        }
    } forEach _this;
    _valid;
};

//==================|
// Validate loadout |
//==================|

//verify weapon formats
private _validPrimary = _primary call _fnc_validateWeapon;
private _validLauncher = _launcher call _fnc_validateWeapon;
private _validHandgun = _handgun call _fnc_validateWeapon;
private _validBinocular = _binocular call _fnc_validateWeapon;

//validate containers
private _validUniform = _uniform isEqualTo [] || {["CfgWeapons", _uniform#0] call _fnc_validClassCaseSensitive && (_uniform#1) call _fnc_validateContainerContents};
private _validVest = _vest isEqualTo [] || {["CfgWeapons", _vest#0] call _fnc_validClassCaseSensitive && (_vest#1) call _fnc_validateContainerContents};
private _validBackpack = _backpack isEqualTo [] || {["CfgVehicles", _backpack#0] call _fnc_validClassCaseSensitive && (_backpack#1) call _fnc_validateContainerContents};

//validate linked items
private _validLinkedItems = true;
{
    if (_x isEqualTo "") then {continue};

    if !(["CfgWeapons",_x] call _fnc_validClassCaseSensitive) then {
        _validLinkedItems = false;
    };
} forEach _linkedItems;

private _validFacewear = _facewear isEqualTo "" || {["CfgGlasses", _facewear] call _fnc_validClassCaseSensitive};

//================|
// Return results |
//================|

//return format: [<Bool> Loadout valid, <Array<String>> Invalid reasons]
[
    _validPrimary && _validLauncher && _validHandgun && _validBinocular
    && _validUniform && _validVest && _validBackpack
    && _validFacewear && _validLinkedItems

    , _invalidReasons
];
