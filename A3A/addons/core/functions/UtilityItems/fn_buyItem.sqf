/*
Author: [Killerswin2, Håkon]
    trys to purchase a item and places it near the player. Damage for the object is disabled.
Arguments:
0.  <object>    Unit that will be buying the item
1.  <string>    Item classname
2.  <number>    price of item
3.  <array>     callback functions, [[name, isGlobal - > true if need exec]]

Return Value:
    <nil>

Scope: Clients
Environment: Unscheduled
Public: yes
Dependencies:

Example:
    [player, _fuelDrum # 0, _fuelDrum # 1, [['A3A_fnc_initMovableObject', true], ['A3A_Logistics_fnc_addLoadAction', false]]] call A3A_fnc_buyItem
*/
#include "..\..\script_component.hpp"
params  [
    ["_unit", objNull, [objNull]],
    ["_spawnItem", "", [""]],
    ["_price", -1, [0]],
    ["_callbacks", [], [[]]]
];

// error checking, _unit, _spawnItem, and _callbacks
if (!canSuspend) exitwith{};
if (!hasInterface) exitwith{};
if (isNull _unit) exitwith {};
if (!isClass (configFile/"CfgVehicles"/_spawnItem)) exitwith {};
if (_price == -1) exitwith {};

//check to make sure that the player is not spamming
private _lastTimePurchase = _unit getVariable["A3A_spawnItem_cooldown",time];
if (_lastTimePurchase > time) exitwith {[localize "STR_A3A_Utility_Items_Purchase_Title", format [localize "STR_A3A_Utility_Items_Last_Time_Purchase", ceil (_lastTimePurchase - time)]] call A3A_fnc_customHint;};

if (_price != 0) then {
    //try to take money away 😞
    private _insufficientFunds = isNil {
        if (_unit == theBoss && (server getVariable ["resourcesFIA", 0]) >= _price) then {
            [0,(-_price)] remoteExec ["A3A_fnc_resourcesFIA",2];
            true;
        } else {
            if ((_unit getVariable ["moneyX", 0]) >= _price) then {
                [-_price] call A3A_fnc_resourcesPlayer;
                true;
            };
        };
    };
    if (_insufficientFunds) exitwith {[localize "STR_A3A_Utility_Items_Purchase_Title", localize "STR_A3A_Utility_Items_Insufficient_Funds"] call A3A_fnc_customHint};
};

//had money for item
_unit setVariable ["A3A_spawnItem_cooldown", time + 15];

//spawn the Item
private _position = (getPos _unit vectorAdd [3,0,0]) findEmptyPosition [1,50,_spawnItem];
if (_position isEqualTo []) then {_position = getPos _unit};
private _item = _spawnItem createVehicle _position;
_item allowDamage false;

//object globals
_item setVariable ["A3A_canGarage", true, true];
_item setVariable ["A3A_itemPrice", _price, true];

// callbacks
{
    private _func_name = (_x #0);
    if (_x #1) then {
            private _jipKey = "A3A_utilityItems_item_" + _func_name + "_" + ((str _item splitString ":") joinString "");
            [_item, _jipKey] remoteExecCall [_func_name, 0, _jipKey];
    } else {
        [_item] call (missionNamespace getVariable _func_name);
    };
} foreach (_callbacks);
