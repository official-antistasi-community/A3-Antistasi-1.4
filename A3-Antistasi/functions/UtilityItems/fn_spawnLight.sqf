/*
Author: [Killerswin2, Håkon]
    It buys a light
Arguments:
0.  <object> Unit that will be buying a light

Return Value:
    <nil>

Scope: Clients
Environment: Unscheduled
Public: No
Dependencies: 

Example:
    [player] call A3A_fnc_spawnLight; 
*/

params ["_unit"];

//check to make sure that the player is not spamming 
private _lastTimePurchase = _unit getVariable["LightCooldown",time];
if(_lastTimePurchase > time) exitwith{["Light Purchase",format ["You already bought one, wait %1 seconds before you can buy another", ceil (_lastTimePurchase - time)]] call A3A_fnc_customHint;};                               

//find out if we have money
private _resourceFIA = 0;
if(player != theBoss) then{
	_resourceFIA = player getVariable "moneyX";
}else{
	_resourceFIA = server getVariable "resourceFIA";
};

if(_resourceFIA < 25) exitwith { ["Light Purchase","You can't afford a light."] call A3A_fnc_customHint};
_unit setVariable["LightCooldown",time + 5];

//take money away
if (player == theBoss) then {
    [0,-25] remoteExec ["A3A_fnc_resourcesFIA",2];
} else {
    [-25] call A3A_fnc_resourcesPlayer;
};


//spawn the light
private _lightType = "Land_PortableLight_double_F";
_position = (getPos _unit) findEmptyPosition [1,10,_lightType];
if (_position isEqualTo []) then {_position = getPos _unit};
private _light = _lightType createVehicle _position;
_light allowDamage false;
