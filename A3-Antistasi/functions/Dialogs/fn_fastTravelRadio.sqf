private ["_roads","_pos","_positionX","_groupX"];

_markersX = markersX + [respawnTeamPlayer];

_esHC = false;
if !((vehicle player getVariable "SA_Tow_Ropes") isEqualTo objNull) exitWith {hint "You cannot Fast Travel with your Tow Rope out or a Vehicle attached"};
if (count hcSelected player > 1) exitWith {hint "You can select one group only to Fast Travel"};
if (count hcSelected player == 1) then {_groupX = hcSelected player select 0; _esHC = true} else {_groupX = group player};
_checkForPlayer = false;
if ((!_esHC) and limitedFT) then {_checkForPlayer = true};
_boss = leader _groupX;

if ((_boss != player) and (!_esHC)) then {_groupX = player};

if (({isPlayer _x} count units _groupX > 1) and (_esHC)) exitWith {hint "You cannot Fast Travel groups commanded by players"};

if (player != player getVariable ["owner",player]) exitWith {hint "You cannot Fast Travel while you are controlling AI"};

_checkX = false;
//_distanceX = 500 - (([_boss,false] call A3A_fnc_fogCheck) * 450);
_distanceX = 500;

{if ([_x,_distanceX] call A3A_fnc_enemyNearCheck) exitWith {_checkX = true}} forEach units _groupX;

if (_checkX) exitWith {Hint "You cannot Fast Travel with enemies near the group"};

{if ((vehicle _x!= _x) and ((isNull (driver vehicle _x)) or (!canMove vehicle _x) or (vehicle _x isKindOf "Boat"))) then
	{
	if (not(vehicle _x isKindOf "StaticWeapon")) then {_checkX = true};
	}
} forEach units _groupX;

if (_checkX) exitWith {Hint "You cannot Fast Travel if you don't have a driver in all your vehicles or your vehicles are damaged and cannot move or your group is in a boat"};

positionTel = [];

if (_esHC) then {hcShowBar false};
hint "Click on the zone you want to travel";
if (!visibleMap) then {openMap true};
onMapSingleClick "positionTel = _pos;";

waitUntil {sleep 1; (count positionTel > 0) or (not visiblemap)};
onMapSingleClick "";

_positionTel = positionTel;

if (count _positionTel > 0) then
	{
	_base = [_markersX, _positionTel] call BIS_Fnc_nearestPosition;
	if (_checkForPlayer and ((_base != "SYND_HQ") and !(_base in airportsX))) exitWith {hint "Player groups are only allowed to Fast Travel to HQ or Airbases"};
	if ((sidesX getVariable [_base,sideUnknown] == Occupants) or (sidesX getVariable [_base,sideUnknown] == Invaders)) exitWith {hint "You cannot Fast Travel to an enemy controlled zone"; openMap [false,false]};

	//if (_base in outpostsFIA) exitWith {hint "You cannot Fast Travel to roadblocks and watchposts"; openMap [false,false]};

	if ([getMarkerPos _base,500] call A3A_fnc_enemyNearCheck) exitWith {Hint "You cannot Fast Travel to an area under attack or with enemies in the surrounding"; openMap [false,false]};

	if (_positionTel distance getMarkerPos _base < 50) then
		{
		_positionX = [getMarkerPos _base, 10, random 360] call BIS_Fnc_relPos;
		_distanceX = round (((position _boss) distance _positionX)/200);
		//if (!_esHC) then {disableUserInput true; cutText ["Fast traveling, please wait","BLACK",2]; sleep 2;} else {hcShowBar false;hcShowBar true;hint format ["Moving group %1 to destination",groupID _groupX]; sleep _distanceX;};
		_forcedX = false;
		if (!isMultiplayer) then {if (not(_base in forcedSpawn)) then {_forcedX = true; forcedSpawn = forcedSpawn + [_base]}};
		if (!_esHC) then {disableUserInput true; cutText [format ["Fast traveling, travel time: %1s , please wait", _distanceX],"BLACK",1]; sleep 1;} else {hcShowBar false;hcShowBar true;hint format ["Moving group %1 to destination",groupID _groupX]; sleep _distanceX;};
 		if (!_esHC) then
 			{
 			_timePassed = 0;
 			while {_timePassed < _distanceX} do
 				{
 				cutText [format ["Fast traveling, travel time: %1s , please wait", (_distanceX - _timePassed)],"BLACK",0.0001];
 				sleep 1;
 				_timePassed = _timePassed + 1;
 				}
 			};
		_exit = false;
		if (limitedFT) then
			{
			_vehicles = [];
			{if (vehicle _x != _x) then {_vehicles pushBackUnique (vehicle _x)}} forEach units _groupX;
			{if ((vehicle _x) in _vehicles) exitWith {_checkForPlayer = true}} forEach playableUnits;
			};
		if (_checkForPlayer and ((_base != "SYND_HQ") and !(_base in airportsX))) exitWith {hint format ["%1 Fast Travel has been cancelled because some player has boarded their vehicle and the destination is not HQ or an Airbase",groupID _groupX]};
		{
		_unit = _x;
		if ((!isPlayer _unit) or (_unit == player)) then
			{
			//_unit hideObject true;
			_unit allowDamage false;
			if (_unit != vehicle _unit) then
				{
				if (driver vehicle _unit == _unit) then
					{
					sleep 3;
					_radiusX = 10;
					while {true} do
						{
						_roads = _positionX nearRoads _radiusX;
						if (count _roads > 0) exitWith {};
						_radiusX = _radiusX + 10;
						};
					_road = _roads select 0;
					_pos = position _road findEmptyPosition [10,100,typeOf (vehicle _unit)];
					vehicle _unit setPos _pos;
					};
				if ((vehicle _unit isKindOf "StaticWeapon") and (!isPlayer (leader _unit))) then
					{
					_pos = _positionX findEmptyPosition [10,100,typeOf (vehicle _unit)];
					vehicle _unit setPosATL _pos;
					};
				}
			else
				{
				if (!(_unit getVariable ["INCAPACITATED",false])) then
					{
					_positionX = _positionX findEmptyPosition [1,50,typeOf _unit];
					_unit setPosATL _positionX;
					if (isPlayer leader _unit) then {_unit setVariable ["rearming",false]};
					_unit doWatch objNull;
					_unit doFollow leader _unit;
					}
				else
					{
					_positionX = _positionX findEmptyPosition [1,50,typeOf _unit];
					_unit setPosATL _positionX;
					};
				};
			};
			//_unit hideObject false;
		} forEach units _groupX;
		//if (!_esHC) then {sleep _distanceX};
		if (!_esHC) then {disableUserInput false;cutText ["You arrived to destination","BLACK IN",1]} else {hint format ["Group %1 arrived to destination",groupID _groupX]};
		if (_forcedX) then {forcedSpawn = forcedSpawn - [_base]};
		sleep 5;
		{_x allowDamage true} forEach units _groupX;
		}
	else
		{
		Hint "You must click near marker under your control";
		};
	};
openMap false;