/*  =====================================================================================================
	MON_spawn.sqf
	Author: Monsada (chs.monsada@gmail.com)
		Comunidad Hispana de Simulaci?n:
		http://www.simulacion-esp.com
 =====================================================================================================
	Par?meters: [_artillery,(_rounds,_area,_cadence,_mincadence)] execvm "scripts\UPSMON\MON_artillery_add.sqf";
		<- _artillery 		object to attach artillery script, must be an object with gunner.
		<- ( _rounds ) 		number of rounds for the artillery [FLARE,SMOKE,HE]
		<- ( _area ) 		Dispersion area, 150m by default
		<- ( _maxcadence ) 	Cadence of fire, is random between min, default 10s
		<- ( _mincadence )	Minimum cadence, default 5s
 =====================================================================================================
	1.  Place a static weapon on map.
	2. Exec module in int of static weapon

		nul=[this] execVM "scripts\UPSMON\MON_artillery_add.sqf";

	1. Be sure static weapon has a gunner or place a "fortify" squad near, this will make squad to take static weapon.
	2. Create a trigger in your mission for setting when to fire. Set side artillery variable to true:

		UPSMON_ARTILLERY_EAST_FIRE = true;

	This sample will do east artilleries to fire on known enemies position, when you want to stop fire set to false.

	For more info:
	http://dev-heaven.net/projects/upsmon/wiki/Artillery_module
 =====================================================================================================*/
//if (!isserver) exitWith {};
if (!isServer and hasInterface) exitWith {};

//Waits until UPSMON is init
waitUntil {!isNil("UPSMON_INIT")};
waitUntil {UPSMON_INIT==1};

private ["_area","_maxcadence","_mincadence","_rounds","_vector","_grpmission","_grp","_cfgArtillery","_grpunits","_batteryunits","_assistsmortar","_unit","_vehicle","_result","_staticteam","_artimuntype","_id","_foundshell","_foundsmoke","_foundrocket","_foundillum","_vector","_sidearty"];

_area = 10;
_maxcadence = 6;
_mincadence = 3;
_rounds = [10,30,50];
_unit = _this select 0;

If (!alive _unit) exitwith {};

_grp = group _unit;

if ((count _this) > 1) then {_rounds = _this select 1;};
if ((count _this) > 2) then {_area = _this select 2;};
if ((count _this) > 3) then {_maxcadence = _this select 3;};
if ((count _this) > 4) then {_mincadence = _this select 4;};

_grp setvariable ["UPSMON_Artilleryarea",_area];
_grp setvariable ["UPSMON_Artillerymaxcadence",_maxcadence];
_grp setvariable ["UPSMON_Artillerymincadence",_mincadence];

[_unit,"DummyUPSMONMarker","NOWP3"] spawn UPSMON;