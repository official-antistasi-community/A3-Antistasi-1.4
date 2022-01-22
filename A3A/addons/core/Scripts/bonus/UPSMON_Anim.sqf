/*
Stances
[
	"STAND",
	"STAND_IA",
	"GUARD",
	"SIT_LOW",
	"KNEEL",
	"LEAN",
	"WATCH",
	"WATCH1",
	"WATCH2"
];
gear
[
	"NONE",
	"LIGHT",
	"MEDIUM",
	"FULL",
	"ASIS",
	"RANDOM"
];
*/


_unit = _this select 0;
_anim = _this select 1;
_clothes = _this select 2;


if (isNil("UPSMON_INIT")) then {
	UPSMON_INIT=0;
};

waitUntil {UPSMON_INIT==1};

If (Alive _unit && canmove _unit) then
{
	[_unit,_anim,_clothes,{lifestate _unit == "INJURED" || !alive _unit ||_unit getvariable ["UPSMON_SUPSTATUS",""] != "" || !IsNull ((group _unit) getvariable ["UPSMON_GrpTarget",ObjNull])}] call BIS_fnc_ambientAnimCombat;
};