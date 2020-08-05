params ["_unit"];
if (player getVariable ["BuyCrateCooldown",false]) exitWith {["Loot crate", "You already bought one, wait a few seconds"] call A3A_fnc_customHint};
_money = player getVariable ["moneyX", 0];
if (_money < 10) exitWith {["Loot crate", "You cant afford a loot crate"] call A3A_fnc_customHint};
player setVariable ["BuyCrateCooldown",true];
player setVariable ["moneyX", _money -10, true];
[] spawn A3A_fnc_statistics;
["Loot crate", "Loot crate bought"] call A3A_fnc_customHint;

//spawn crate
_position = (getPos _unit) findEmptyPosition [1,10,"Box_IND_Wps_F"];
if (_position isEqualTo []) then {_position = getPos _unit};
private _crate = "Box_IND_Wps_F" createVehicle _position;
_crate allowDamage false;
clearMagazineCargoGlobal _crate;
clearWeaponCargoGlobal _crate;
clearItemCargoGlobal _crate;
clearBackpackCargoGlobal _crate;
[_crate] call jn_fnc_logistics_addAction;
player spawn {sleep 5; _this setVariable ["BuyCrateCooldown",nil]}; 