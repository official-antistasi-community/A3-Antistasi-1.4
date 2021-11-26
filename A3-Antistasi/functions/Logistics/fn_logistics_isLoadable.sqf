/*
Author: Håkon
Description:
    checks if object class is loadable as logistics cargo

Arguments:
0. <String> type of cargo to check

Return Value:
<Bool> is loadable

Scope: Any
Environment: Any
Public: Yes
Dependencies:

Example: if ([_obj] call A3A_fnc_logistics_isLoadable) then {...};

License: MIT License
*/
params [["_class","", [""]]];
private _model = getText (configFile/"CfgVehicles"/_class/"model");
(A3A_logistics_attachmentOffset findIf {_x#0 isEqualTo _model}) > -1;
