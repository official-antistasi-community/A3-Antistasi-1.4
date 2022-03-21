params ["_Unit","_MP"];

private _CP = [_MP,_Unit,true,"EM"] call VCM_fnc_ClstObj;
private _FinalPoint = (_MP# (count _MP - 1));
_Index = _MP findif {_CP isEqualTo _x};
_MP deleteAt _Index;
_a = _CP getDir _FinalPoint;
private _NewPos = _CP getPos [25,_a];
private _UH = (getPosASL _Unit)#2;
private _UnitASL = getposASL _Unit;
_CP = AGLtoASL _CP;
_NewPos = AGLtoASL _NewPos;
_IObjA = lineintersectsSurfaces [[(_UnitASL#0),(_UnitASL#1),((_UnitASL#2) + 1)],[(_NewPos#0),(_NewPos#1),((_NewPos#2) + 1)], _Unit, objNull, true, 1, "GEOM", "FIRE"];

if (count _IObjA > 0) then
{
	private _IPos = _IObjA#0#0;
	private _IObj = _IObjA#0#2;
	
	
	if (VCM_DebugOld) then
	{
		_abcd2 = createVehicle ["Sign_Arrow_Green_F", _IPos, [], 0, "can_collide"];
		_abcd2 setposasl _IPos;
		_abcd2 spawn {sleep 5;deleteVehicle _this;};
	};					
	
	private _IsCloser = AGLtoASL (_IPos getPos [3,(_Unit getDir _IPos)]);
	private _list = _IsCloser nearObjects ["All",2];
	private _list2 = nearestTerrainObjects [_IsCloser, [], 2];
	
	
	private _OP1 = getposASL _IObj;
	private _OPD1 = getDir _IObj;
	private _OPDRP1 = AGLtoASL (_IObj getPos [5,_OPD1]);
	private _OPDRP2 =  AGLtoASL (_IObj getPos [5,(_OPD1 - 180)]);
	
	/*
	private _NearbyObjs = nearestObjects [_IObj, [], 10];
	_NearbyObjs deleteat (_NearbyObjs findif {_x isEqualTo _IObj});
	{
		private _Height = _x call BIS_fnc_objectHeight;
		if (_Height < 1) then
		{
			_NearbyObjs = _NearbyObjs - [_x];
		};
	} foreach _NearbyObjs;
	*/
	

	{
		if (_x isKindOf "MAN" || {_x isEqualTo _IObj}) then
		{
			_list = _list - [_x];
		};
	} foreach _list;
	
	{
		if (_x isEqualTo _IObj) then
		{
			_list2 = _list2 - [_x];
		};
	} foreach _list2;					
	
	
	if (VCM_DebugOld) then
	{
		[[_IObj],  [1,0,1,1], true] call BIS_fnc_drawBoundingBox;
	};					

	if (!(_IObj isKindOf "Man") && {!(isNull _IObj)} && {_IsCloser distance2D _FinalPoint < _IPos distance2D _FinalPoint} && {count _list isEqualTo 0} && {count _list2 isEqualTo 0}) then
	{
		private _Height = _IObj call BIS_fnc_objectHeight;
		private _corners = _IObj call BIS_fnc_boundingBoxCorner;
		private _CD = ((_corners#0) distance2D (_corners#3));
		if (_Height < 6 && {_CD > 2}) then
		{
			_IPosOrg = _IPos;
			_IPos = AGLtoASL (_IPos getPos [0.5,(_IPos getDir _Unit)]);
			
			
			if (VCM_DebugOld) then
			{
				_abcd = createVehicle ["Sign_Arrow_F", _IPos, [], 0, "can_collide"];
				_abcd setposasl _IPos;
				_abcd spawn {sleep 15;deleteVehicle _this;};
			};
			_Unit setVariable ["VCM_VAULT",true];
			_Unit setCombatBehaviour "SAFE"; 
			_Unit setUnitCombatMode "BLUE";									
			_Unit domove _IPos;
			_Unit setVariable ["VCM_TO",diag_tickTime];
			
			waitUntil
			{
				_Unit distance2D _IPos < 5 || {!(alive _Unit)} || {(diag_tickTime - (_Unit getVariable "VCM_TO")) > 15}
			};
			
			If ((diag_tickTime - (_Unit getVariable "VCM_TO")) > 15 || !(alive _Unit)) exitwith {};

			waitUntil
			{
				[_Unit,_IObj, 0] call BIS_fnc_isInFrontOf || {!(alive _Unit)} || {(diag_tickTime - (_Unit getVariable "VCM_TO")) > 15}
			};
			
			If ((diag_tickTime - (_Unit getVariable "VCM_TO")) > 15 || !(alive _Unit)) exitwith {};
			_Unit forcespeed 1;
			_Unit disableAI "MOVE";
			_Unit setDir (_Unit getdir _IPos);

			waitUntil
			{
				If !(animationState _Unit isEqualTo "AmovPercMwlkSrasWrflDf") then
				{
					_Unit playMovenow "AmovPercMwlkSrasWrflDf";
				};
				_Unit distance2D _IPosOrg < 0.45 || {!(alive _Unit)} || {(diag_tickTime - (_Unit getVariable "VCM_TO")) > 15}
			};
			_Unit forcespeed 0;
			_Unit switchmove "";

			If ((diag_tickTime - (_Unit getVariable "VCM_TO")) > 15 || !(alive _Unit)) exitwith {_Unit forcespeed -1;_Unit enableAI "MOVE";};
			
			sleep 0.15;
			if !(VCOM_EMR_ENABLED) then {[_Unit,true] spawn VCM_fnc_BabeOver;} else {_Unit execVM "z\emr\addons\main\functions\fnc_action.sqf";};
			
			_Unit spawn
			{
				sleep 3;
				_this enableAI "MOVE";
				_this forcespeed -1;										
				waitUntil
				{
					If !(animationState _this isEqualTo "AmovPercMwlkSrasWrflDf") then
					{
						_this playMoveNow "AmovPercMwlkSrasWrflDf";					
					};
					if !(VCOM_EMR_ENABLED) then {[_this,true] spawn VCM_fnc_BabeOver;} else {_this execVM "z\emr\addons\main\functions\fnc_action.sqf";};						
					((getposATL _this)#2) < 0.1
				};
				_this doFollow leader (group _this);
				sleep 1;
				_this setCombatBehaviour "AWARE"; 
				_this setUnitCombatMode "YELLOW";												
				sleep VCM_AI_EM_CLDWN;
				_This setVariable ["VCM_VAULT",false];
			};
		};
	};
	
};