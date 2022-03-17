params ["_Unit","_Text"];

if !(alive _Unit) exitWith {};
if (isNil "_Unit") exitWith {};
if (VCM_Debug) then
{
	[(str _Unit), "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
	[(str _Unit), "onEachFrame", 
	{
		params ["_Unit","_text"];
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
		if !(alive _Unit) then {[(str _Unit), "onEachFrame"] call BIS_fnc_removeStackedEventHandler;};
		if (isNull _Unit) then {[(str _Unit), "onEachFrame"] call BIS_fnc_removeStackedEventHandler;};
	},
	[_Unit,_text]
	] call BIS_fnc_addStackedEventHandler;
};