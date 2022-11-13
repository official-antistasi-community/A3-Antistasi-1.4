#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

private ["_display","_childControl","_costs","_costHR","_unitsX","_formatX"];
if (!([player] call A3A_fnc_hasRadio)) exitWith {if !(A3A_hasIFA) then {["Squad Options", "You need a radio in your inventory to be able to give orders to other squads."] call A3A_fnc_customHint;} else {["Squad Options", "You need a Radio Man in your group to be able to give orders to other squads."] call A3A_fnc_customHint;}};
#ifdef UseDoomGUI
	ERROR("Disabled due to UseDoomGUI Switch.")
#else
	_nul = createDialog "squad_options";
#endif

sleep 1;
disableSerialization;

_display = findDisplay 100;

if (str (_display) != "no display") then
{
	_ChildControl = _display displayCtrl 104;
	_costs = 0;
	_costHR = 0;
	{_costs = _costs + (server getVariable _x); _costHR = _costHR +1} forEach FactionGet(reb,"groupSquad");
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €. HR: %2",_costs,_costHR];

	_ChildControl = _display displayCtrl 105;
	_costs = 0;
	_costHR = 0;
	{_costs = _costs + (server getVariable _x); _costHR = _costHR +1} forEach FactionGet(reb,"groupSquadEng");
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €. HR: %2",_costs,_costHR];

	_ChildControl = _display displayCtrl 106;
	_costs = 0;
	_costHR = 0;
	{_costs = _costs + (server getVariable _x); _costHR = _costHR +1} forEach FactionGet(reb,"groupSquadSupp");
	_costs = _costs + ([selectRandom(FactionGet(reb,"staticMG"))] call A3A_fnc_vehiclePrice);
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €. HR: %2",_costs,_costHR];

	_ChildControl = _display displayCtrl 107;
	_costs = 0;
	_costHR = 0;
	{_costs = _costs + (server getVariable _x); _costHR = _costHR +1} forEach FactionGet(reb,"groupSquadSupp");
	_costs = _costs + ([selectRandom(FactionGet(reb,"staticMortar"))] call A3A_fnc_vehiclePrice);
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €. HR: %2",_costs,_costHR];
};
