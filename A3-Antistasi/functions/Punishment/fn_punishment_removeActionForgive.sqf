params["_detainee"];
_actionsDetainee = actionIDs _detainee;
{
	if (((_detainee actionParams _x) select 0) isEqualTo "Refresh Action for Admin") then {
		_detainee removeAction _x;
	};
} forEach _actionsDetainee;

_actionsSelf = actionIDs player;
{
	if (((player actionParams _x) select 0) isEqualTo format["[Forgive FF] ""%1""",name _detainee]) then {
		player removeAction _x;
	};
} forEach _actionsSelf;