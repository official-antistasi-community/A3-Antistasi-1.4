private ["_unit","_part","_dam","_injurer","_groupX"];
_dam = _this select 2;
_injurer = _this select 3;
if (side _injurer == teamPlayer) then
	{
	_unit = _this select 0;
	_part = _this select 1;
	_groupX = group _unit;
	if (time > _groupX getVariable ["movedToCover",0]) then
		{
		if ((behaviour leader _groupX != "COMBAT") and (behaviour leader _groupX != "STEALTH")) then
			{
			_groupX setVariable ["movedToCover",time + 120];
			{[_x,_injurer] call A3A_fnc_unitGetToCover} forEach units _groupX;
			};
		};
	if (_part == "") then
		{
		if (_dam >= 1) then
			{
			if (!(_unit getVariable ["INCAPACITATED",false])) then
				{
				_unit setVariable ["INCAPACITATED",true,true];
				_unit setUnconscious true;
				_dam = 0.9;
				[_unit,_injurer] spawn A3A_fnc_unconsciousAAF;
				}
			else
				{
				_overall = (_unit getVariable ["overallDamage",0]) + (_dam - 1);
				if (_overall > 0.5) then
					{
					_unit removeAllEventHandlers "HandleDamage";
					}
				else
					{
					_unit setVariable ["overallDamage",_overall];
					_dam = 0.9;
					};
				};
			}
		else
			{
			if (_dam > 0.25) then
				{
				if (_unit getVariable ["helping",false]) then
					{
					_unit setVariable ["cancelRevive",true];
					};
				};
			if (_dam > 0.6) then {[_unit,_injurer] spawn A3A_fnc_unitGetToCover};
			};
		}
	else
		{
		if (_dam >= 1) then
			{
			if !(_part in ["arms","hands","legs"]) then
				{
				_dam = 0.9;
				if (_part == "head") then
					{
					if (getNumber (configfile >> "CfgWeapons" >> headgear _unit >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Head" >> "armor") > 0) then
						{
						removeHeadgear _unit;
						}
					else
						{
						if !(_unit getVariable ["INCAPACITATED",false]) then
							{
							_unit setVariable ["INCAPACITATED",true,true];
							_unit setUnconscious true;
							if (vehicle _unit != _unit) then
								{
								//_unit action ["getOut", vehicle _unit];
								moveOut _unit;
								};
							if (isPlayer _unit) then {_unit allowDamage false};
							if (!isNull _injurer) then {[_unit,_injurer] spawn A3A_fnc_unconsciousAAF} else {[_unit,objNull] spawn A3A_fnc_unconsciousAAF};
							};
						};
					}
				else
					{
					if (_part == "body") then
						{
						if !(_unit getVariable ["INCAPACITATED",false]) then
							{
							_unit setVariable ["INCAPACITATED",true,true];
							_unit setUnconscious true;
							if (vehicle _unit != _unit) then
								{
								moveOut _unit;
								};
							if (isPlayer _unit) then {_unit allowDamage false};
							if (!isNull _injurer) then {[_unit,_injurer] spawn A3A_fnc_unconsciousAAF} else {[_unit,objNull] spawn A3A_fnc_unconsciousAAF};
							};
						};
					};
				};
			};
		};
	};
_dam