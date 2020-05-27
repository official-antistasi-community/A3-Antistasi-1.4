/*
Function:
	A3A_fnc_punishment_dataSet

Description:
	Sets values of specified keys in a UID entry;

Parameters:
	<STRING> UID of entry.
	<ARRAY<KEYPAIR>>  List of key pairs; KEYPAIR=[Name<STRING>,Value<ANY>].

Returns:
	<BOOLEAN> True if hasn't crashed; nothing if it has.

Examples:
	private _keyPairs = [ ["test","frost"], ["420",69], ["bob","ban"] ];
	private _UID = "123";
	[_UID,_keyPairs] call A3A_fnc_punishment_dataSet; // In UID "123": Sets values of key "test" to "frost" and "420" to 69

Author: Caleb Serafin
Date Updated: 27 May 2020
License: MIT License, Copyright (c) 2019 Barbolani & The Official AntiStasi Community
*/
params[
	["_UID",objNull,["UID string",objNull]],
	["_keyPairs",[],[ [] ]]
];

if (_keyPairs isEqualTo []) exitWith {
	[format ["%1: [Antistasi] | ERROR | PUNISHMENT DATA SET | INVALID PARAMS | No keys pairs", servertime]] remoteExec ["diag_log", 2];
	"";
};
if (typeName _UID == "OBJECT" && {isPlayer _UID}) then {
	_UID = getPlayerUID _UID;
};
if !(typeName _UID == "STRING" || {_UID == ""}) exitWith {
	[format ["%1: [Antistasi] | ERROR | PUNISHMENT DATA SET | INVALID PARAMS | _UID=""%2""", servertime, _UID]] remoteExec ["diag_log", 2];
	"";
};

private _data_namespace = call A3A_fnc_punishment_dataNamespace;
private _data_UID = _data_namespace getVariable [_UID, [] ];

private _index = 0;
private _pair = [];
{
	_pair = _x;
	if (count _pair != 2 || {(typeName (_pair#0) != "STRING") }) exitWith {};
	_index = _data_UID findIf {(_x#0) == _pair#0};
	if (typeName (_pair#1) == "OBJECT" && {isNull (_pair#1)}) exitWith {
		_data_UID deleteAt _index;
	};
	if (_index > -1) then {
		_data_UID set [_index,_pair];
	} else {
		_data_UID pushBack _pair;
	};
} forEach _keyPairs;
_data_namespace setVariable [_UID, _data_UID, true];
true;