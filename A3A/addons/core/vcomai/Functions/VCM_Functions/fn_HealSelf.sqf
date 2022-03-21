
/*
	Author: Genesis

	Description:
		Makes a unit heal itself.

	Parameter(s):
		0: OBJECT - Unit

	Returns:
		BOOLEAN - If unit able to treat self: TRUE, else FALSE
*/

private _CanHeal = false;

if (alive _this && {"FirstAidKit" in (items _this)}) then 
{
	_this setdamage 0;
	_this action ["HealSoldierSelf", _this];	
	_CanHeal = true;
	if VCM_DebugOld then {systemChat format ["%1 healing self", _this]};
};

_CanHeal