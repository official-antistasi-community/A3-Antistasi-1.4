#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
private ["_display","_childControl","_costs","_costHR","_unitsX","_formatX"];
if (!([player] call A3A_fnc_hasRadio)) exitWith {if !(A3A_hasIFA) then {["Squad Recruit", "You need a radio in your inventory to be able to give orders to other squads."] call A3A_fnc_customHint;} else {["Squad Recruit", "You need a Radio Man in your group to be able to give orders to other squads."] call A3A_fnc_customHint;}};
#ifdef UseDoomGUI
	ERROR("Disabled due to UseDoomGUI Switch.")
#else
	_nul = createDialog "squad_recruit";
#endif

sleep 1;
disableSerialization;

_display = findDisplay 100;
private _crewCost = server getVariable FactionGet(reb,"unitCrew");

if (str (_display) != "no display") then
{
	_ChildControl = _display displayCtrl 104;
	_costs = 0;
	_costHR = 0;

	_ChildControl = _display displayCtrl 105;
	_costs = 0;
	_costHR = 0;
	{_costs = _costs + (server getVariable _x); _costHR = _costHR +1} forEach FactionGet(reb,"groupMedium");
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €. HR: %2",_costs,_costHR];

	_ChildControl = _display displayCtrl 106;
	_costs = 0;
	_costHR = 0;
	{_costs = _costs + (server getVariable _x); _costHR = _costHR +1} forEach FactionGet(reb,"groupAT");
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €. HR: %2",_costs,_costHR];

	_ChildControl = _display displayCtrl 107;
	_costs = 0;
	_costHR = 0;
	{_costs = _costs + (server getVariable _x); _costHR = _costHR +1} forEach FactionGet(reb,"groupSniper");
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €. HR: %2",_costs,_costHR];


	_ChildControl = _display displayCtrl 108;
	_costHR = 2;
	_costs = 2*_crewCost + ([(FactionGet(reb, "staticMGs")) # 0] call A3A_fnc_vehiclePrice);
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €. HR: %2",_costs,_costHR];

	_ChildControl = _display displayCtrl 109;
	_costHR = 2;
	_costs = 2*_crewCost + ([(FactionGet(reb,"vehiclesAT")) # 0] call A3A_fnc_vehiclePrice);
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €. HR: %2",_costs,_costHR];

	_ChildControl = _display displayCtrl 110;
	_costHR = 2;
	_costs = 2*_crewCost + ([(FactionGet(reb,"vehiclesTruck")) # 0] call A3A_fnc_vehiclePrice) + ([(FactionGet(reb,"staticAA")) # 0] call A3A_fnc_vehiclePrice);
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €. HR: %2",_costs,_costHR];

	_ChildControl = _display displayCtrl 111;
	_costHR = 2;
	_costs = 2*_crewCost + ([(FactionGet(reb,"staticMortars")) # 0] call A3A_fnc_vehiclePrice);
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €. HR: %2",_costs,_costHR];
};
