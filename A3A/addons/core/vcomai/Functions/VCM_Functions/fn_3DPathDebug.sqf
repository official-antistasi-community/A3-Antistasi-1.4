params ["_Unit","_Array"];

private _ArrowA = _Unit getVariable ["VCM_DBGA",[]];
private _VisualA = _Unit getVariable ["VCM_DBGVI",[]];

if (count _ArrowA > 0) then
{
	{
		_x call BIS_fnc_drawArrow;
	} foreach _ArrowA;
};
if (count _VisualA > 0) then
{
	{
		removeMissionEventHandler ["Draw3D",_x];
	} foreach _VisualA;
};	
_ArrowA = [];
_VisualA = [];
{
	private _Pos = _x;
	_Pos set [2,1];
	
	private _StartingPoint = _Pos;
	private _NextPoint = (_Array # (_foreachindex + 1));
	
	if !(isNil "_NextPoint") then
	{
		_NextPoint set [2,1];
		private _ID = addMissionEventHandler ["Draw3D", 
		format 
			[
			"
				drawLine3D [%1, %2, [1,0,0,1]];
			",
			_StartingPoint,_NextPoint
			]
		];
		
		private _ID2 = addMissionEventHandler ["Draw3D", 
		format [
		"	
			private _Cam = player;
			if !(isNull curatorCamera) then {_Cam = curatorCamera;};
			private _WH = linearConversion[0, 50, _Cam distance2D %1, 1, 0, true];
			private _TS = linearConversion[0, 50, _Cam distance2D %1, 0.05, 0, true];
			drawIcon3D ['a3\ui_f\data\map\mapcontrol\waypoint_ca.paa', [1,1,1,0.5], %1, _WH, _WH, 0, '', 2, _TS, 'PuristaMedium'];
		",
		_NextPoint
		]];
	
		private _Arrow = [_StartingPoint, _NextPoint, [1,0,0,1], [1,1/5,5]] call BIS_fnc_drawArrow;
		_ArrowA pushback _Arrow;
		_VisualA pushback _ID;
		_VisualA pushback _ID2;
	
	};
} foreach _Array;
_Unit setVariable ["VCM_DBGA",_ArrowA];
_Unit setVariable ["VCM_DBGVI",_VisualA];


if !(_Unit getVariable ["VCM_DBGSET",false]) then
{
	_Unit addEventHandler ["killed",
		{
			params ["_unit", "_killer", "_instigator", "_useEffects"];	

			private _ArrowA = _Unit getVariable ["VCM_DBGA",[]];
			private _VisualA = _Unit getVariable ["VCM_DBGVI",[]];
			
			if (count _ArrowA > 0) then
			{
				{
					_x call BIS_fnc_drawArrow;
				} foreach _ArrowA;
			};
			if (count _VisualA > 0) then
			{
				{
					removeMissionEventHandler ["Draw3D",_x];
				} foreach _VisualA;
			};	
		}];
	_Unit addEventHandler ["Deleted",
		{
			params ["_Unit"];

			private _ArrowA = _Unit getVariable ["VCM_DBGA",[]];
			private _VisualA = _Unit getVariable ["VCM_DBGVI",[]];
			
			if (count _ArrowA > 0) then
			{
				{
					_x call BIS_fnc_drawArrow;
				} foreach _ArrowA;
			};
			if (count _VisualA > 0) then
			{
				{
					removeMissionEventHandler ["Draw3D",_x];
				} foreach _VisualA;
			};	
		}];		
	_Unit setVariable ["VCM_DBGSET",true];
};
