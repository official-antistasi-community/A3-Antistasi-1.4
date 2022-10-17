#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
//if (!isServer) exitWith{};
private ["_groups","_hr","_resourcesFIA","_wp","_groupX","_veh","_leave"];

_groups = _this select 0;
_hr = 0;
_resourcesFIA = 0;
_leave = false;

{
	if ((groupID _x) in ["MineF", "Watch"]
		|| { isPlayer (leader _x)
		|| { (units _x) findIf { _x == petros } != -1 }})
	exitWith { _leave = true; };
} forEach _groups;

if (_leave) exitWith {["Dismiss Squad", "You cannot dismiss player led, Watchpost, Roadblocks or Minefield building squads."] call A3A_fnc_customHint;};

{
if (_x getVariable ["esNATO",false]) then {_leave = true};
} forEach _groups;

if (_leave) exitWith {["Dismiss Squad", "You cannot dismiss NATO groups."] call A3A_fnc_customHint;};

_pos = getMarkerPos respawnTeamPlayer;

{
	theBoss sideChat format ["%2, I'm sending %1 back to base", _x,name petros];
	theBoss hcRemoveGroup _x;
	_wp = _x addWaypoint [_pos, 0];
	_wp setWaypointType "MOVE";
	sleep 3
} forEach _groups;

sleep 100;

private _assignedVehicles =	[];

{
	_groupX = _x;
	{
		if (alive _x) then
		{
			_hr = _hr + 1;
			_resourcesFIA = _resourcesFIA + (server getVariable [_x getVariable "unitType",0]) / 2;
			if (!isNull (assignedVehicle _x) and {isNull attachedTo (assignedVehicle _x)}) then
			{
				_assignedVehicles pushBackUnique (assignedVehicle _x);
			};
			_backpck = backpack _x;
			if (_backpck != "") then
			{
                private _assemblesTo = getText (configFile/"CfgVehicles"/_backpck/"assembleInfo"/"assembleTo");
				switch (_assemblesTo) do
				{
					case FactionGet(reb,"staticMortar"): {_resourcesFIA = _resourcesFIA + ([FactionGet(reb,"staticMortar")] call A3A_fnc_vehiclePrice)/2};
					case FactionGet(reb,"staticAA"): {_resourcesFIA = _resourcesFIA + ([FactionGet(reb,"staticAA")] call A3A_fnc_vehiclePrice)/2};
					case FactionGet(reb,"staticMG"): {_resourcesFIA = _resourcesFIA + ([FactionGet(reb,"staticMG")] call A3A_fnc_vehiclePrice)/2};
					case FactionGet(reb,"staticAT"): {_resourcesFIA = _resourcesFIA + ([FactionGet(reb,"staticAT")] call A3A_fnc_vehiclePrice)/2};
				};
			};
		};
		deleteVehicle _x;
	} forEach units _groupX;
	deleteGroup _groupX;
} forEach _groups;

{
	private _veh = _x;
	if !(typeOf _veh in FactionGet(all,"vehiclesReb")) then { continue };
	_resourcesFIA = _resourcesFIA + ([typeOf _veh] call A3A_fnc_vehiclePrice);
	{
		if !(typeOf _x in FactionGet(all,"vehiclesReb")) then { continue };
		_resourcesFIA = _resourcesFIA + ([typeOf _x] call A3A_fnc_vehiclePrice);
		deleteVehicle _x;
	} forEach attachedObjects _veh;
	deleteVehicle _veh;
} forEach _assignedVehicles;

_nul = [_hr,_resourcesFIA] remoteExec ["A3A_fnc_resourcesFIA",2];
