/****************************************************************
File: UPSMON_artillerydofire.sqf
Author: Azroul13

Description:
	Make Artillery fire !!
	
Parameter(s):
	<--- Artillery Group
	<--- target position
	<--- Area of dispersion
	<--- Number of rounds
	<--- Artillery Mission
Returns:
	nothing
****************************************************************/

private ["_grp","_position","_area","_area2","_area3","_roundsask","_askmission","_maxcadence","_mincadence","_batteryunits","_result","_i","_roundclass","_roundsleft","_sleep","_timeout"];
		
_grp = _this select 0;
_position  = _this select 1;	
_area = _this select 2;		
_roundsask = _this select 3;
_askmission = _this select 4;
	
_maxcadence = _grp getvariable ["UPSMON_Artillerymaxcadence",6];	
_mincadence = _grp getvariable ["UPSMON_Artillerymincadence",3];
_batteryunits = _grp getvariable ["UPSMON_Battery",[]];
_area2 = _grp getvariable ["UPSMON_Artilleryarea",1];
_npc = leader _grp;


_grp setvariable ["UPSMON_Batteryfire",true];	
_result = [0,Objnull,0,0];

If (count (_grp getvariable ["UPSMON_Mortarmun",[]]) > 0) then
{	
	If (((_grp getvariable ["UPSMON_Battery",[]])select 0) isEqualType []) then
	{
		_result = [_askmission,typeof (vehicle ((_batteryunits select 0) select 0))] call UPSMON_getmuninfosbackpack;
		_batteryunits = [];
		_batteryunits pushback ((_batteryunits select 0) select 0);
	}
	else
	{
		_result = [_askmission,typeof (vehicle (_batteryunits select 0))] call UPSMON_getmuninfosbackpack;
	};
}
else
{
	_result = [_askmission,_batteryunits] call UPSMON_getmuninfos;
};

_roundclass = _result select 1;

If (_result select 3 < 200) then {_roundsask = _roundsask*2;};
If (_result select 3 >= 400) then {_roundsask = _roundsask/2;};
			
If (_roundsask > _result select 0) then {_roundsask = _result select 0;};

If (count (_grp getvariable ["UPSMON_Mortarmun",[]]) > 0) then
{
	_roundsleft = _grp getvariable ["UPSMON_Mortarmun",[]];
	switch (_askmission) do
	{
		case "HE":
		{
			_roundsleft set [0,((_grp getvariable ["UPSMON_Mortarmun",[]]) select 0) - _roundsask];
			_grp setvariable ["UPSMON_Mortarmun",_roundsleft]
		};
		case "SMOKE":
		{
			_roundsleft set [1,((_grp getvariable ["UPSMON_Mortarmun",[]]) select 1) - _roundsask];
			_grp setvariable ["UPSMON_Mortarmun",_roundsleft]		
		};
		case "ILLUM":
		{
			_roundsleft set [2,((_grp getvariable ["UPSMON_Mortarmun",[]]) select 2) - _roundsask];
			_grp setvariable ["UPSMON_Mortarmun",_roundsleft]		
		};		
	};
};
		
If (_askmission == "ILLUM") then {[] spawn UPSMON_Flaretime;};
		
_area3 = _area * (_area2 + random 0.4);
		
If (UPSMON_DEBUG > 0) then 
{
	player globalchat format["artillery doing fire on %1",_position];
	[_position,"Icon","mil_arrow","Colorblue",0] spawn UPSMON_createmarker
};
	
sleep 1;
_i = 0;
_timeout = time + 140;
		
while {_i<_roundsask && count _batteryunits > 0 && time < _timeout} do
{
	{
		if (alive (gunner (vehicle _x)) && (getnumber (configFile >> "cfgVehicles" >> (typeOf (vehicle _x)) >> "artilleryScanner") == 1)) then
		{
			_i=_i+1;
			//(vehicle _x) addMagazine _roundclass;
			(vehicle _x) commandArtilleryFire [[(_position select 0)+ random _area3 - _area, (_position select 1)+ random  _area3 - _area, 0], _roundclass, 1];	
		}
		else
		{
			_batteryunits = _batteryunits - [_x];
		};
		sleep 1;
	} foreach _batteryunits;
			
	_sleep = random _maxcadence;			
	if (_sleep < _mincadence) then {_sleep = _mincadence};
	sleep _sleep;
};

[_batteryunits] call UPSMON_artillerybatteryout;

_grp setvariable ["UPSMON_Batteryfire",false];
_grp setvariable ["UPSMON_Artifiremission",[]];
_grp setvariable ["UPSMON_RoundsComplete",true];

sleep 30;
If (!IsNull _grp) then
{	
	If (alive (leader _grp)) then
	{
		_grp setVariable ["UPSMON_ArtiBusy",false];
	};
};