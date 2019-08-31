private ["_typeX","_costs","_groupX","_unit","_radiusX","_roads","_road","_pos","_truckX","_textX","_mrk","_hrCost","_exists","_positionTel","_isRoad","_typeGroup","_rebelMoney","_rebelHR"];

if (["rebelWatchpostsAndRoadblocks"] call BIS_fnc_taskExists) exitWith {hint "We can only deploy / delete one Observation Post or Roadblock at a time."};
if (!([player] call A3A_fnc_hasRadio)) exitWith {if !(hasIFA) then {hint "You need a radio in your inventory to be able to give orders to other squads"} else {hint "You need a Radio Man in your group to be able to give orders to other squads"}};

_typeX = _this select 0;

if (!visibleMap) then {openMap true};
positionTel = [];
if (_typeX != "delete") then {hint "Click on the position you wish to build the Observation Post or Roadblock. \n Remember: to build Roadblocks you must click exactly on a road map section"} else {hint "Click on the Observation Post or Roadblock to delete."};

onMapSingleClick "positionTel = _pos;";

waitUntil {sleep 1; (count positionTel > 0) or (not visiblemap)};
onMapSingleClick "";

if (!visibleMap) exitWith {};

_positionTel = positionTel;
_pos = [];

if ((_typeX == "delete") and (count rebelWatchpostsAndRoadblocks < 1)) exitWith {hint "No Posts or Roadblocks deployed to delete"};
if ((_typeX == "delete") and ({(alive _x) and (!captive _x) and ((side _x == Occupants) or (side _x == Invaders)) and (_x distance _positionTel < 500)} count allUnits > 0)) exitWith {hint "You cannot delete a Post while enemies are near it"};

_costs = 0;
_hrCost = 0;

if (_typeX != "delete") then
	{
	_isRoad = isOnRoad _positionTel;

	_typeGroup = rebelGroupSniperTeam;

	if (_isRoad) then
		{
		_typeGroup = rebelGroupAT;
		_costs = _costs + ([rebelVehLiteArmed] call A3A_fnc_vehiclePrice) + (server getVariable rebelStaticCrew);
		_hrCost = _hrCost + 1;
		};

	//_formatX = (configfile >> "CfgGroups" >> "rebelSide" >> "Guerilla" >> "Infantry" >> _typeGroup);
	//_unitsX = [_formatX] call groupComposition;
	{_costs = _costs + (server getVariable (_x select 0)); _hrCost = _hrCost +1} forEach _typeGroup;
	}
else
	{
	_mrk = [rebelWatchpostsAndRoadblocks,_positionTel] call BIS_fnc_nearestPosition;
	_pos = getMarkerPos _mrk;
	if (_positionTel distance _pos >10) exitWith {hint "No post nearby"};
	};
//if ((_typeX == "delete") and (_positionTel distance _pos >10)) exitWith {hint "No post nearby"};

_rebelMoney = server getVariable "rebelMoney";
_rebelHR = server getVariable "hr";

if (((_rebelMoney < _costs) or (_rebelHR < _hrCost)) and (_typeX!= "delete")) exitWith {hint format ["You lack of resources to build this Outpost or Roadblock \n %1 HR and %2 € needed",_hrCost,_costs]};

if (_typeX != "delete") then
	{
	[-_hrCost,-_costs] remoteExec ["A3A_fnc_rebelResources",2];
	};

 [[_typeX,_positionTel],"A3A_fnc_rebelCreateRoadblock"] call BIS_fnc_MP
