params["_detainee","_sentenceTime"];
if ([] call BIS_fnc_admin > 0 || isServer && hasInterface) then {
	["FF Notification", format ["%1 has been found guilty of FF.<br/><br/>If you believe this is a mistake, you can forgive him with a scroll-menu action on his body.<br/><br/>He is at the bottom left corner of the map.",name _detainee]] call A3A_fnc_customHint;

	_addAction_parameters = [
		format["[Forgive FF] %1 %2sec",name _detainee, _sentenceTime],
		{
			params ["_target", "_caller", "_actionId", "_arguments"];
			[_arguments,"punishment_warden_manual"] call A3A_fnc_punishment_release;
		},
		_detainee,
		0.1
	];
	player addAction _addAction_parameters;
};