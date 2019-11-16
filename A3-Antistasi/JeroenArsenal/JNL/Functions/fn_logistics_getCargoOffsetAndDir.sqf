/*
	Author: Jeroen Notenbomer

	Description:
	Returns the location and rotation of a object that needs to be set with attachTo and setVectorDirAndUp

	Parameter(s):
	OBJECT vehicle
	OBJECT object to load on vehicle

	Returns:
	ARRAY [attachTo location, setVectorDir]
*/


params ["_vehicle","_object","_nodeID"];

diag_log ["node",_nodeID];

//Find the location of node
private _typeNode = _object call jn_fnc_logistics_getCargoType;
private _nodePos = (([_vehicle,_typeNode] call jn_fnc_logistics_getNodes) select _nodeID) select 0;


//Find the offset for _object
private _objectModel = gettext (configfile >> "CfgVehicles" >> typeOf _object >> "model");
private _objectOffset = [0, 0, 0];
private _objectDir = [1, 0, 0];

if(_typeNode == 0) then //Weapon objects use pre-defined offset
{
	{
		if((_x select 0) isEqualTo _objectModel) exitWith{_objectOffset = _x select 1; _objectDir = _x select 2;}
	} foreach jnl_attachmentOffset;
}
else //Other objects use offset given by boundingCenter
{
	{
		if((_x select 0) isEqualTo _objectModel) exitWith{_objectOffset = boundingCenter _object; _objectDir = _x select 2;}
	} foreach jnl_attachmentOffset;
};

_objectOffset = _nodePos vectoradd _objectOffset;

//return
[_objectOffset,_objectDir]