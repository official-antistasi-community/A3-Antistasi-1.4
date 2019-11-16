/****************************************************************
File: UPSMON_GetNearestCombat.sqf
Author: Azroul13

Description:
	Funci�n que busca vehiclesX closeX y hace entrar a las unitsX del lider
Parameter(s):
	<--- leader
	<--- Vehicle types
	<--- Searching radius
Returns:
	Array vehicles [[vehicles,emptypositions]]
****************************************************************/
private["_npc","_distance","_marker","_OcloseX","_emptypositions","_vehicles","_isuav","_inzone"];	
					
_npc = _this select 0;	
_distance = _this select 1;		
_marker = _this select 2;		

_OcloseX = [];
_emptypositions = 0;
_vehicles = [];
_Cargocount = 0;
_Gunnercount = 0;
_Commandercount = 0;
_Drivercount = 0;
	
//Buscamos objectsX closeX
_OcloseX = _npc nearentities [["StaticWeapon"], _distance];
		
{
	_isuav = getnumber (configFile >> "cfgVehicles" >> (typeOf (_x)) >> "isUav");
	if (_isuav != 1) then
	{
		_inzone = true;
		_emptypositions = _x call UPSMON_Emptyturret;  
		
		If (_marker != "") then
		{
			_inzone = [getposATL _x,_marker] call UPSMON_pos_fnc_isBlacklisted;				
		};
	
		//ToDo check impact (locked _x != 2)
		if (locked _x == 1 || locked _x == 0 || locked _x == 3) then 
		{
			If (damage _x == 0) then
			{
				If (canMove _x) then
				{
					If (_emptypositions > 0) then
					{
						If (_inzone) then
						{
							_vehicles pushback [_x,_emptypositions];
						};
					};
				}
			};
		};
	};
}foreach _OcloseX;
	
_vehicles;