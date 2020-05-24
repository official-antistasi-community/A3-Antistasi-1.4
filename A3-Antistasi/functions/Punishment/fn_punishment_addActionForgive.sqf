params["_detainee"];

_addAction_parameters = [
	"[ADMIN] Forgive Player",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		if (call BIS_fnc_admin != 0 || isServer) then {
			[_target] call A3A_fnc_punishment_release;
			[_target,_actionId] remoteExec ["removeAction",0,false];
		};
	},
	nil,
	7
];
[_detainee,_addAction_parameters] remoteExec ["addAction",0,false];