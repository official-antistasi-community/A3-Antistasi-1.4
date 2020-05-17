if (!(serverCommandAvailable "#logout") and (!isServer)) exitWith {["Membership", "Only Server Admins or hosters can add a new member"] call A3A_fnc_customHint;};

if !(membershipEnabled) exitWith {["Membership", "Server Member feature is disabled"] call A3A_fnc_customHint;};

if (isNil "membersX") exitWith {["Membership", "Membership feature not yet initialised. Please try again later"] call A3A_fnc_customHint;};

_target = cursortarget;

if (!isPlayer _target) exitWith {["Membership", "You are not pointing to anyone"] call A3A_fnc_customHint;};
_uid = getPlayerUID _target;
if ((_this select 0 == "add") and ([_target] call A3A_fnc_isMember)) exitWith {["Membership", "The player is already a member of this server"] call A3A_fnc_customHint;};
if ((_this select 0 == "remove") and  !([_target] call A3A_fnc_isMember)) exitWith {["Membership", "The player is not a member of this server"] call A3A_fnc_customHint;};

if (_this select 0 == "add") then
	{
	membersX pushBackUnique _uid;
	["Membership", format ["%1 has been added to the Server Members List",name _target]] call A3A_fnc_customHint;
	["Membership", "You have been added to the Server Members list"] remoteExec ["A3A_fnc_customHint", _target];
	}
else
	{
	membersX = membersX - [_uid];
	["Membership", format ["%1 has been removed from the Server Members List",name _target]] call A3A_fnc_customHint;
	["Membership", "You have been removed from the Server Members list"] remoteExec ["A3A_fnc_customHint", _target];
	};
publicVariable "membersX";