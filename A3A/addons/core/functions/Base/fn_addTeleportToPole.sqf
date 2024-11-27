//AGN change
/*
 *	Attaches teleport system to existing mast (flag). Teleport can also teleport player's group.
 *	
 *	@author 
 *		Czarny
 *	@call
 *		[teleport, teleportAdmin, teleportFormerAdmin] execVM "addTeleportToPole.sqf"
  *	@args
 *		[Object] teleport  			- existing flag which is teleport start
 *		[Object] teleportAdmin				- player who can manipulate the system
 *		[Object] teleportFormerAdmin		- dead body of current player
 *	@return
 *		none
 *	@dependencies
 *		none
**/

//diag_log format ["%1: rom | %2| %3", servertime, name player, "addTeleportToPole ENTER"];

// SCRIPT DEFINITIONS

teleportPole = _this select 0;
teleportAdmin = _this select 1;
teleportFormerAdmin = _this select 2;

//check if destination is already define (for JIP or respawn)
destinationPole = missionNamespace getVariable "destinationPole";
if(isNil "destinationPole") then 
{
	destinationPole = objNull; 
};

interactionDistance = 5; //meters
target = 0; //where to run command
vicinityToLeader = 30; //how far team member should be from leader to be teleported

idActionTeleport = "idActionTeleport";
idActionAddTeleport = "idActionAddTeleport";
idActionRemoveTeleport = "idActionRemoveTeleport";


fnc_publish_vars=
{
	publicVariable "idActionTeleport";
	publicVariable "idActionAddTeleport";
	publicVariable "idActionRemoveTeleport";
	publicVariable "destinationPole";
};

fnc_clear_actions=
{
	teleportFormerAdmin removeAction (teleportFormerAdmin getVariable idActionTeleport);
	teleportFormerAdmin removeAction (teleportFormerAdmin getVariable idActionAddTeleport);
	teleportFormerAdmin removeAction (teleportFormerAdmin getVariable idActionRemoveTeleport);
	player removeAction (player getVariable idActionTeleport);
	player removeAction (player getVariable idActionAddTeleport);
	player removeAction (player getVariable idActionRemoveTeleport);
	player setVariable [idActionTeleport, nil];
	player setVariable [idActionAddTeleport, nil];
	player setVariable [idActionRemoveTeleport, nil];
};

//teleport this player and his squad except other players in his squad																  
fnc_teleport= 
{
	private _destinPos = getPosATL destinationPole;
	private _grp = group player;
	private _candidates = [];

	if (player == leader _grp) then {
		{
			if ( (!(isPlayer _x) && (_x distance player) < vicinityToLeader) || _x == player) then { // is AI or calling player
				_candidates = _candidates + [_x];
			}
		} forEach units _grp;
				
		{
			_x setpos [(_destinPos select 0) + random [-10, 0, 10], (_destinPos select 1) + random [-10, 0, 10], 0.2]; 
		} forEach _candidates;
	}
	else {
		player setpos [(_destinPos select 0) + random [-10, 0, 10], (_destinPos select 1) + random [-10, 0, 10], 0.2]; 
	}
};

fnc_addTeleport= 
{	
	private _placeDistance = 4;
	private _playerDir = round (getDir player);
	private _playerPos = getPosATL player;
	
	destinationPole = "Flag_Green_F" createVehicle [(_playerPos select 0) + _placeDistance * (sin _playerDir), (_playerPos select 1) + _placeDistance * (cos _playerDir), 0];
	
	{if((side player) == (side teleportAdmin)) then {player setVariable [idActionTeleport, player addAction actionTeleport];};} remoteExec ["bis_fnc_call", target];
	{if(player == teleportAdmin) then {player setVariable [idActionRemoveTeleport, player addAction actionRemoveTeleport];};} remoteExec ["bis_fnc_call", target];
	{if(player == teleportAdmin) then {player removeAction (player getVariable idActionAddTeleport);player setVariable [idActionAddTeleport, nil];};} remoteExec ["bis_fnc_call", target];
	call fnc_publish_vars;
};

fnc_removeTeleport= 
{
	deleteVehicle destinationPole;
	
	{if((side player) == (side teleportAdmin)) then {player removeAction (player getVariable idActionTeleport);player setVariable [idActionTeleport, nil];};} remoteExec ["bis_fnc_call", target];
	{if(player == teleportAdmin) then {player removeAction (player getVariable idActionRemoveTeleport);player setVariable [idActionRemoveTeleport, nil];};} remoteExec ["bis_fnc_call", target];
	{if(player == teleportAdmin) then {player setVariable [idActionAddTeleport, player addAction actionAddTeleport];};} remoteExec ["bis_fnc_call", target];
	call fnc_publish_vars;
};

actionAddTeleport = ["add teleport", fnc_addTeleport, [], 0, false, true];
actionRemoveTeleport = ["remove teleport", fnc_removeTeleport, [], 0, false, true, "", "(player distance teleportPole < interactionDistance) || (player distance destinationPole < interactionDistance)"];
actionTeleport = ["teleport", fnc_teleport, [], 0, false, true, "", "player distance teleportPole < interactionDistance"];

// SCRIPT EXECUTION

//removal of teleport actions from corpse of player and zeroing them in public
if (!(isNull teleportFormerAdmin)) then {
	call fnc_clear_actions;
	call fnc_publish_vars;
};

if(isNull destinationPole) then 
{	
	if((player == teleportAdmin) && isNil{player getVariable idActionAddTeleport}) then 
	{	
		player setVariable [idActionAddTeleport, player addAction actionAddTeleport];
		call fnc_publish_vars;
	};
}
else
{	
	if(player == teleportAdmin && isNil{player getVariable idActionRemoveTeleport}) then 
	{
		player setVariable [idActionRemoveTeleport, player addAction actionRemoveTeleport];
		call fnc_publish_vars;
	};
	if((side player) == (side teleportAdmin) && isNil{player getVariable idActionTeleport}) then
	{
		player setVariable [idActionTeleport, player addAction actionTeleport];
		call fnc_publish_vars;
	};
};