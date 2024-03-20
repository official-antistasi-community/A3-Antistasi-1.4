/*
	Author: Sparker

	Description:
	Returns an array with objects loaded with JNL

	Parameter(s):
	OBJECT _vehicle,
	INTEGER _type

	Returns:
	ARRAY: [object_0, object_1, etc...]
*/

params ["_vehicle",["_type",-1]];

private _cargo = [];
private _jnl_cargo = 0;
{
	private _object = _x;
	private _jnl_cargo = _object getVariable ["jnl_cargo", Nil];
	if (! isNil "_jnl_cargo") then
	{
		if(_type == -1 || _type == (_jnl_cargo select 0) )then{
			_cargo pushBack _object;
		};
	};
} forEach attachedObjects _vehicle;

//return
_cargo