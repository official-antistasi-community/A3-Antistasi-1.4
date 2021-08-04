/*
    Author: [Killerswin2]
    [Description]
        Allows for the player to refuel the fuel cargo for ace

    Arguments:
    <nil>
    Return Value:
    <nil>

    Scope: Clients
    Environment: Any
    Public: [yes]
    Dependencies:ACE

    Example: [] call A3A_fnc_initRefuelingCargo;

    License: MIT License
*/
player addAction["Refuel Tanker",{[vehicle player, cursorObject] call A3A_fnc_addFuelToRefuelTank;},nil,1.5,true,true,"","(((typeOf cursorObject)isEqualTo ""Land_RailwayCar_01_tank_F"")and(cursorObject distance _this < 10) and (true == ([vehicle player] call HR_GRG_fnc_isFuelSource)))"];
nil;