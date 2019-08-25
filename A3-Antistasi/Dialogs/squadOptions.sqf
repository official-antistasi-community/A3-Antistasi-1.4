private ["_display","_childControl","_costs","_costHR","_unitsX","_formatX"];
if (!([player] call A3A_fnc_hasRadio)) exitWith {if !(hasIFA) then {hint "You need a radio in your inventory to be able to give orders to other squads"} else {hint "You need a Radio Man in your group to be able to give orders to other squads"}};
_nul = createDialog "squad_options";

sleep 1;
disableSerialization;

_display = findDisplay 100;

if (str (_display) != "no display") then
{
	_ChildControl = _display displayCtrl 104;
	_costs = 0;
	_costHR = 0;
	//_formatX = (cfgSDKInf >> (REBELgroupSQUAD select 0));
	//_unitsX = [_formatX] call groupComposition;
	{_costs = _costs + (server getVariable (_x select 0)); _costHR = _costHR +1} forEach REBELgroupSQUAD;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €. HR: %2",_costs,_costHR];

	_ChildControl = _display displayCtrl 105;
	_costs = 0;
	_costHR = 0;
	//_formatX = (cfgSDKInf >> (REBELgroupFIRETEAM select 0));
	//_unitsX = [_formatX] call groupComposition;
	{_costs = _costs + (server getVariable (_x select 0)); _costHR = _costHR +1} forEach REBELgroupSQUADengineer;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €. HR: %2",_costs,_costHR];

	_ChildControl = _display displayCtrl 106;
	_costs = 0;
	_costHR = 0;
	//_formatX = (cfgSDKInf >> (REBELgroupAT select 0));
	//_unitsX = [_formatX] call groupComposition;
	{_costs = _costs + (server getVariable (_x select 0)); _costHR = _costHR +1} forEach REBELgroupSQUADsupport;
	_costs = _costs + ([REBELstaticMG] call A3A_fnc_vehiclePrice);
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €. HR: %2",_costs,_costHR];

	_ChildControl = _display displayCtrl 107;
	_costs = 0;
	_costHR = 0;
	//_unitsX = [REBELsquadLeader,REBELsquadLeader];
	{_costs = _costs + (server getVariable (_x select 0)); _costHR = _costHR +1} forEach REBELgroupSQUADsupport;
	_costs = _costs + ([REBELmortar] call A3A_fnc_vehiclePrice);
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €. HR: %2",_costs,_costHR];
};