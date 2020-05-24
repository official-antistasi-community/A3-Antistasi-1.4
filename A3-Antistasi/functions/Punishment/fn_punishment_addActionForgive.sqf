params["_detainee"];

_addAction_parameters = [
	"[ADMIN] Forgive Player",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		if (((_target getVariable ["punishment_vars", [0,0,[0,0],[scriptNull,scriptNull]]]) select 1 ) < 1) exitWith {
			[_target,_actionId] remoteExec ["removeAction",0,false];
		};
		if (call BIS_fnc_admin != 0 || isServer) then {
			[_target,"punishment_warden_manual"] call A3A_fnc_punishment_release;
			[_target,_actionId] remoteExec ["removeAction",0,false];
		};
	},
	nil,
	7
];
[_detainee,_addAction_parameters] remoteExec ["addAction",0,false];