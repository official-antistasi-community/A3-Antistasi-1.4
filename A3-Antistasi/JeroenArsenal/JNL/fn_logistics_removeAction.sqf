//Removes the action from the cargo for all clients

params["_object"];

//remove action for all clients
[_object] remoteExec ["jn_fnc_logistics_removeActionLoad",[0, -2] select isDedicated,_object];