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
 *    [group, position, markers, placement, special] call A3A_fnc_createUnit
 */

params ["_group", "_type", "_position", ["_markers", []], ["_placement", 0], ["_special", "NONE"]];

private _unitLoadout = [];

if (_type isEqualType []) then {
	_unitLoadout = _type;
	_type = switch (side _group) do {
		case west: { "B_Survivor_F" };
		case east: { "O_Survivor_F" };
		case independent: { "I_Survivor_F" };
		case civilian: { "C_Man_1" };
	};
};

private _unit = _group createUnit  [_type, _position, _markers, _placement, _special];

if !(_unitLoadout isEqualTo []) then {
	_unit setUnitLoadout _unitLoadout;
};

_unit