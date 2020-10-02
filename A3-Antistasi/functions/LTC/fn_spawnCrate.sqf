params ["_unit"];
private _time = player getVariable ["BuyCrateCooldown",time];
if (_time > time) exitWith {["Loot crate", format ["You already bought one, wait %1 seconds before you can buy another", ceil (_time - time)]] call A3A_fnc_customHint};
_money = player getVariable ["moneyX", 0];
if (_money < 10) exitWith {["Loot crate", "You can't afford a loot crate"] call A3A_fnc_customHint};
player setVariable ["BuyCrateCooldown",time + 5];
[-10] call A3A_fnc_resourcesPlayer;
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
