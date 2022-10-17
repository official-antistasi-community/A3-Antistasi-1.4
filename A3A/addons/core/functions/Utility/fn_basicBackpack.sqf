//Some mod backpacks have no empty variant
//If they don't, we just return the passed in backpack. Super simple.

params ["_backpack"];

private _basicBackpack = (_backpack call BIS_fnc_basicBackpack);
if (_basicBackpack isEqualTo "") exitWith {
	 _backpack;
};	

_basicBackpack;