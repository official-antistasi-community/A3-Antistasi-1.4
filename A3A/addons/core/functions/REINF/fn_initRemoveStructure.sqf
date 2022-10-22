/*
Author: [Killerswin2]
	adds a hold action to remove a building, 
Arguments:
1. <object> object that we add a remove hold action to
Return Value:
NONE
Scope: Client
Environment: Unscheduled
Public: 
no
Example:
[_vehicle] call A3A_fnc_initRemoveStructure;
*/

params [["_vehicle", objNull, [objNull]]];

private _jipKey = "A3A_Reinforce_removeStructure_" + ((str _vehicle splitString ":") joinString "");

[_vehicle,
	"Destroy",
	"a3\ui_f\data\igui\cfg\actions\repair_ca.paa",
	"a3\ui_f\data\igui\cfg\actions\repair_ca.paa",
	'player getUnitTrait "engineer"',
	"[player] call A3A_fnc_canFight",
	{},
	{},
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		
		// refund
		private _price = _target getVariable ["price", 0];
		
		if (_price isNotEqualTo 0) then {
			private _insufficientFunds = isNil {
    			if (player == theBoss) then {
        			[0,(_price)] remoteExec ["A3A_fnc_resourcesFIA",2];
        			true;
    			} else {
            		[_price] call A3A_fnc_resourcesPlayer;
            		true;
        		};
    		};
		};
		
		//save
		staticsToSave deleteAt (staticsToSave find _target);
		publicVariable "staticsToSave";
		
		deleteVehicle _target;
	},
	{},
	[],
	10] remoteExec ["BIS_fnc_holdActionAdd", 0, _jipKey];