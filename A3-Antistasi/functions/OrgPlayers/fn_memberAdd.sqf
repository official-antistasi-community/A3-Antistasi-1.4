if (!(serverCommandAvailable "#logout") and (!isServer)) exitWith {hint "Only Server Admins or hosters can add a new member"};

if !(membershipEnabled) exitWith {hint "Server Member feature is disabled"};

if (isNil "membersX") exitWith {hint "Membership feature not yet initialised. Please try again later"};

_target = cursortarget;

if (!isPlayer _target) exitWith {hint "You are not pointing to anyone"};
_uid = getPlayerUID _target;
if ((_this select 0 == "add") and ([_target] call A3A_fnc_isMember)) exitWith {hint "The player is already a member of this server"};
if ((_this select 0 == "remove") and  !([_target] call A3A_fnc_isMember)) exitWith {hint "The player is not a member of this server"};

if (_this select 0 == "add") then
	{
	membersX pushBackUnique _uid;
	hint format ["%1 has been added to the Server Members List",name _target];
	["You have been added to the Server Members list"] remoteExec ["hint", _target];
	}
else
	{
	membersX = membersX - [_uid];
	hint format ["%1 has been removed from the Server Members List",name _target];
	["You have been removed from the Server Members list"] remoteExec ["hint", _target];
	};
publicVariable "membersX";