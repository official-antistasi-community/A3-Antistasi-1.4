params ["_Unit","_EPos","_Color","_Blink"];

if (VCM_Debug) then
{
	if (isNil "_Blink") then {_Blink = false;};
	if (_Blink) then {sleep 0.05;};
	if !(alive _Unit) exitWith {};
	if (isNil "_Unit") exitWith {};
	
	[((str _Unit)+"D"), "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
	[((str _Unit)+"D"), "onEachFrame", 
	{
		params ["_Unit","_EPos","_Color","_Blink"];
		private _Spos = (ASLToAGL eyePos _Unit);
		_EPos set [2,3];
		call compile format 
		[
			'
			drawLine3D 
			[
				%1, 
				%2, 
				%3
			];
			'
			,_Spos,_EPos,_Color
		];
		if !(alive _Unit) then {[((str _Unit)+"D"), "onEachFrame"] call BIS_fnc_removeStackedEventHandler;};
		if (isNull _Unit) then {[((str _Unit)+"D"), "onEachFrame"] call BIS_fnc_removeStackedEventHandler;};
		if (_Blink && {diag_tickTime % 0.8 < 0.01}) then
		{
			[((str _Unit)+"D"), "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
			[_Unit,_EPos,_Color,true] spawn VCM_fnc_DebugLine;
		};
	},
	[_Unit,_EPos,_Color,_Blink]
	] call BIS_fnc_addStackedEventHandler;
};