/*
	Deletes an existing namespace.
*/

params ["_namespace"];

if (_namespace isEqualType locationNull) exitWith {
	deleteLocation _namespace;
};

deleteVehicle _namespace;