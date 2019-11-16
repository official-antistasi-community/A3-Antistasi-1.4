/****************************************************************
File: UPSMON_FO.sqf
Author: Azroul13

Description:
	Analyse the situation for artillery support, target and munition to use for them.

Parameter(s):
	<--- group
	<--- leader position
	<--- Attack position
	<--- Dist from target
	<--- Enemies array
Returns:
	Nothing
****************************************************************/

private ["_grp","_currpos","_attackpos","_dist","_enies","_suspectenies","_RadioRange","_artillerysideunits","_suspectpos","_artitarget","_mission"];

_grp = _this select 0;
_currpos = _this select 1;
_attackpos = _this select 2;
_dist = _this select 3;
_enies = _this select 4;
_mission = "HE";
If (count _this > 5) then {_mission = _this select 5};

_RadioRange = _grp getvariable ["UPSMON_RADIORANGE",0];
_artillerysideunits = (call (compile format ["UPSMON_ARTILLERY_%1_UNITS",side _grp])) - [_grp];

If (_mission == "ILLUM") then
{

	[_artillerysideunits,"ILLUM",_RadioRange,_currpos,3,_attackpos,50] spawn UPSMON_selectartillery;
	_time = time + 10;
	_grp setvariable ["UPSMON_Articalltime",_time];
}
else
{
	If (_grp getvariable ["UPSMON_Grpmission",""] == "RETREAT") then
	{
		If (_dist > 200) then
		{
			_time = time + 10;
			_grp setvariable ["UPSMON_Articalltime",_time];
			_vcttarget = [_currpos, _attackpos] call BIS_fnc_dirTo;
			_dist = (_currpos vectorDistance _attackpos)/2;
			_attackpos = [_currpos,_vcttarget, _dist] call UPSMON_GetPos2D;
			[_artillerysideunits,"SMOKE",_RadioRange,_currpos,4,_attackpos,50] spawn UPSMON_selectartillery;
		};
	}
	else 
	{
		_artitarget = [_enies,_currpos] call UPSMON_GetArtiTarget;
		_area = 30;
		If (!IsNull _artitarget) then
		{
			_muntype = "HE";
			_nbr = 4;
			If (vehicle _artitarget == _artitarget) then
			{
				If ([_artitarget] call UPSMON_Inbuilding) then
				{
					_nbr = 2;
					_area = 5;
				};
			}
			else
			{
				if (_artitarget iskindof "Tank") then
				{
					_nbr = 2;
					_area = 10;
					_muntype = "AT";
				};
			};
			_time = time + 10;
			_grp setvariable ["UPSMON_Articalltime",_time];
			[_artillerysideunits,_muntype,_RadioRange,_currpos,_nbr,_artitarget,_area] spawn UPSMON_selectartillery;
		};
	};
};