/*  =====================================================================================================
	UPSMON_CreateGroup.sqf
	Author: Azroul13
 =====================================================================================================		
	Parámeters: _grp = [position,side,[unitsarray],[min units,max units per group],3,["markername","SAFE","COLUMN"]] call UPSMON_CreateGroup;	
		<- _position 		Position where the group will spawn
		<- side 			Side of the group (EAST,WEST,GUER,CIVILIAN)
		<- [unitsarray]		Array with classname of unit you want to spawn (classname will be choose randomly)
		<- [min,max] 		Minimum and maximun units you want to spawn in the group [1,4]
		<- 3				amount of mandatory units
		<- ["markername"]	UPSMON parameters for the group
 =====================================================================================================
 =====================================================================================================*/
if (!isServer && hasInterface ) exitWith {};

if (isNil("UPSMON_INIT")) then {
	UPSMON_INIT=0;
};

waitUntil {UPSMON_INIT==1};

private ["_position","_side","_unitsarray","_options1","_size","_ucthis","_lead","_unitsnbr","_min","_max","_unitstype","_unitstypes2","_unitpos","_unit","_vehicle","_crew"];
	
	_position 	= _this select 0;
	_side 		= _this select 1;
	_unitsarray = _this select 2;
	_options1 	= _this select 3;
	_size 		= _this select 4;
	_ucthis 	= _this select 5;
	
	_lead = ObjNull;
	_unitsnbr = 1;
	_min = _options1 select 0;
	_max = _options1 select 1;
	If (_min > _max) then {_min = _max};
	_unitsnbr = _min+random (_max-_min);
	_unitstypes2 = _unitsarray;
	_unitstypes2 = _unitstypes2 call UPSMON_arrayShufflePlus;

	_grp = createGroup _side;

for [{_i=0}, {_i<_unitsnbr}, {_i=_i+1}] do
{
	_unitpos = _position findEmptyPosition [2,20];
	if (count _unitpos == 0) then {_unitpos = _position};
	_unittype = "";

	If ((_i + 1) <= _size) then
	{
		_unittype = (_unitsarray) select _i;
	}
	else
	{
		_unittype = _unitstypes2 select (floor (random (count _unitstypes2)));
	};

	_unit = ObjNull;
	
	//If the type of the unit is a vehicle then spawn some crews
	If (!(_unittype iskindof "CAManBase")) then
	{
		_vehicle = createVehicle [_unittype,_unitpos,[], 0, "NONE"]; 
		_crew = tolower gettext (configFile >> "CfgVehicles" >> _unittype >> "crew");
		{
			_unit = _grp createUnit [_crew, _unitpos, [], 0, "form"];
			Unassignvehicle _unit;
			
			If ((_vehicle emptyPositions _x) > 0) then 
			{
				If ("DRIVER" == _x) then {_unit moveindriver _vehicle};
				If ("GUNNER" == _x) then {_unit moveingunner _vehicle};
				If ("COMMANDER" == _x) then {_unit moveincommander _vehicle};
			};
			[_unit] join _grp;
		} foreach ["DRIVER","GUNNER","COMMANDER"];
	}
	else
	{
		_unit = _grp createUnit [_unittype, _unitpos, [], 0, "form"];
		[_unit] join _grp;
	};
	
	If (_i == 0) then
	{
		_lead = _unit;
	};
};

_grp selectLeader _lead;
_ucthis = [_lead] + _Ucthis;

_Ucthis spawn UPSMON;

_grp;