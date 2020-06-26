private ["_unit","_distanceX","_hasMedic","_medicX","_units","_helping","_askingForHelp"];
_unit = _this select 0;
_helped = _unit getVariable ["helped",objNull];
if (!isNull _helped) exitWith {};
//if (!(isMultiplayer) and (isPlayer _unit) and (_unit getVariable ["incapacitated",false])) then {_unit setVariable ["incapacitated",false]};
_enemy = _unit findNearestEnemy _unit;
_distanceX = 81;
_medicX = objNull;
_units = units group _unit;
if ((([objNull, "VIEW"] checkVisibility [eyePos _enemy, eyePos _unit]) > 0) or (_unit distance _enemy < 100) and (!isPlayer _unit)) then
	{
	{
	if (!isPlayer _x) then
		{
		if (([_x] call A3A_fnc_canFight) and ("FirstAidKit" in (items _x)) and (vehicle _x == _x) and (_x distance _unit < _distanceX) and !(_x getVariable ["maneuvering",false])) then
			{
			_medicX == _unit;
			};
		};
	} forEach _units;
	}
else
	{
	{
	if (!isPlayer _x) then
		{
		if ([_x] call A3A_fnc_isMedic) then
			{
			if (([_x] call A3A_fnc_canFight) and ("FirstAidKit" in (items _x)) and (vehicle _x == _x) and (_x distance _unit < 81) and !(_x getVariable ["maneuvering",false])) then
				{
				//_helping = _x getVariable "helping";
				if (!(_x getVariable ["helping",false]) and (!(_x getVariable ["rearming",false]))) then
					{
					_medicX = _x;
					_distanceX = _x distance _unit;
					};
				};
			};
		};
	} forEach _units;

	if (((isNull _medicX) or (_unit getVariable ["incapacitated",false])) and !([_unit] call A3A_fnc_fatalWound)) then
		{
		{
		if (!isPlayer _x) then
			{
			if !([_x] call A3A_fnc_isMedic) then
				{
				if (([_x] call A3A_fnc_canFight) and ("FirstAidKit" in (items _x)) and (vehicle _x == _x) and (_x distance _unit < _distanceX) and !(_x getVariable ["maneuvering",false])) then
					{
					//_helping = _x getVariable "helping";
					if (!(_x getVariable ["helping",false]) and (!(_x getVariable ["rearming",false]))) then
						{
						_medicX = _x;
						_distanceX = _x distance _unit;
						};
					};
				};
			};
		} forEach _units;
		};
	if (!isNull _medicX) then
		{
		if (isNull(_unit getVariable ["helped",objNull])) then {[_unit,_medicX] spawn A3A_fnc_help};
		}
	else
		{
		_distanceX = 81;
		{
		if (!isPlayer _x) then
			{
			if (([_x] call A3A_fnc_canFight) and ("FirstAidKit" in (items _x)) and (vehicle _x == _x) and (_x distance _unit < _distanceX)) then
				{
				_medicX == _unit;
				};
			};
		} forEach _units;
		};
	};
_medicX