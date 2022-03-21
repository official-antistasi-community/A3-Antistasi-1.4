/*
	Author: Freddo, Edited by Genesis

	Description:
		Function for improving AI driving. AI drivers will avoid obstacles and units BETTER with this, at the cost of FPS.

	Parameter(s):
		0: ARRAY - Array containing drivers to affect

	Returns:
		NOTHING
	Example1:  driverArray spawn VCM_fnc_VehicleDetection;
*/

//This script aims to improve AI driving skills...It's basic. But it works.
{
	private _PredictPos = [_x,3] call VCM_fnc_MovePrediction;
	_PredictPos set [2,0.1];
	if (VCM_DebugOld) then 
	{
		_PredictPos spawn 
		{
			private _arrow = "Sign_Arrow_Cyan_F" createVehicleLocal [0,0,0];_arrow setPos _this;sleep 2;deleteVehicle _arrow;
		};
	};
	
	//Lets check for obstacles and make sure the vehicle does not hit them
	//Create an array of objects near predicted path
	//private _obstacles = _predictPos nearObjects ["ALL", VCM_DrivingDist]; // VCM_DrivingDist is search distance
	
	//Snap to the nearest road.
	private _NR = [_PredictPos, VCM_DrivingDist] call BIS_fnc_nearestRoad;
	if !(isNull _NR) then {_PredictPos = getpos _NR;};
	
	
	private _obstacles = nearestObjects [_predictPos, ["Strategic"], VCM_DrivingDist,true];
	
	
	//Remove gates, bridges and units vehicle from obstacles
	private _RemoveArray = [];
	private _veh = objectParent _x;
	{
		if (_veh isEqualTo _x || (_x isKindOf "AllVehicles") || {["gate",(str _x)] call BIS_fnc_inString} || {["bridge",(str _x)] call BIS_fnc_inString}) then
		{
			_RemoveArray pushback _x; //We do this method to avoid indexing errors.
		};
	} forEach _obstacles;
	
	//We do this method to avoid indexing errors.
	{
		private _Obj = _x;
		private _Index = _obstacles findIf {_x isEqualTo _Obj};
		_obstacles deleteAt _Index;
	} foreach _RemoveArray;
	
	private _hlprArray = [];

	if (count _obstacles > 0) then
	{
		_x forcespeed 10;
		{
			
			if !(_x getVariable ["VCM_AVOID", false] || {_x isKindOf "man"} || {_x isKindOf "Helper_Base_F"} || {_x isKindOf "Logic"}) then 
			{
				// Vcom ignore this object until loop complete
				_x setVariable ["VCM_AVOID", true];
				
				// Positions to spawn helper objects
				private _hlpPosArray = [];
				
				private _boundBox = boundingBoxReal _x;
				private _p2 = _boundBox select 1;
				
				_p2 params ["_p2MaxX","_p2MaxY","_p2MaxZ"];
				
				// Find corners of building bounding box
				_hlpPosArray pushBack (_x modelToWorld [_p2MaxX,_p2MaxY,-_p2MaxZ + 0.1]);
				_hlpPosArray pushBack (_x modelToWorld [-_p2MaxX,_p2MaxY,-_p2MaxZ + 0.1]);
				_hlpPosArray pushBack (_x modelToWorld [-_p2MaxX,-_p2MaxY,-_p2MaxZ + 0.1]);
				_hlpPosArray pushBack (_x modelToWorld [_p2MaxX,-_p2MaxY,-_p2MaxZ + 0.1]);
				// Get mid points of a building.
				_hlpPosArray pushBack (_x modelToWorld [0,-_p2MaxY,-_p2MaxZ + 0.1]);
				_hlpPosArray pushBack (_x modelToWorld [0,_p2MaxY,-_p2MaxZ + 0.1]);
				_hlpPosArray pushBack (_x modelToWorld [-_p2MaxX,0,-_p2MaxZ + 0.1]);
				_hlpPosArray pushBack (_x modelToWorld [_p2MaxX,0,-_p2MaxZ + 0.1]);
				
				// Spawn helper objects (These act as additional points of contact that the AI will attempt to avoid)
				{
					if ([_hlprArray, _x, true,"Driving"] call VCM_fnc_ClstObj distance2D _x > 1) then
					{
						private _hlpObj = "Land_Wrench_F" createVehicleLocal _x;
						_hlpObj setVariable ["VCM_AVOID", true];
						_hlpObj setPos _x;
						//_hlpObj setObjectTextureGlobal [0, ""];
						_hlprArray pushBack _hlpObj;
						_hlpObj setVelocity [0,0,0];
					};
				} forEach _hlpPosArray;
				
				//Spawn debug objects
				if (VCM_DebugOld) then
				{
					
					{
						private _ObjPos = getpos _x;
						[_ObjPos select 0, _ObjPos select 1, 0.2] spawn 
						{
							private _arrow = "Sign_Arrow_Large_F" createVehicle [0,0,0];
							_arrow setPos _this;
							sleep 9;
							deleteVehicle _arrow;
						};
						
					} forEach _hlprArray;
					
				};
			
	
				// Delete helper objects after some time
				[_hlprArray, _obstacles,_x] spawn 
				{
					sleep 9;
					{
						deleteVehicle _x;
					} forEach (_this select 0);
					{
						// Allow object to be considered again
						_x setVariable ["VCM_AVOID", false];
					} forEach (_this select 1);
					(_this#2) forcespeed -1;
					
				};
			
			};
			
		} forEach _obstacles;
	};
	
	
	//Avoid units.
	private _Livingobstacles = _predictPos nearObjects ["MAN",(VCM_DrivingDist*2)];
	private _Unit = _x;
	_LivingObstacles deleteAt (_Livingobstacles findIf {_x isEqualTo _Unit}); 
	private _Remove = [];
	{
		if !(_x isEqualTo (vehicle _x)) then {_Remove pushback _x;};
		if !([(side _Unit),(side _x)] call BIS_fnc_sideIsFriendly) then {_Remove pushback _x;};
	} foreach _Livingobstacles;
	
	//We do this method to avoid indexing errors.
	{
		private _Obj = _x;
		private _Index = _Livingobstacles findIf {_x isEqualTo _Obj};
		_Livingobstacles deleteAt _Index;
	} foreach _Remove;
	
	private _NearestUnit = [_Livingobstacles, _x, true,"Driving"] call VCM_fnc_ClstObj;
	if (_NearestUnit distance2D _x < 20) then
	{
		if (_NearestUnit distance2D _x < 5) then
		{
			_Unit forcespeed 0;
			_Unit spawn
			{
				sleep 5;
				_this forcespeed -1;
			};		
		}
		else
		{
			_Unit forcespeed 5;
			_Unit spawn
			{
				sleep 2;
				_this forcespeed -1;
			};
		};
	};
	
} foreach _this;