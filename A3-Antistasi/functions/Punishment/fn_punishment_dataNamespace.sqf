/*
Function:
	A3A_fnc_punishment_dataNamespace

Description:
	Returns a hash table namespace for punishment storage.
	Initializes is hash table does not exist.

Scope:
	<ANY>

Environment:
	<ANY>

Parameters:
	nil

Returns:
	<OBJECT> ("Logic") Punishment Data Namespace

Examples:
	private _data_namespace = call A3A_fnc_punishment_dataNamespace; // Gets namespace for getVariable and setVariable

Author: Caleb Serafin
Date Updated: 27 May 2020
License: MIT License, Copyright (c) 2019 Barbolani & The Official AntiStasi Community
*/
private _punishment_dataNamespace = missionNamespace getVariable ["punishment_dataNamespace",objNull];

if (isNull _punishment_dataNamespace) then {
	private _namespaces = allSimpleObjects ["logic"] select {_x getVariable ["punishment_dataNamespace",false]};
	if (_namespaces isEqualTo []) then {
		_punishment_dataNamespace = createSimpleObject ["Logic", [0,0,0]];
		_punishment_dataNamespace setVariable ["punishment_dataNamespace", true, true];
	} else {
		_punishment_dataNamespace = _namespaces select 0;
	};
	missionNamespace setVariable ["punishment_dataNamespace",_punishment_dataNamespace,true];
};

_punishment_dataNamespace;
