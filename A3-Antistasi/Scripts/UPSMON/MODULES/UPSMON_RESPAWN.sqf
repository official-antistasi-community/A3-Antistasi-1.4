/****************************************************************
File: UPSMON_RESPAWN.sqf
Author: Monsada

Description:
	The script will create X Group with the same parameters and unit than the group of reference

Parameter(s):
	<--- Parameters of the original group
	<--- Surrended (boolean)
	<--- Side of the group
Returns:
	nothing
****************************************************************/
private ["_grp","_grpidx","_track","_orgpos","_respawn","_respawnmax","_unittype","_membertypes","_rnd","_grp","_lead","_initstr","_targetpos","_spawned","_vehicletypes","_UCthis","_respawndelay","_group","_puf"];

_grp = _this select 0;
_UCthis = _this select 1;
//[_currpos,_behaviour,_speed,_formation,_members,_side]
_puf = _grp getvariable ["UPSMON_Origin",[[0,0,0],"NORMAL","WEDGE",[objNull],independent]];//modified to avoid .rpt error reports
_side = _puf select 5;
if (isNil "_side") then {_side = independent};//by Barbolani to avoid some unknown bugs
_grpid = _grp getvariable ["UPSMON_Grpid",0];
_removeunit = _grp getvariable ["UPSMON_Removegroup",false];

_dist = 1000;
_respawnmax = 0;


if (UPSMON_Debug>0) then {hint format["%1 exiting mainloop",_grpid]; diag_log format ["exit: %1 %2 %3 %4",_grp,units _grp,alive leader _grp,_removeunit];};
//Limpiamos variables globales de este groupX
//UPSMON_targetsPos set [_grpid,[0,0]];
if (_side == civilian) then
{
	if (_grp in UPSMON_Civs) then {UPSMON_Civs = UPSMON_Civs - [_grp];};
}
else
{
	if (_grp in UPSMON_NPCs) then {UPSMON_NPCs = UPSMON_NPCs - [_grp];};
};

switch (_side) do
{
	case West:
	{
		if (_grp in UPSMON_TRANSPORT_WEST_UNITS) then  {UPSMON_TRANSPORT_WEST_UNITS = UPSMON_TRANSPORT_WEST_UNITS - [_grp];};
		if (_grp in UPSMON_REINFORCEMENT_WEST_UNITS) then  {UPSMON_REINFORCEMENT_WEST_UNITS = UPSMON_REINFORCEMENT_WEST_UNITS - [_grp];};
		if (_grp in UPSMON_ARTILLERY_WEST_UNITS) then  {UPSMON_ARTILLERY_WEST_UNITS = UPSMON_ARTILLERY_WEST_UNITS - [_grp];};
	};
	case EAST:
	{
		if (_grp in UPSMON_TRANSPORT_EAST_UNITS) then  {UPSMON_TRANSPORT_EAST_UNITS = UPSMON_TRANSPORT_EAST_UNITS - [_grp];};
		if (_grp in UPSMON_REINFORCEMENT_EAST_UNITS) then  {UPSMON_REINFORCEMENT_EAST_UNITS = UPSMON_REINFORCEMENT_EAST_UNITS - [_grp];};
		if (_grp in UPSMON_ARTILLERY_EAST_UNITS) then  {UPSMON_ARTILLERY_EAST_UNITS = UPSMON_ARTILLERY_EAST_UNITS - [_grp];};
	};
	case resistance:
	{
		if (_grp in UPSMON_TRANSPORT_GUER_UNITS) then  {UPSMON_TRANSPORT_GUER_UNITS = UPSMON_TRANSPORT_GUER_UNITS - [_grp];};
		if (_grp in UPSMON_REINFORCEMENT_GUER_UNITS) then  {UPSMON_REINFORCEMENT_GUER_UNITS = UPSMON_REINFORCEMENT_GUER_UNITS - [_grp];};
		if (_grp in UPSMON_ARTILLERY_GUER_UNITS) then  {UPSMON_ARTILLERY_GUER_UNITS = UPSMON_ARTILLERY_GUER_UNITS - [_grp];};
	};

};

UPSMON_Exited=UPSMON_Exited+1;

If (!_removeunit) then
{

	sleep (_grp getvariable ["UPSMON_RESPAWNDELAY",0]);

	_respawnmax = _grp getvariable ["UPSMON_RESPAWNTIME",0];
	_orgpos = _grp getvariable ["UPSMON_RESPAWNPOS",[0,0,0]];
	//Verify if targets near respawn
	_mensnear = _orgpos nearentities [["CAManBase","TANK","CAR"],800];
	_enemySides = _side call BIS_fnc_enemySides;
	_enynear = false;
	{
		If (side _x in _enemySides) then {_enynear = true;}
	} foreach _mensnear;

	//does respawn of group =====================================================================================================
	if (_grp getvariable ["UPSMON_RESPAWN",false] && _respawnmax > 0 &&  (_grp getvariable ["UPSMON_Grpmission",""] != "SURRENDER")  && !_enynear) then
	{
		if (UPSMON_Debug>0) then {player sidechat format["%1 doing respawn",_grpid]};

		_membertypes = (_grp getvariable "UPSMON_RESPAWNUNITS") select 0;
		_vehicletypes = (_grp getvariable "UPSMON_RESPAWNUNITS") select 1;
		_crews = [];

		// any init strings?
		_initstr = ["INIT:","",_UCthis] call UPSMON_getArg;

		// make the clones civilians
		// use random Civilian models for single unit groups

		_group = createGroup _side;

		_lead = ObjNull;
		// copy team members (skip the leader)
		_i=0;
		{
			_unittype = _x select 0;
			if (_side == Civilian) then {_rnd=1+round(random 20); if (_rnd>1) then {_unittype=format["Civilian%1",_rnd]}};
			_roletype = _x select 2;
			_targetpos = _orgpos findEmptyPosition [5,50];
			if (count _targetpos == 0) then {_targetpos = _orgpos};
			_newunit = _group createUnit [_unittype, _targetpos, [], 0, "FORM"];
			_equipment = _x select 1;
			[_newunit,_equipment] call UPSMON_addequipment;

			if (isMultiplayer) then
			{
				[netid _newunit, _initstr] remoteExec ["UPSMON_fnc_setVehicleInit", 0,true];
			} else
			{
				_unitstr = "_newunit";
				_index=[_initstr,"this",_unitstr] call UPSMON_Replace;
				call compile format ["%1",_index];
			};

			If (count _roletype > 0) then
			{
				_crews pushback [_newunit,_roletype];
			};

			[_newunit] join _group;
			If (_i == 0) then
			{
				_group selectLeader _newunit;
				_lead = _newunit;
			};
			_i=_i+1;
			sleep 0.1;
		} foreach _membertypes;


		if ( _lead == vehicle _lead) then {
		{
				if (alive _x && canmove _x) then
				{
					[_x] dofollow _lead;
				};
				sleep 0.1;
			} foreach units _lead;
		};

		{
			_vehicle = _x;
			_targetpos = _orgpos findEmptyPosition [10, 200];
			if (count _targetpos == 0) then {_targetpos = _orgpos};
			//if (UPSMON_Debug>0) then {player globalchat format["%1 create vehicle _newpos %2 ",_x,_targetpos]};
			_newunit = (_vehicle select 0) createvehicle (_targetpos);
			_newunit setdir (_vehicle select 1);
			{
				_crew = _x select 0;
				_role = (_x select 1) select 0;
				unassignVehicle _crew;
				switch (_role) do
				{
					case "driver":
					{
						_crew moveindriver _newunit
					};
					case "commander":
					{
						_crew moveincommander _newunit
					};
					case "Turret":
					{
						_crew moveInTurret [_newunit,(_x select 1) select 1]
					};
					case "cargo":
					{
						_crew moveinCargo _newunit
					};
					case "default":
					{
					};
				};
				sleep 0.02;
			} foreach _crews;
		} foreach _vehicletypes;


		//if (UPSMON_Debug>0) then {player globalchat format["%1 _vehicletypes: %2",_grpidx, _vehicletypes]};

		_spawned= if ("SPAWNED" in _UCthis) then {true} else {false};
		//Set new parameters
		if (!_spawned) then
		{

			_UCthis = _UCthis + ["SPAWNED"];

			if ((count _vehicletypes) > 0) then
			{
				_UCthis = _UCthis + ["VEHTYPE:"] + ["dummyveh"];
			};
		};


		_UCthis set [0,_lead];
		_respawnmax = _respawnmax - 1;
		_UCthis =  ["RESPAWN:",_respawnmax,_UCthis] call UPSMON_setArg;
		sleep 0.1;
		_UCthis =  ["VEHTYPE:",_vehicletypes,_UCthis] call UPSMON_setArg;

		//Exec UPSMON script
		_UCthis spawn UPSMON;
		sleep 0.1;
	};
};

if (({alive _x} count units _grp) == 0 ) then {
	deleteGroup _grp;
};