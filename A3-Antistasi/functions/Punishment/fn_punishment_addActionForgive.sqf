params["_detainee"];

_addAction_parameters =
[
	"[ADMIN] Forgive Player", 
	{
		params ["_detainee", "_caller", "_actionId", "_arguments"];
		if ([] call BIS_fnc_admin > 0 || isServer) then 
		{
			[_detainee,_actionId] remoteExec ["removeAction",0,false];
			[_detainee,-99999, -1] call A3A_fnc_punishment;
		};
	}
];
[_detainee,_addAction_parameters] remoteExec ["addAction",0,false];