params ["_object"];

private _getOutEventID = _object getVariable ["jnl_getOutGunnerEventID", nil];

//Check if action exists already
if(!isnil "_getOutEventID") then
{
	_object removeAction _getOutEventID;
};

_getOutEventID = _object addEventHandler ["GetOut", {
	_veh = _this select 0;
	_unit = _this select 2;
    _vehBase = attachedTo _veh;
    _v_dir = direction _vehBase;
    _new_pos = _veh getPos [2.0, _v_dir-90];
    _unit setPos _new_pos;
}];
_object setVariable ["jnl_getOutGunnerEventID", _getOutEventID, false];