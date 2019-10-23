/****************************************************************
File: UPSMON_UnitsGetIn.sqf
Author: Azroul13

Description:
	Funcion que mete la tropa en el vehiculo
Parameter(s):
	<--- id of the group
	<--- array of units that will embark in the vehicle
	<--- Do the unit needs to be spawn in the vehicle
Returns:
	
****************************************************************/
private["_grpid","_vehicle","_npc","_driver","_gunner", "_unitsin", "_units" , "_Commandercount","_Drivercount","_Gunnercount","_cargo",
		"_Cargocount","_emptypositions","_commander","_vehgrpid","_cargo","_gunners"];	
			
_grpid = _this select 0;
_unitsin = _this select 1;
_vehicle = _this select 2;
_spawninveh = false;
if ((count _this) > 3) then {_spawninveh = _this select 3;};
	
_units = _unitsin;				
_driver = objnull;
_gunner = objnull;	
_commander	= objnull;
_Cargocount = 0;
_Gunnercount = 0;
_Commandercount = 0;
_Drivercount = 0;
_cargo = [];
	
_Cargocount = (_vehicle) emptyPositions "Cargo";
_Gunnerturrets = _vehicle call UPSMON_fnc_commonTurrets; 
_Commandercount = (_vehicle) emptyPositions "Commander"; 
_Drivercount = (_vehicle) emptyPositions "Driver"; 					

//Obtenemos el identificador del vehiculo
_vehgrpid = _vehicle getvariable ["UPSMON_grpid",0];
_cargo = _vehicle getvariable ["UPSMON_cargo",[]];			

_cargo = _cargo - _unitsin; //Para evitar duplicados
_cargo = _cargo + _unitsin; //Añadimos a la carga
_vehicle setVariable ["UPSMON_cargo", _cargo, false];			

//Hablitamos a la IA para entrar en el vehiculo
//Tell AI to get in vehicle
{		
	Dostop _x;
		
	if ("StaticWeapon" countType [vehicle (_x)]>0) then 
	{
		_x spawn UPSMON_doGetOut;
	};			

	unassignVehicle _x;				
	_x spawn UPSMON_Allowgetin;						
} foreach _units;				
	
//Assigned to the leader as commander or cargo		
{
	if ( _vehgrpid == _grpid && _x == leader _x && _Commandercount > 0 ) exitwith
	{
		_Commandercount = 0;
		_commander = _x;
		[_commander,"COMMANDER",_vehicle,0] spawn UPSMON_assignasrole;		
		_units = _units - [_x];
	};

	if ( _x == leader _x && _Cargocount > 0 ) exitwith
	{
		[_x,"CARGO",_vehicle,0] spawn UPSMON_assignasrole;
		_units = _units - [_x];
		_Cargocount = _Cargocount - 1;
	};
} foreach _units;			
//if (UPSMON_Debug>0 ) then {player sidechat format["%1: _vehgrpid %2 ,_Gunnercount %3, %4",_grpid,_vehgrpid,_Gunnercount,count _units]}; 	
				
//Si el vehiculo pertenece al grupo asignamos posiciones de piloto, sinó solo de carga
//Make sure some AI will get in as driver (and if available as gunner(s))

if ( _vehgrpid == _grpid ) then 
{		
	//Asignamos el conductor
	if (_Drivercount > 0) then 
	{ 
		If (count (_units) > 0) then
		{
			_driver =  _units  select (count _units - 1);									
			[_driver,"DRIVER",_vehicle,0] spawn UPSMON_assignasrole;	
			_units = _units - [_driver];
		};
	};
		
	//Asignamos el artillero
	if ( count _Gunnerturrets > 0) then 
	{ 
		If (count (_units) > 0) then
		{
			_gunners = [];
			_i = - 1;
			{
				_i = _i + 1;
				If (_i > (count _Gunnerturrets - 1)) exitwith {_gunners};
				_gunners pushback _x;
				_turret = _Gunnerturrets select _i;
				[_x,"GUNNER",_vehicle,0,_turret,_spawninveh] spawn UPSMON_assignasrole;					
			} foreach _units;
			_units = _units - _gunners;
		};
	};					
};
	
//if (UPSMON_Debug>0 ) then {player sidechat format["%1: _vehgrpid=%2 units=%4",_grpid,_vehgrpid,_cargocount,count _units]}; 	
//Movemos el resto como carga
if ( _Cargocount > 0) then 
{ 	
	If (count (_units) > 0) then
	{
		{	
			[_x,"CARGO",_vehicle,0] spawn UPSMON_assignasrole;					
		} forEach _units;
	};
};	
	
{						
	[_x] spawn UPSMON_avoidDissembark;				
} forEach _unitsin - [_driver] - [_gunner] -[_commander]; 