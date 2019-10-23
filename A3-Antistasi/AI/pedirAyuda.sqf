private ["_unit","_distancia","_hayMedico","_medico","_units","_ayudando","_pidiendoAyuda"];
_unit = _this select 0;
_ayudado = _unit getVariable ["ayudado",objNull];
if (!isNull _ayudado) exitWith {};
//if (!(isMultiplayer) and (isPlayer _unit) and (_unit getVariable ["INCAPACITATED",false])) then {_unit setVariable ["INCAPACITATED",false]};
_enemy = _unit findNearestEnemy _unit;
_distancia = 81;
_medico = objNull;
_units = units group _unit;
if ((([objNull, "VIEW"] checkVisibility [eyePos _enemy, eyePos _unit]) > 0) or (_unit distance _enemy < 100) and (!isPlayer _unit)) then
	{
	{
	if (!isPlayer _x) then
		{
		if (([_x] call A3A_fnc_canFight) and ("FirstAidKit" in (items _x)) and (vehicle _x == _x) and (_x distance _unit < _distancia) and !(_x getVariable ["maniobrando",false])) then
			{
			_medico == _unit;
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
			if (([_x] call A3A_fnc_canFight) and ("FirstAidKit" in (items _x)) and (vehicle _x == _x) and (_x distance _unit < 81) and !(_x getVariable ["maniobrando",false])) then
				{
				//_ayudando = _x getVariable "ayudando";
				if (!(_x getVariable ["ayudando",false]) and (!(_x getVariable ["rearming",false]))) then
					{
					_medico = _x;
					_distancia = _x distance _unit;
					};
				};
			};
		};
	} forEach _units;

	if (((isNull _medico) or (_unit getVariable ["INCAPACITATED",false])) and !([_unit] call A3A_fnc_fatalWound)) then
		{
		{
		if (!isPlayer _x) then
			{
			if !([_x] call A3A_fnc_isMedic) then
				{
				if (([_x] call A3A_fnc_canFight) and ("FirstAidKit" in (items _x)) and (vehicle _x == _x) and (_x distance _unit < _distancia) and !(_x getVariable ["maniobrando",false])) then
					{
					//_ayudando = _x getVariable "ayudando";
					if (!(_x getVariable ["ayudando",false]) and (!(_x getVariable ["rearming",false]))) then
						{
						_medico = _x;
						_distancia = _x distance _unit;
						};
					};
				};
			};
		} forEach _units;
		};
	if (!isNull _medico) then
		{
		if (isNull(_unit getVariable ["ayudado",objNull])) then {[_unit,_medico] spawn A3A_fnc_ayudar};
		}
	else
		{
		_distancia = 81;
		{
		if (!isPlayer _x) then
			{
			if (([_x] call A3A_fnc_canFight) and ("FirstAidKit" in (items _x)) and (vehicle _x == _x) and (_x distance _unit < _distancia)) then
				{
				_medico == _unit;
				};
			};
		} forEach _units;
		};
	};
_medico