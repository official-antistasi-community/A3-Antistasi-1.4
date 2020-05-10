private _unit = _this select 0;
private _playerX = _this select 1;
private _recruiting = _this select 3;

[_unit,"remove"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_unit];

if (!alive _unit) exitWith {};

private _sideX = side (group _unit);
private _interrogated = _unit getVariable ["interrogated", false];

private _modAggroOcc = [0, 0];
private _modAggroInv = [0, 0];
private _modHR = false;
private _response = "";
private _targetMarker = respawnOccupants;

if (_recruiting) then {
	_playerX globalChat "How about joining the good guys?";

	private _chance = 0;
	if (_sideX == Occupants) then
    {
        _modAggroOcc = [0.25, 30];
		if (faction _unit == factionFIA) then { _chance = 60;}
		else { _chance = 20;};
	}
	else
    {
        _modAggroInv = [0.25, 30];
		if (faction _unit == factionFIA) then { _chance = 60;}
		else { _chance = 40;};
	};
	if (_interrogated) then { _chance = _chance / 2 };

	if (random 100 < _chance) then
    {
		_response = "Why not? It can't be any worse.";
		_modHR = true;
		_targetMarker = respawnTeamPlayer;
	}
	else
    {
		_response =  "Screw you!";
		_modAggroOcc = [0, 0];
		_modAggroInv = [0, 0];
	};
}
else {
	_playerX globalChat "Go back to your base and tell your comrades we are not enemies. We just want to live in peace";
	_response = selectRandom [
		"Okay, thank you. I owe you my life",
		"Thank you. I swear you won't regret it!",
		"Thank you, I won't forget this!"
	];

	if (_sideX == Occupants) then
    {
        _modAggroOcc = [-0.25, 30];
	}
	else
    {
        _modAggroInv = [-0.25, 30];
	};
};


if (isMultiplayer) then {[_unit,true] remoteExec ["enableSimulationGlobal",2]} else {_unit enableSimulation true};
sleep 3;
_unit globalChat _response;
_unit enableAI "ANIM";
_unit enableAI "MOVE";
_unit stop false;
[_unit,""] remoteExec ["switchMove"];
_unit doMove (getMarkerPos _targetMarker);
// probably redundant. Should already be done in surrenderAction
if (_unit getVariable ["spawner",false]) then {_unit setVariable ["spawner",nil,true]};
sleep 100;
if (alive _unit) then
{
	[_modAggroOcc,_modAggroInv] remoteExec ["A3A_fnc_prestige",2];
	if (_modHR) then { [1,0] remoteExec ["A3A_fnc_resourcesFIA",2] };
};
deleteVehicle _unit;
