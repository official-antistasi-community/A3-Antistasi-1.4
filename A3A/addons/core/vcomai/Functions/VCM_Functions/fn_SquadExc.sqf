
/*
	Author: Genesis

	Description:
		This function will execute the appropriate code and FSM's onto a group.
		These FSM's will run until the group is cleaned. They will be designed to halt when the group is empty or all units are dead.

	Parameter(s):
		0: GROUP

	Returns:
		NOTHING
*/

_this spawn VCM_fnc_SQUADBEH;
VcmAI_ActiveList pushback _this;