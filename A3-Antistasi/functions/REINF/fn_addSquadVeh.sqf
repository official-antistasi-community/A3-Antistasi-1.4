private ["_veh","_esStatic","_groupX","_maxCargo"];

if (count hcSelected player != 1) exitWith {hint "You must select one group on the HC bar"};

_groupX = (hcSelected player select 0);

if ((groupID _groupX == "Watch") or (groupID _groupX == "MineF")) exitwith {hint "This group has a vehicle already and their mission depends on it"};

_veh = cursortarget;

_typeX = typeOf _veh;

//if (cursortarget == "") exitWith {hint "You are not looking at anything"};
//if ((not(_typeX in vehFIA)) and (not(_typeX in vehAAFland)) and (not(_typeX in arrayCivVeh))) exitWith {hint "You are not looking to a valid vehicle"};

if ((!alive _veh) or (!canMove _veh)) exitWith {hint "The selected vehicle is destroyed or cannot move"};
if ({(alive _x) and (_x in _veh)} count allUnits > 0) exitWith {hint "Selected vehicle is not empty"};
if (_veh isKindOf "StaticWeapon") exitWith {hint "You cannot assign a Static Weapon to a Squad"};

_esStatic = false;
{if (vehicle _x isKindOf "StaticWeapon") then {_esStatic = true}} forEach units _groupX;
if (_esStatic) exitWith {hint "Static Weapon Squads cannot change of vehicle"};

//_maxCargo = (_veh emptyPositions "Cargo") + (_veh emptyPositions "Commander") + (_veh emptyPositions "Gunner") + (_veh emptyPositions "Driver");
_maxCargo = (getNumber (configFile >> "CfgVehicles" >> (_typeX) >> "transportSoldier")) + (count allTurrets [_veh, true]) + 1;
if ({alive _x} count units _groupX > _maxCargo) exitWith {hint "The vehicle selected has no room for this squad"};

hint format ["Vehicle Assigned to %1 Squad", groupID _groupX];

_owner = _veh getVariable "owner";
if (!isNil "_owner") then
	{
	{unassignVehicle _x; _x leaveVehicle _veh} forEach units _owner;
	};

if (count allTurrets [_veh, false] > 0) then
			{
			_veh allowCrewInImmobile true;
			};

_groupX addVehicle _veh;
_veh setVariable ["owner",_groupX,true];

leader _groupX assignAsDriver _veh;
{[_x] orderGetIn true; [_x] allowGetIn true} forEach units _groupX;





