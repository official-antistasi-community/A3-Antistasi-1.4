/*
Function:
	A3A_fnc_punishment_dataAdd

Description:
	1. Gets values of specified keys in a UID entry;
	2. Or Gets all key pairs in a UID entry;
	3. Or Gets all UID entries from _punishment_dataNamespace.

Parameters 1:
	<STRING> UID of entry.
	<ARRAY<KEYPAIR>> List of keys and defaults to fetch values from; KEYPAIR=[Name<STRING>,Value<ANY>].

Parameters 2:
	<STRING> UID to fetch all key pairs from.
	<ARRAY> Empty array.

Parameters 3:
	<STRING> Empty string.
	<ARRAY> Empty array.

Returns 1:
	<ARRAY<ANY>> List of all values requeued from specified UID.

Returns 2:
	<ARRAY<KEYPAIR>> List of all Key pairs in specified UID.

Returns 3:
	<ARRAY<STRING>> List of all UID entries in _punishment_dataNamespace.

Examples:
	_keyPairs = [ ["test",0], ["420",0] ];
	_UID = "123";
	[_UID,_keyPairs] call A3A_fnc_punishment_dataGet; // Return values from key "test" and "420" with default as 0, in UID "123"
	[_UID,[]] call A3A_fnc_punishment_dataGet;    // Return all [key,value]s in UID "123"
	["",[]] call A3A_fnc_punishment_dataGet;      // Return all UID strings

Author: Caleb Serafin
Date Updated: 27 May 2020
License: MIT License, Copyright (c) 2019 Barbolani & The Official AntiStasi Community
*/
params[
	["_UID",objNull,["UID string",objNull]],
	["_keyPairs",[],[]]
];

if (typeName _UID == "OBJECT" && {isPlayer _UID}) then {
	_UID = getPlayerUID _UID;
};
if !(typeName _UID == "STRING") exitWith {
	[format ["%1: [Antistasi] | ERROR | PUNISHMENT DATA GET | INVALID PARAMS | _UID=""%2""", servertime, _UID]] remoteExec ["diag_log", 2];
	"";
};

private _data_namespace = call A3A_fnc_punishment_dataNamespace;
if (_UID == "") exitWith {
	allVariables _data_namespace;
};
private _data_UID = _data_namespace getVariable [_UID, []];
if (_keyPairs isEqualTo []) exitWith {
	_data_UID;
};

private _values = [];
private _index = 0;
private _pair = [];
{
	_pair = _x;
	if (count _pair != 2 || {(typeName (_pair#0) != "STRING") }) exitWith {_values pushBack objNull;};
	_index = _data_UID findIf {_x#0 == _pair#0};
	if (_index > -1) then {
		_values pushBack (_data_UID#_index)#1;
	} else {
		_values pushBack _x#1;
	};
} forEach _keyPairs;
_values;