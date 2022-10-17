/****************************************************************
File: UPSMON_Clones.sqf
Author: Azroul13

Description:
	The group dismount the vehicle, if the vehicle is unarmed the driver will dismount too.

Parameter(s):
	<--- Vehicle which unload his cargo
	<--- Group disembarking
Returns:
	nothing
****************************************************************/

if (UPSMON_Debug>0) then { player globalchat format["Mon_disembark started"];};
private ["_transport","_unitsgetout","_grp","_grps","_driver","_driverout"];				

_transport = _this select 0;
_unitsgetout = _this select 1;
_grp = _this select 2;
_supstatus = _this select 3;

_transport setvariable ["UPSMON_disembarking",true];

_grps = [];
_grps pushback _grp;
	
if (!alive _transport) exitwith{};
	
_driver = driver _transport;

if ( count _unitsgetout > 0 ) then 
{		
	{
		If (!(group _x in _grps)) then {_grps pushback (group _x)};
	} foreach _unitsgetout;
	
	{
		_x getvariable ["UPSMON_disembarking",true];
	} foreach _grps;
	
	// All units disembark if the vehicle is a Car
	Dostop _driver;
	_driver disableAI "MOVE";
	//Stop the veh for 5.5 sek
	sleep 1.5; // give time to actualy stop
	
	if (Isnull (gunner _transport)) then
	{
		//We removed the id to the vehicle so it can be reused
		_transport setVariable ["UPSMON_grpid", 0, false];	
		_transport setVariable ["UPSMON_cargo", [], false];	
						
		// [_npc,_x, _driver] spawn UPSMON_checkleaveVehicle; // if every one outside, make sure driver can walk
		if (((group _transport) getvariable ["UPSMON_Grpmission",""]) != "TRANSPORT") then
		{
			_driver enableAI "MOVE";
			_unitsgetout pushback _driver
		};
		
		//We removed the id to the vehicle so it can be reused
		_transport setVariable ["UPSMON_grpid", 0, false];	
	};
		
	If (_supstatus != "") then
	{
		_weapons  = getarray  (configFile >> "CfgVehicles" >> typeof _transport >> "weapons");
		If ("SmokeLauncher" in _weapons) then
		{
			_nosmoke = [_grp] call UPSMON_NOSMOKE;
			If (!_nosmoke) then {[_transport] spawn UPSMON_DoSmokeScreen;};
		};
	};
	[_transport,_unitsgetout] call UPSMON_UnitsGetOut;
	_driver enableAI "MOVE";
		
	_transport setVariable ["UPSMON_cargo", [], false];	
};

If (UPSMON_Debug > 0) then {diag_log format ["transport:%1",_unitsgetout]};
If (((group _transport) getvariable ["UPSMON_Grpmission",""]) == "TRANSPORT") then
{
	[_transport] spawn UPSMON_Returnbase;
};

_transport setvariable ["UPSMON_disembarking",false];
{
	_x getvariable ["UPSMON_disembarking",false];
	If (_x getvariable ["UPSMON_InTransport",false]) then {_x setvariable ["UPSMON_InTransport",false];};
	If (_x getvariable ["UPSMON_Grpmission",""] == "WAITTRANSPORT") then {_x setvariable ["UPSMON_Grpmission","PATROL"]};
} foreach _grps;