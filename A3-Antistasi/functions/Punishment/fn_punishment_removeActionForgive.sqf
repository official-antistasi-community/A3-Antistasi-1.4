params["_detainee"];
	_actions = actionIDs _detainee;
	{
		if (((_detainee actionParams _x) select 0) isEqualTo "[ADMIN] Forgive Player") then {
			_detainee removeAction _x;
		};
	} forEach _actions;