
private ["_npc"];

_npc = _this select 0;
_grp = group _npc;

If (!IsNull _npc && alive _npc && _grp in UPSMON_NPCs) then
{
	_grp setvariable ["UPSMON_Removegroup",true];

	waituntil {!alive _npc || !(_grp in UPSMON_NPCs)};

	If (alive _npc) then
	{
		_this execvm "Scripts\UPSMON.sqf";
	};
 };