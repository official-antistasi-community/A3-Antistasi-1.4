private _unit = _this select 0;
if (_unit getUnitTrait "Medic") exitWith {true};
if (getNumber (configfile >> "CfgVehicles" >> (typeOf _unit) >> "attendant") == 2) exitWith {true};
false