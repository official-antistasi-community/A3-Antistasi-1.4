/*
    Author: [Hazey]
    Description:
		Simple utility function to clear the vehicle cargo.

    Arguments:
    	<Bool> Magazine Cargo Clear
		<Bool> Weapon Cargo Clear
		<Bool> Item Cargo Clear
		<Bool> Backpack Cargo Clear

    Return Value:
    	N/A

    Scope: Any
    Environment: Any
    Public: No

    Example: 
		[false, false, false, false, _veh] call A3A_fnc_clearVehicleCargo;

    License: MIT License
*/

params ["_magazineCargo", "_weaponCargo", "_itemCargo", "_backpackCargo", "_veh"];

if (_magazineCargo) then {
	clearMagazineCargoGlobal _veh;
};

if (_weaponCargo) then {
	clearWeaponCargoGlobal _veh;
};

if (_itemCargo) then {
	clearItemCargoGlobal _veh;
};

if (_backpackCargo) then {
	clearBackpackCargoGlobal _veh;
};