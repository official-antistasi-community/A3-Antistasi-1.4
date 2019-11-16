/****************************************************************
File: UPSMON_cancelstop.sqf
Author: MONSADA

Description:
	Funci�n que detiene al soldierX y lo hace esperar x segundos
Parameter(s):

Returns:

****************************************************************/
private["_npc"];

_npc = _this select 0;
_npc stop false;