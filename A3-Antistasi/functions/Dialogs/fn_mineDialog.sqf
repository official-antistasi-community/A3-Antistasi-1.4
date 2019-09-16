private ["_typeX","_costs","_positionTel","_quantity","_quantityMax"];

if (["Mines"] call BIS_fnc_taskExists) exitWith {hint "We can only deploy one minefield at a time."};

if (!([player] call A3A_fnc_hasRadio)) exitWith {if !(hasIFA) then {hint "You need a radio in your inventory to be able to give orders to other squads"} else {hint "You need a Radio Man in your group to be able to give orders to other squads"}};

_typeX = _this select 0;

_costs = (2*(server getVariable (SDKExp select 0))) + ([vehSDKTruck] call A3A_fnc_vehiclePrice);
_hr = 2;
if (_typeX == "delete") then
	{
	_costs = _costs - (server getVariable (SDKExp select 0));
	_hr = 1;
	};
if ((server getVariable "resourcesFIA" < _costs) or (server getVariable "hr" < _hr)) exitWith {hint format ["Not enought resources to recruit a mine deploying team (%1 € and %2 HR needed)",_costs,_hr]};

if (_typeX == "delete") exitWith
	{
	hint "Explosive Specialists is available on your High Command bar.\n\nSend him anywhere on the map and he will deactivate and load in his truck any mine he may find.\n\nReturning back to HQ will unload the mines he stored in his vehicle";
	[[],"A3A_fnc_mineSweep"] remoteExec ["A3A_fnc_scheduler",2];
	};

#include "\A3\Ui_f\hpp\defineResinclDesign.inc"

_pool = jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_CARGOPUT;
_quantity = 0;
_quantityMax = 40;
_typeM =APERSMineMag;
if (_typeX == "ATMine") then
	{
	_quantityMax = 20;
	_typeM = ATMineMag;
	};

{
if (_x select 0 == _typeM) exitWith {_quantity = _x select 1}
} forEach _pool;

if (_quantity < 5) exitWith {hint "You need at least 5 mines of this type to build a Minefield"};

if (!visibleMap) then {openMap true};
positionTel = [];
hint "Click on the position you wish to build the minefield.";

onMapSingleClick "positionTel = _pos;";

waitUntil {sleep 1; (count positionTel > 0) or (not visiblemap)};
onMapSingleClick "";

if (!visibleMap) exitWith {};

_positionTel = positionTel;

if (_quantity > _quantityMax) then
	{
	_quantity = _quantityMax;
	};

[[_typeX,_positionTel,_quantity],"A3A_fnc_buildMinefield"] remoteExec ["A3A_fnc_scheduler",2];