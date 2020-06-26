params["_object"];

//add action to all clients
[_object] remoteExec ["jn_fnc_logistics_addActionLoad",[0, -2] select isDedicated,_object];