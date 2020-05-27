params["_detainee"];
private _actionsDetainee = actionIDs _detainee;
if !(isNil "_actionsDetainee" || {count _actionsDetainee == 0}) then {
	{
		if (((_detainee actionParams _x) select 0) isEqualTo "Refresh Admin Action") then {
			_detainee removeAction _x;
		};
	} forEach _actionsDetainee;
};

private _actionsSelf = actionIDs player;
if !(isNil "_actionsSelf" || {count _actionsSelf == 0}) then {
	{
		if (((player actionParams _x) select 0) isEqualTo format["[Forgive FF] ""%1""",name _detainee]) then {
			player removeAction _x;
		};
	} forEach _actionsSelf;
};