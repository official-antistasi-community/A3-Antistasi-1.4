/*
	Author: Genesis

	Description:
		Plants a mine

	Parameter(s):
		0: OBJECT - Unit to plant a mine
		1: ARRAY - ???

	Returns:
		NOTHING
*/

{

if (VCM_MINECHANCE > (round (random 100)) || {!(isPlayer _x)}) then 
{

	private _Unit = _x;
	private _nearestEnemy = _unit call VCM_fnc_ClstEmy;
	if (_nearestEnemy isEqualTo [] || {isNil "_nearestEnemy"}) exitWith {};

	private _mine = "";

if (_nearestEnemy distance2D _unit < 100) then
{
	private _magsAmmo = magazinesAmmo _Unit;
	{
		private _mag = _x select 0;
		private _Index = (VCM_MineList findif {_mag isEqualTo _x#1});
		if (_Index > -1) exitWith
		{
			private _Mine = VCM_MineList#_Index; 
			_Unit fire [(_Mine#3),(_Mine#3),(_Mine#1)];
			[_Unit,(_Mine#2)] spawn
			{
				params ["_Unit","_Mine"];
				private _Pos = getpos _Unit;
				sleep 3;
				private _NrstMine = nearestObjects [_Pos,[],1];
				{
					if (_Mine isEqualTo (typeof _x)) then
					{
						_x setposATL (getposATL _closestRoad);
						_unitSide = (side _unit);
						VCOM_mineArray pushBack [_x,_unitSide];
					};
				} foreach _NrstMine;			
			};			
		};
	} foreach _magsAmmo;
}
else
{
	_nearRoads = _unit nearRoads 50;
	if (count _nearRoads > 0) then 
	{
		private _closestRoad = [_nearRoads,_unit,true] call VCM_fnc_ClstObj;
		private _magsAmmo = magazinesAmmo _Unit;
		{
			private _mag = _x select 0;
			private _Index = (VCM_MineList findif {_mag isEqualTo _x#1});
			if (_Index > -1) exitWith
			{
				private _Mine = VCM_MineList#_Index; 
				_Unit fire [(_Mine#3),(_Mine#3),(_Mine#1)];
				[_unit,"AinvPknlMstpSnonWnonDnon_Putdown_AmovPknlMstpSnonWnonDnon"] remoteExec ["Vcm_PMN",0];
				[_Unit,(_Mine#2)] spawn
				{
					params ["_Unit","_Mine"];
					private _Pos = getpos _Unit;
					sleep 3;
					private _NrstMine = nearestObjects [_Pos,[],1];
					{
						if (_Mine isEqualTo (typeof _x)) then
						{
							_x setposATL (getposATL _closestRoad);
							_unitSide = (side _unit);
							VCOM_mineArray pushBack [_x,_unitSide];
						};
					} foreach _NrstMine;			
				};
				
			};
		} foreach _magsAmmo;
		
	}
	else
	{
		private _magsAmmo = magazinesAmmo _Unit;
		{
			private _mag = _x select 0;
			private _Index = (VCM_MineList findif {_mag isEqualTo _x#1});
			if (_Index > -1) exitWith
			{
				private _Mine = VCM_MineList#_Index; 
				_Unit fire [(_Mine#3),(_Mine#3),(_Mine#1)];
				[_unit,"AinvPknlMstpSnonWnonDnon_Putdown_AmovPknlMstpSnonWnonDnon"] remoteExec ["Vcm_PMN",0];
				[_Unit,(_Mine#2)] spawn
				{
					params ["_Unit","_Mine"];
					private _Pos = getpos _Unit;
					sleep 3;
					private _NrstMine = nearestObjects [_Pos,[],1];
					{
						if (_Mine isEqualTo (typeof _x)) then
						{
							_unitSide = (side _unit);
							VCOM_mineArray pushBack [_x,_unitSide];
						};
					} foreach _NrstMine;			
				};
				
			};
		} foreach _magsAmmo;
	};
};


//[_Mine, false] remoteExecCall ["enableSimulationGlobal",2];
};
} foreach (units _this);
