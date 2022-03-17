/*
	Author: Genesis

	Description:
		Checks for nearby vehicles that could be taken for the cause! Based on config, units will behave differently.

	Parameter(s):
		0: GROUP

	Returns:
		NOTHING
*/

//This function uses a mod friendly approach, that should be light weight and flexible.
//We will test this out - it should work for most functions. This function will hopefully be more optimized then pulling config entries repeatedly. Hopefully.

//Pull lists of units in the group - ONLY alive units
private _Allunits = ((units _this) select {alive _x});
private _Leader = leader _this;

//Create important lists to help determine which vehicles can be commandeered. This will not restrict who can be in the "pilot" seat, as the added "Realism" does not outweigh the visible gameplay impact.
private _Pilots = [];
private _Crewmen = [];


if (VCM_ClassSteal) then
{
	
	
	{
	
		//Pull classname of unit.
		private _UnitClass = typeof _x;
		
		//Add to crewman list
		if (["crew",_UnitClass] call BIS_fnc_inString) then
		{
			_Crewmen pushBack _x;
		};
		
		//Add to pilots list 
		if (["pilot",_UnitClass] call BIS_fnc_inString) then
		{
			_Pilots pushback _x;
		};
	
	} foreach _Allunits;
	
	
	//Now let's check for nearby vehicle from 

	
	{
	
		if (count _Crewmen > 0) then
		{
			if (_x iskindof "Tank" && {crew _x isEqualTo []} && {_x distance _Leader < VCM_AIDISTANCEVEHPATH} && {locked _x != 2}) then
			{
				_this addvehicle _x;
			};				
		};
		
		if (count _Pilots > 0) then
		{
			if (_x iskindof "Air" && {crew _x isEqualTo []} && {_x distance _Leader < VCM_AIDISTANCEVEHPATH} && {locked _x != 2}) then
			{
				_this addvehicle _x;
			};			
		};

	
		if (_x iskindof "Car" && {crew _x isEqualTo []} && {_x distance _Leader < VCM_AIDISTANCEVEHPATH} && {locked _x != 2}) then
		{
			_this addvehicle _x;
		};
	
	} foreach vehicles;
}
else
{
	
	{
	
		if (_x iskindof "LandVehicle" && {crew _x isEqualTo []} && {_x distance _Leader < VCM_AIDISTANCEVEHPATH} && {locked _x != 2}) then
		{
			_this addvehicle _x;
		};
	
	} foreach vehicles;

};