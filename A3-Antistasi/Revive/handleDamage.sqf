private ["_unit","_part","_dam","_injurer"];
_unit = _this select 0;
_part = _this select 1;
_dam = _this select 2;
_injurer = _this select 3;

if (_part == "") then
	{
	if (_dam >= 1) then
		{
		if (side _injurer == civilian) then
			{
			_dam = 0.9;
			}
		else
			{
			if !(_unit getVariable ["INCAPACITATED",false]) then
				{
				_unit setVariable ["INCAPACITATED",true,true];
				_unit setUnconscious true;
				if (vehicle _unit != _unit) then
					{
					moveOut _unit;
					};
				_dam = 0.9;
				if (isPlayer _unit) then {_unit allowDamage false};
				if (!isNull _injurer) then {[_unit,side _injurer] spawn A3A_fnc_inconsciente} else {[_unit,sideUnknown] spawn A3A_fnc_inconsciente};
				}
			else
				{
				_overall = (_unit getVariable ["overallDamage",0]) + (_dam - 1);
				if (_overall > 1) then
					{
					if (isPlayer _unit) then
						{
						_dam = 0;
						[_unit] spawn A3A_fnc_respawn;
						if (isPlayer _injurer) then
							{
							if (tkPunish) then
								{
								if ((_injurer != _unit) and (side _injurer == buenos) and (_unit getVariable ["GREENFORSpawn",false])) then
									{
									_uniform = uniform _unit;
									_typeSoldier = getText (configfile >> "CfgWeapons" >> _uniform >> "ItemInfo" >> "uniformClass");
									_sideType = getNumber (configfile >> "CfgVehicles" >> _typeSoldier >> "side");
									if ((_sideType == 1) or (_sideType == 0)) then
										{
										[_injurer,60] remoteExec ["A3A_fnc_castigo",_injurer];
										};
									};
								};
							};
						}
					else
						{
						_unit removeAllEventHandlers "HandleDamage";
						};
					}
				else
					{
					_unit setVariable ["overallDamage",_overall];
					_dam = 0.9;
					};
				};
			};
		}
	else
		{
		if (_dam > 0.25) then
			{
			if (_unit getVariable ["ayudando",false]) then
				{
				_unit setVariable ["cancelRevive",true];
				};
			if (isPlayer (leader group _unit)) then
				{
				if (autoheal) then
					{
					_ayudado = _unit getVariable ["ayudado",objNull];
					if (isNull _ayudado) then {[_unit] call A3A_fnc_pedirAyuda;};
					};
				}
			else
				{
				//if (_dam > 0.6) then {[_unit,_unit,_injurer] spawn A3A_fnc_cubrirConHumo};
				if (_dam > 0.6) then {[_unit,_injurer] spawn A3A_fnc_unitGetToCover};
				};
			};
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
						if (!isNull _injurer) then {[_unit,side _injurer] spawn A3A_fnc_inconsciente} else {[_unit,sideUnknown] spawn A3A_fnc_inconsciente};
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
						if (!isNull _injurer) then {[_unit,side _injurer] spawn A3A_fnc_inconsciente} else {[_unit,sideUnknown] spawn A3A_fnc_inconsciente};
						};
					};
				};
			};
		};
	};
_dam