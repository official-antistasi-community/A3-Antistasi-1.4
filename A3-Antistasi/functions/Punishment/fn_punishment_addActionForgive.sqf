params["_detainee"];

_addAction_parameters = [
	"Refresh Action for Admin",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		[_arguments] remoteExec ["A3A_fnc_punishment_removeActionForgive",0,false];
		sleep 1;
		[_arguments] call A3A_fnc_punishment_addActionForgive;
	},
	_detainee,
	7
];
[_detainee,_addAction_parameters] remoteExec ["addAction",_detainee,false];

if ([] call BIS_fnc_admin > 0 || isServer && hasInterface) then {
	_addAction_parameters = [
		format["[Forgive FF] ""%1""",name _detainee],
		{
			params ["_target", "_caller", "_actionId", "_arguments"];
			[_arguments,"punishment_warden_manual"] call A3A_fnc_punishment_release;
		},
		_detainee,
		0.1
	];
	player addAction _addAction_parameters;
};