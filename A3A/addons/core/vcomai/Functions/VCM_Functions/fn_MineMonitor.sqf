
/*
	Author: Genesis

	Description:
		This function will monitor all placed Vcom mines. Better than each mine having its own spawn.

	Parameter(s):
		NONE

	Returns:
		NOTHING
*/

//This list is all local.
private _RemoveLst = [];
{
	private _Mine = _x select 0;
	if (alive _Mine) then
	{
		private _Side = _x select 1;
		private _EL = [];
		private _TargetSide = "";
		private _Nearbylist = _Mine nearEntities [["Man","LandVehicle"], 2.5];

		if (count _Nearbylist > 0) then
		{
			{
				_TargetSide = side _x;
				if ([_Side, _TargetSide] call BIS_fnc_sideIsEnemy) then {_EL pushback _x;};
			} forEach _Nearbylist;
			
			if (count _EL > 0) then 
			{
				[_Mine, true] remoteExecCall ["enableSimulationGlobal",2];
				_Mine spawn {sleep 0.25;_this setdamage 1;};		
			};
		};
	}
	else
	{
		_RemoveLst pushback _x;
	};






} foreach VCOM_MINEARRAY;

{
	private _A = _x;
	VCOM_MINEARRAY deleteAt (VCOM_MINEARRAY findIf {_A isEqualTo _x;});
} foreach _RemoveLst;