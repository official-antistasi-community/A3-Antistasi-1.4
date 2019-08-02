params ["_date"];

format ["%1:%2",
	(if (_date select 3 < 10) then { "0" } else { "" }) + str (_date select 3),
	(if (_date select 4 < 10) then { "0" } else { "" }) + str (_date select 4)];
