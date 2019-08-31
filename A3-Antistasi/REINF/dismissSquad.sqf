//if (!isServer) exitWith{};
private ["_groups","_hr","_rebelMoney","_wp","_groupX","_veh","_leave"];

_groups = _this select 0;
_hr = 0;
_rebelMoney = 0;
_leave = false;
{
if ((groupID _x == "MineF") or (groupID _x == "Watch") or (isPlayer(leader _x))) then {_leave = true};
} forEach _groups;

if (_leave) exitWith {hint "You cannot dismiss player led, Watchpost, Roadblocks or Minefield building squads"};

{
if (_x getVariable ["esNATO",false]) then {_leave = true};
} forEach _groups;

if (_leave) exitWith {hint "You cannot dismiss NATO groups"};

_pos = getMarkerPos rebelRespawn;

{
theBoss sideChat format ["%2, I'm sending %1 back to base", _x,name petros];
theBoss hcRemoveGroup _x;
_wp = _x addWaypoint [_pos, 0];
_wp setWaypointType "MOVE";
sleep 3} forEach _groups;

sleep 100;

{_groupX = _x;
{

if (alive _x) then
	{
	_hr = _hr + 1;
	_rebelMoney = _rebelMoney + (server getVariable [typeOf _x,0]);
	if (!isNull (assignedVehicle _x)) then
		{
		_veh = assignedVehicle _x;
		if ((typeOf _veh) in rebelVehicles) then
			{
			_rebelMoney = _rebelMoney + ([(typeOf _veh)] call A3A_fnc_vehiclePrice);
			if (count attachedObjects _veh > 0) then
				{
				_subVeh = (attachedObjects _veh) select 0;
				_rebelMoney = _rebelMoney + ([(typeOf _subVeh)] call A3A_fnc_vehiclePrice);
				deleteVehicle _subVeh;
				};
			deleteVehicle _veh;
			};
		};
	_backpck = backpack _x;
	if (_backpck != "") then
		{
		switch (_backpck) do
			{
			case rebelStaticMortarBag: {_rebelMoney = _rebelMoney + ([rebelMortar] call A3A_fnc_vehiclePrice)};
			case rebelStaticSupportAA: {_rebelMoney = _rebelMoney + ([rebelStaticAA] call A3A_fnc_vehiclePrice)};
			case rebelStaticTallMG: {_rebelMoney = _rebelMoney + ([rebelStaticMG] call A3A_fnc_vehiclePrice)};
			case rebelStaticSupportAT: {_rebelMoney = _rebelMoney + ([rebelStaticAT] call A3A_fnc_vehiclePrice)};
			};
		};
	};
deleteVehicle _x;
} forEach units _groupX;
deleteGroup _groupX;} forEach _groups;
_nul = [_hr,_rebelMoney] remoteExec ["A3A_fnc_rebelResources",2];


