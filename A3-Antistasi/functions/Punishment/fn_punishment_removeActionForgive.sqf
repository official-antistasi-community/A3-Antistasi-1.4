params["_detainee","_sentenceTime"];
_actionsDetainee = actionIDs _detainee;
{
	if (((_detainee actionParams _x) select 0) isEqualTo "[ADMIN] Forgive Player") then {
		_detainee removeAction _x;
	};
} forEach _actionsDetainee;

_actionsSelf = actionIDs player;
{
	if (((player actionParams _x) select 0) isEqualTo format["[Forgive FF] %1 %2sec",name _detainee, _sentenceTime]) then {
		player removeAction _x;
	};
} forEach _actionsSelf;