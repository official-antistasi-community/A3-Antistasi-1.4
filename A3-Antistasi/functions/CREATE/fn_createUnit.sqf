/*
 * File: fn_createUnit.sqf
 * Description:
 *    To be used instead of 'createUnit' scripting command.
 *    Adds additional behaviour, including passing a loadout instead of a classname.
 * Params:
 *    _group - Group to add the AI: Group
 *    _type - A classname in CfgVehicles, or a unit loadout array: String or Array
 *    _position - Position to create at: Position, Position2D, Object, Group
 *    _markers - Markers the AI can be placed on: Array
 *    _placement - Placement radius: Number
 *    _special - Unit special placement: String
 * Returns:
 *    Object - created unit
 * Example Usage:
 *    [group, _type, position, markers, placement, special] call A3A_fnc_createUnit
 */

params ["_group", "_type", "_position", ["_markers", []], ["_placement", 0], ["_special", "NONE"]];

private _unitDefinition = customUnitTypes getVariable [_type, []];

if !(_unitDefinition isEqualTo []) exitWith {
	_unitDefinition params ["_loadouts", "_traits"];
	private _unitClass = switch (side _group) do {
		case west: { "B_G_Soldier_F" };
		case east: { "O_G_Soldier_F" };
		case independent: { "I_G_Soldier_F" };
		case civilian: { "C_Man_1" };
	};
	private _unit = _group createUnit  [_unitClass, _position, _markers, _placement, _special];
	_unit setUnitLoadout selectRandom _loadouts;
	_unit setVariable ["unitType", _type, true];
	{
		_unit setUnitTrait _x;
	} forEach _traits;
	_unit
};

private _unit = _group createUnit  [_type, _position, _markers, _placement, _special];
_unit setVariable ["unitType", _type, true];
_unit
