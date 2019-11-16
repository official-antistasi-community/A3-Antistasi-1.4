params ["_vehicle"];

private _getOutEventID = _vehicle setVariable ["jnl_getOutGunnerEventID", nil];
if(!isnil "_getOutEventID")then{
	_vehicle removeEventHandler ["GetOut",_getOutEventID];
	_vehicle setVariable ["jnl_getOutGunnerEventID", nil];
};