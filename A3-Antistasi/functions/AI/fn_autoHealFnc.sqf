private ["_units"];

if (player != leader group player) exitWith {["AI Auto Heal", "You must be leader of your group to enable Auto Heal"] call A3A_fnc_customHint; autoHeal = false};

_units = units group player;

if ({alive _x} count _units == {isPlayer _x} count _units) exitWith {["AI Auto Heal", "Auto Heal requires at least one AI soldier in your group"] call A3A_fnc_customHint; autoHeal = false};
