params ["_object"];
if (_object isKindOf "StaticWeapon") then {
    [_object] call A3A_fnc_logistics_addLoadAction;
};
//here comes all the init code
