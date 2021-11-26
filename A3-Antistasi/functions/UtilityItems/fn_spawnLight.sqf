/*
Author: [Killerswin2, Håkon]
    trys to purchase a light source and places it near the player
Arguments:
0.  <object> Unit that will be buying a light

Return Value:
    <nil>

Scope: Clients
Environment: Unscheduled
Public: yes
Dependencies:

Example:
    [player] call A3A_fnc_spawnLight;
*/

params ["_unit"];

//check to make sure that the player is not spamming
private _lastTimePurchase = _unit getVariable["LightCooldown",time];
if (_lastTimePurchase > time) exitwith {["Light Purchase", format ["You already bought one, wait %1 seconds before you can buy another.", ceil (_lastTimePurchase - time)]] call A3A_fnc_customHint;};                               

//find out if we have money
private _resourceFIA = player getVariable ["moneyX", 0];

if (_resourceFIA < 25) exitwith {["Light Purchase", "You can't afford a light."] call A3A_fnc_customHint};
_unit setVariable["LightCooldown", time + 5];

//take money away
[-25] call A3A_fnc_resourcesPlayer;


//spawn the light
private _lightType = A3A_faction_reb getVariable ["vehicleLightSource", ""];
_position = (getPos _unit) findEmptyPosition [1,10,_lightType];
if (_position isEqualTo []) then {_position = getPos _unit};
private _light = _lightType createVehicle _position;
_light allowDamage false;
_light setVariable ["A3A_islight", true, true];

private _jipKey = "A3A_utilityItems_Light_" + ((str _light splitString ":") joinString "");

[_light, _jipKey] remoteExec ["A3A_fnc_initMovableObject", 0, _jipKey];
