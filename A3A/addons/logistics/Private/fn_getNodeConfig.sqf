/*
Author: Håkon
Description:
    Gets the node config of a class or object

    if multiple node configs exist it gets the first it find in order:
    - Mission config classname
    - vehicle config
    - Nodes config className
    - *Mission config model
    - *Nodes config model

    * Models have forwardslashes and dots replaced with underscore ( '\' & '.' -> '_' )

Arguments:
0. <Object/String> Vehicle or classname

Return Value: <config> the node config for that vehicle/class

Scope: Any
Environment: Any
Public: Yes
Dependencies:

Example: private _cfgNodes = [_vehicle] call A3A_Logistics_fnc_getNodeConfig;

License: MIT License
*/
#include "..\script_component.hpp"
params [["_class","",["",objNull]]];
if (_class isEqualType objNull) then {_class = typeOf _class};

#define cfgVehicle (configFile/"CfgVehicles"/_class)
#define VehicleNodes (configFile/"CfgVehicles"/_class/QGVAR(Nodes))
#define CfgNodes (configFile/"A3A"/QGVAR(Nodes))
#define MissionNodes (missionConfigFile/"A3A"/QGVAR(Nodes))

if !(isClass cfgVehicle) exitWith { configNull };
if (isClass (MissionNodes/_class)) exitWith { (MissionNodes/_class) };
if (isClass VehicleNodes) exitWith { VehicleNodes };
if (isClass (CfgNodes/_class)) exitWith { (CfgNodes/_class) };

private _model = modelOfClass(_class);
if (isClass (MissionNodes/_model)) exitWith { (MissionNodes/_model) };
if (isClass (CfgNodes/_model)) exitWith { (CfgNodes/_model) };
configNull;
