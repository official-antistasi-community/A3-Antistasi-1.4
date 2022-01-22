params ["_vehicle"];

private _getInGunnerActionID = _vehicle getVariable ["jnl_getInGunnerActionID", nil];
if(!isnil "_getInGunnerActionID")then{
	_vehicle removeAction _getInGunnerActionID;
	_vehicle setVariable ["jnl_getInGunnerActionID", nil];
};