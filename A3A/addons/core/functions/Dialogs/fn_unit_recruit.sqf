#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

private ["_display","_childControl"];
#ifdef UseDoomGUI
    ERROR("Disabled due to UseDoomGUI Switch.")
#else
	_nul = createDialog "unit_recruit";
#endif

sleep 1;
disableSerialization;

_display = findDisplay 100;

if (str (_display) != "no display") then
{
	_ChildControl = _display displayCtrl 104;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable FactionGet(reb,"unitRifle")]; //TODO: Localize
	_ChildControl = _display displayCtrl 105;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable FactionGet(reb,"unitMG")]; //TODO: Localize
	_ChildControl = _display displayCtrl 126;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable FactionGet(reb,"unitMedic")]; //TODO: Localize
	_ChildControl = _display displayCtrl 107;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable FactionGet(reb,"unitEng")]; //TODO: Localize
	_ChildControl = _display displayCtrl 108;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable FactionGet(reb,"unitExp")]; //TODO: Localize
	_ChildControl = _display displayCtrl 109;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable FactionGet(reb,"unitGL")]; //TODO: Localize
	if (A3A_hasIFA) then {_childControl ctrlSetText "Radio Operator"};
	_ChildControl = _display displayCtrl 110;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable FactionGet(reb,"unitSniper")]; //TODO: Localize
	_ChildControl = _display displayCtrl 111;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable FactionGet(reb,"unitLAT")]; //TODO: Localize
	_ChildControl = _display displayCtrl 112;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable FactionGet(reb,"unitAT")]; //TODO: Localize
	_ChildControl = _display displayCtrl 113;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable FactionGet(reb,"unitAA")]; //TODO: Localize
};
