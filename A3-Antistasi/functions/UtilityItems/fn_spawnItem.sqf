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
    [player, "object", 65, [['A3A_fnc_initMovableObject', 0]]] call A3A_fnc_spawnLight;
*/
#include "..\..\Includes\common.inc"
params  [
    ["_unit", objNull, [objNull]], 
    ["_spawnItem", "", [""]],
    ["_price", 0, [0]],
    ["_callbacks", [], [[]]]

];

// error checking, _unit, _spawnItem, and _callbacks

//check to make sure that the player is not spamming
private _lastTimePurchase = _unit getVariable["LightCooldown",time];
if (_lastTimePurchase > time) exitwith {["Light Purchase", format ["You already bought one, wait %1 seconds before you can buy another.", ceil (_lastTimePurchase - time)]] call A3A_fnc_customHint;};

//find out if we have money
private _resourceFIA = player getVariable ["moneyX", 0];

if (_resourceFIA < _price) exitwith {["Item Purchase", "You can't afford this Item."] call A3A_fnc_customHint};
_unit setVariable["LightCooldown", time + 5];

//take money away
[-_price] call A3A_fnc_resourcesPlayer;


//spawn the Item
private _spawnType = FactionGet(reb, _spawnItem);
_position = (getPos _unit) findEmptyPosition [1,10,_spawnType];
if (_position isEqualTo []) then {_position = getPos _unit};
private _item = _spawnType createVehicle _position;
_item allowDamage false;

//object globals
_item setVariable ["A3A_canGarage", true, true]; 
_item setVariable ["A3A_itemPrice", _price, true];


// callbacks

{
    private _func_name = ((_x) #0);
    switch ((_x) #1) do {
      case 0 : {
            private _jipKey = "A3A_utilityItems_item_" + ((str _item splitString ":") joinString "");
            [_item, _jipKey] remoteExec [_func_name, 0, _jipKey];
        };
        case 1 : {
            [_item] call compile preProcessFileLineNumbers (_func_name +"Info.sqf");
        };
    };
} foreach (_callbacks);
