private _filename = "fn_surrenderAction";
params ["_unit"];

if (typeOf _unit == "Fin_random_F") exitWith {};		// dogs do not surrender?

// ACE sometimes calls the wakeup handler when units die
// Safe code to prevent unit doing anything until we check that they're alive
_unit stop true;
_unit disableAI "MOVE";
_unit disableAI "AUTOTARGET";
_unit disableAI "TARGET";
_unit disableAI "ANIM";
//_unit disableAI "FSM";
_unit setSkill 0;
_unit setVariable ["surrendered", true, true];			// usually set by caller, just making sure

//Make sure to pass group lead if unit is the leader
if (_unit == leader (group _unit)) then
{
    private _index = (units (group _unit)) findIf {[_x] call A3A_fnc_canFight};
    if(_index != -1) then
    {
        (group _unit) selectLeader ((units (group _unit)) select _index);
    };
};
// make sure that the unit is actually alive & conscious before we start creating boxes
sleep 3;
if (!alive _unit) exitWith {};
if (lifeState _unit == "INCAPACITATED") exitWith {};
[_unit,true] remoteExec ["setCaptive",0,_unit];
_unit setCaptive true;

_unit allowDamage false;
unassignVehicle _unit;			// stop them getting back into vehicles
[_unit] orderGetin false;
_unit setUnitPos "UP";
_unit playMoveNow "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";		// hands up?
_unit setSpeaker "NoVoice";
_unit addEventHandler ["HandleDamage",
	{
	_unit = _this select 0;
	_unit enableAI "ANIM";
	if (!simulationEnabled _unit) then {if (isMultiplayer) then {[_unit,true] remoteExec ["enableSimulationGlobal",2]} else {_unit enableSimulation true}};
	}
	];

// create surrender box
private _boxX = "Box_IND_Wps_F" createVehicle position _unit;
_boxX allowDamage false;
//_boxX call jn_fnc_logistics_addAction;
clearMagazineCargoGlobal _boxX;
clearWeaponCargoGlobal _boxX;
clearItemCargoGlobal _boxX;
clearBackpackCargoGlobal _boxX;

// move all unit's equipment except uniform into the surrender crate
private _loadout = getUnitLoadout _unit;
for "_i" from 0 to 2 do {
	if !(_loadout select _i isEqualTo []) then {
		_boxX addWeaponWithAttachmentsCargoGlobal [_loadout select _i, 1];
	};
};
{_boxX addMagazineCargoGlobal [_x,1]} forEach (magazines _unit);
{_boxX addItemCargoGlobal [_x,1]} forEach (assignedItems _unit);
{_boxX addItemCargoGlobal [_x,1]} forEach (items _unit);
{_boxX addItemCargoGlobal [_x,1]} forEach [vest _unit, headgear _unit, goggles _unit];
private _backpack = backpack _unit;
if (_backpack != "") then {
	// because backpacks are often subclasses containing items
	_backpack = _backpack call A3A_fnc_basicBackpack;
	_boxX addBackpackCargoGlobal [_backpack, 1];
};
_unit setUnitLoadout [ [], [], [], [uniform _unit, []], [], [], "", "", [], ["","","","","",""] ];

// prevent surrendered units from spawning garrisons
if (_unit getVariable ["spawner",false]) then
	{
	_unit setVariable ["spawner",nil,true]
	};
if (side group _unit == Occupants) then
	{
	_nul = [-2,0,getPos _unit] remoteExec ["A3A_fnc_citySupportChange",2];
	}
else
	{
	_nul = [1,0,getPos _unit] remoteExec ["A3A_fnc_citySupportChange",2];
	};

// check for zone capture
private _markerX = _unit getVariable "markerX";
if (!isNil "_markerX") then
	{
	_sideX = side (group _unit);
	[_markerX,_sideX] remoteExec ["A3A_fnc_zoneCheck",2];
	};

// timed cleanup functions
[3,format["Cleanup called for unit:%1",_unit],_filename] call A3A_fnc_log;
[_unit] spawn A3A_fnc_postmortem;

[3,format["Cleanup called for boxx:%1",_boxX],_filename] call A3A_fnc_log;
[_boxX] spawn A3A_fnc_postmortem;

sleep 3;
_unit allowDamage true;
//if (isMultiplayer) then {[_unit,false] remoteExec ["enableSimulationGlobal",2]} else {_unit enableSimulation false};
[_unit,"captureX"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_unit];
