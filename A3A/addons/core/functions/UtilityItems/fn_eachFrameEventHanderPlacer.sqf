/*
Author: [Killerswin2]
	3d icon eventHandler code 
Arguments:
1. <object> object that will have a 3d icon on it.
Return Value:
NONE
Scope: Client
Environment: Unscheduled
Public: 
no
Example:
[_vehicle] call A3A_fnc_eachFrameEventHanderPlacer
*/



params [["_object", objNull, [objNull]]];


private _eachFrameEH  = addMissionEventHandler ["EachFrame", {
		private _constructionObject = (_thisArgs # 0);
		private _className = _constructionObject getVariable "className";
		if (alive _constructionObject) then {
			drawIcon3D [
				"\A3\ui_f\data\map\markers\handdrawn\objective_CA.paa",
				[1,0,0,1],
				(getPos _constructionObject vectorAdd[0,0,2]),
				1,1,0,format["%1",getText(configFile >> "CfgVehicles" >> _className >> "displayName")],
				2,0.06,"RobotoCondensedLight"
			];
		};
	},
	[_object]
];

_object setVariable ["eachFrameEH", _eachFrameEH, true];