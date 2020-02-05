private ["_unit","_costs","_weaponsX","_ammunition","_boxX","_items"];

_unit = _this select 0;

if (typeOf _unit == "Fin_random_F") exitWith {};

_unit setVariable ["surrendered",true];

if (side _unit == Occupants) then
	{
	_nul = [-2,0,getPos _unit] remoteExec ["A3A_fnc_citySupportChange",2];
	}
else
	{
	_nul = [1,0,getPos _unit] remoteExec ["A3A_fnc_citySupportChange",2];
	};
_weaponsX = [];
_ammunition = [];
_items = [];
_unit allowDamage false;
[_unit] orderGetin false;
_unit stop true;
_unit disableAI "MOVE";
_unit disableAI "AUTOTARGET";
_unit disableAI "TARGET";
_unit disableAI "ANIM";
//_unit disableAI "FSM";
_unit setSkill 0;
_unit setUnitPos "UP";
_boxX = "Box_IND_Wps_F" createVehicle position _unit;
_boxX allowDamage false;
clearMagazineCargoGlobal _boxX;
clearWeaponCargoGlobal _boxX;
clearItemCargoGlobal _boxX;
clearBackpackCargoGlobal _boxX;
_weaponsX = weapons _unit;
{_boxX addWeaponCargoGlobal [[_x] call BIS_fnc_baseWeapon,1]} forEach _weaponsX;
_ammunition = magazines _unit;
{_boxX addMagazineCargoGlobal [_x,1]} forEach _ammunition;
_items = assignedItems _unit + items _unit + primaryWeaponItems _unit;
{_boxX addItemCargoGlobal [_x,1]} forEach _items;
_boxX call jn_fnc_logistics_addAction;
removeAllWeapons _unit;
removeAllAssignedItems _unit;
[_unit,true] remoteExec ["setCaptive",0,_unit];
_unit setCaptive true;
sleep 1;
if (alive _unit) then
	{
	_unit playMoveNow "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";
	};
_unit setSpeaker "NoVoice";
_unit addEventHandler ["HandleDamage",
	{
	_unit = _this select 0;
	_unit enableAI "ANIM";
	if (!simulationEnabled _unit) then {if (isMultiplayer) then {[_unit,true] remoteExec ["enableSimulationGlobal",2]} else {_unit enableSimulation true}};
	}
	];
if (_unit getVariable ["spawner",false]) then
	{
	_unit setVariable ["spawner",nil,true]
	};

_markerX = _unit getVariable "markerX";

if (!isNil "_markerX") then
	{
	_sideX = side (group _unit);
	[_markerX,_sideX] remoteExec ["A3A_fnc_zoneCheck",2];
	};
[_unit] spawn A3A_fnc_postmortem;
[_boxX] spawn A3A_fnc_postmortem;
sleep 10;
_unit allowDamage true;
if (isMultiplayer) then {[_unit,false] remoteExec ["enableSimulationGlobal",2]} else {_unit enableSimulation false};
[_unit,"captureX"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_unit];
