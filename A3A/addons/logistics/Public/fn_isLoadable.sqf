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

Example: if ([_obj] call A3A_Logistics_fnc_isLoadable) then {...};

License: MIT License
*/
params [["_class","", ["", objNull]]];
!isNull ([_class] call A3A_Logistics_fnc_getCargoConfig);
