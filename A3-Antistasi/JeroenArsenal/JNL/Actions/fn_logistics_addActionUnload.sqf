params ["_vehicle"];

private _unloadActionID = _vehicle getVariable ["jnl_unloadActionID", Nil];

//Check if action exists already
if(!isnil "_unloadActionID") then
{
	_vehicle removeAction _unloadActionID;
};

//add action
_unloadActionID = [_vehicle, "Unload Cargo", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unloaddevice_ca.paa", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unloaddevice_ca.paa", "_this distance _target < 5 && vehicle player == player && !(_target getVariable ['jnl_isUnloading',false])", "_caller distance _target < 5", {}, {}, 
{
	//(_this select 0) call jn_fnc_logistics_unLoad
	[_this select 0] remoteexec ["jn_fnc_logistics_unload", 2];
}, 	
{}, [_vehicle], 7, nil, false, false] call BIS_fnc_holdActionAdd; 

_vehicle setUserActionText [
	_unloadActionID,
	"Unload Cargo",
	"<t size='2'><img image='\A3\ui_f\data\IGUI\Cfg\Actions\arrow_down_gs.paa'/></t>"
];
_vehicle setVariable ["jnl_unloadActionID", _unloadActionID, false];
