params ["_Unit","_Text",["_Timer",10]];

if (VCM_DebugOld) then
{
	if !(alive _Unit) exitWith {};
	if (isNil "_Unit") exitWith {};
	
		private _TimerEXP = time + _Timer;
		[(str _Unit), "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
		[(str _Unit), "onEachFrame", 
		{
			params ["_Unit","_text","_TimerEXP"];
			private _pos = getposATL _Unit;
			_pos set [2,3];
			call compile format 
			[
				'
				drawIcon3D
				[
					"",
					[0.14,0.86,0,1],
					%1,
					0,
					0,
					0,
					%2,
					2,
					0.04,
					"PuristaMedium",
					"center",
					false
				];
				'
				,_pos,(str _text)
			];
			if (!(alive _Unit) || time > _TimerEXP) then {[(str _Unit), "onEachFrame"] call BIS_fnc_removeStackedEventHandler;};
		},
		[_Unit,_text,_TimerEXP]
		] call BIS_fnc_addStackedEventHandler;	
	};