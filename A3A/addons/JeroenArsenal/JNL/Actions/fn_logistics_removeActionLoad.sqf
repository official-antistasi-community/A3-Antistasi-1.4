params ["_object"];

private _loadActionID = _object getVariable ["jnl_loadActionID",nil];
if(!isnil "_loadActionID") then{
	_object removeAction _loadActionID;
	_object setVariable["jnl_loadActionID",nil];
};