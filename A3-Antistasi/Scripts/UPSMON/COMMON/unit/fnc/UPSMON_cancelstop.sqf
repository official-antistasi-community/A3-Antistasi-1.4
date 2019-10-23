/****************************************************************
File: UPSMON_cancelstop.sqf
Author: MONSADA

Description:
	Función que detiene al soldado y lo hace esperar x segundos
Parameter(s):

Returns:

****************************************************************/
private["_npc"];

_npc = _this select 0;
_npc stop false;