private ["_display","_childControl"];
_nul = createDialog "unit_recruit";

sleep 1;
disableSerialization;

_display = findDisplay 100;

if (str (_display) != "no display") then
{
	_ChildControl = _display displayCtrl 104;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable (rebelLiteAT select 0)];
	_ChildControl = _display displayCtrl 105;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable (rebelHeavyGunner select 0)];
	_ChildControl = _display displayCtrl 126;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable (rebelMedic select 0)];
	_ChildControl = _display displayCtrl 107;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable (rebelEngineer select 0)];
	_ChildControl = _display displayCtrl 108;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable (rebelExpSpec select 0)];
	_ChildControl = _display displayCtrl 109;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable (rebelGrenadier select 0)];
	if (hasIFA) then {_childControl ctrlSetText "Radio Operator"};
	_ChildControl = _display displayCtrl 110;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable (rebelSniper select 0)];
	_ChildControl = _display displayCtrl 111;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable (rebelAT select 0)];
};