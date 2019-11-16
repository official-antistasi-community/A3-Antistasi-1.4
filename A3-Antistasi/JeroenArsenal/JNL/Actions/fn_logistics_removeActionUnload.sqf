params ["_vehicle"];

private _unloadActionID = _vehicle getVariable ["jnl_unloadActionID", nil];
if(!isnil "_unloadActionID")then{
	_vehicle removeAction _unloadActionID;
	_vehicle setVariable ["jnl_unloadActionID", nil];
};