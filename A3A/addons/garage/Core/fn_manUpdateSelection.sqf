/*
    Author: Tiny
    [Description]
        Forces an update to HR_GRG_SelectedVehicles for a client. A helper script to fn_sellvehGRG

    Arguments:
    0. The category to change selection to (default = -1)
	1. The vehicle UID to change selection to (default = -1)
	2. The classname of the selected vehicle (default = "")

    Return Value:
    <nil>

    Scope: Client
    Environment: Any
    Public: [No]

    License: APL-ND
*/
#include "defines.inc"
FIX_LINE_NUMBERS()

if (isNull player) exitWith {Error("fn_manUpdateSelection was not executed by a client")};
params [["_catIndex",-1],["_vehUID",-1],["_class",""]];

HR_GRG_SelectedVehicles = [_catIndex, _vehUID,_class];
