/****************************************************************
File: UPSMON_GetNearestCombat.sqf
Author: Azroul13

Description:
	Función que busca vehiculos cercanos y hace entrar a las unidades del lider
Parameter(s):
	<--- leader
	<--- Vehicle types
	<--- Searching radius
Returns:
	Array vehicles [[vehicles,emptypositions]]
****************************************************************/
private["_npc","_vehtypes","_distance","_types","_marker","_OCercanos","_emptypositions","_vehicles","_Cargocount","_Gunnercount","_Commandercount","_Drivercount","_isuav","_inzone"];	
					
_npc = _this select 0;	
_types = _this select 1;
_distance = _this select 2;	
_marker = _this select 3;		

_OCercanos = [];
_emptypositions = 0;
_vehicles = [];
_Cargocount = 0;
_Gunnercount = 0;
_Commandercount = 0;
_Drivercount = 0;
	
//Buscamos objetos cercanos
_OCercanos = _npc nearentities [["CAR","TANK","SHIP","HELICOPTER"], _distance];
		
{
	_isuav = getnumber (configFile >> "cfgVehicles" >> (typeOf (_x)) >> "isUav");
	if (_isuav != 1) then
	{
		_points = 0;
		_inzone = true;
		_Cargocount = (_x) emptyPositions "Cargo";
		
		_Gunnercount = _x call UPSMON_Emptyturret; 
		_Drivercount = (_x) emptyPositions "Driver"; 
		_Commandercount = (_x) emptyPositions "Commander"; 
		
		_emptypositions = _Cargocount + _Gunnercount + _Commandercount + _Drivercount;
		
		_points = _points + _emptypositions;
		
		If (_marker != "") then
		{
			_inzone = [getposATL _x,_marker] call UPSMON_pos_fnc_isBlacklisted;				
		};
		
		If ("transport" in _types && _Cargocount  == 0) then {_points = _points + 100};
		If ("gun" in _types && _Gunnercount == 0) then {_points = _points + 50};
	
		//ToDo check impact (locked _x != 2)
		If (getposATL _x select 2 <= 0.5) then
		{
			if (locked _x == 1 || locked _x == 0 || locked _x == 3) then 
			{
				If (damage _x == 0) then
				{
					If (canMove _x) then
					{
						If (_drivercount > 0) then
						{
							If (_x getvariable ["UPSMON_GrpId",0] == 0) then
							{
								If (_inzone) then
								{
									_vehicles pushback [_x,_emptypositions,_points];
								};
							};
						};
					}
				};
			};
		};
	};
}foreach _OCercanos;

_vehicles = [_vehicles, [], {_x select 2}, "DESCEND"] call BIS_fnc_sortBy;	
_vehicles;