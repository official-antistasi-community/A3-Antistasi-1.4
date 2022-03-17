			_NE = bob;
			_unit = player;
			private _PotentialGrenades = ((configfile >> "CfgWeapons" >> "Throw") call BIS_fnc_getCfgSubClasses);
			private _CurrentGear = magazines _unit;
			private _ExitNow = false;
			{
				if (["smoke",_x] call BIS_fnc_inString) then
				{
					private _CfgPath = (configFile >> "CfgWeapons" >> "Throw" >> _x >> "magazines");
					private _muzzle_magazines = getArray _CfgPath;
					private _FinalGrenade = "none";
					{
						if (_x in _CurrentGear) exitWith
						{
							_FinalGrenade = _x;
						};
					} foreach _muzzle_magazines;
					
					if !(_FinalGrenade isEqualTo "none") then
					{
							_unit lookAt _NE;
							sleep 1;
							_unit setVariable ["vcm_muzzle",_x];
							_unit setVariable ["vcm_NE",_NE];
							_TempID = _unit addEventHandler ["Fired", 
							{
								params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
								private _getMuzzle = _unit getVariable ["vcm_muzzle","none"];
								private _NE = _unit getVariable ["vcm_NE","none"];
								if (_muzzle isEqualTo _getMuzzle) then
								{
									_projectile spawn
									{
										waituntil {(getposATL _this)#2 < 0.1};
										_this setVelocity [((random 2)-(random 4)),((random 2)-(random 4)),(random 2)];
									};
									private _dir = direction _NE;
									private _TargetPos = getposATL _NE;								
									private _speed = (5 + (random 5));
									private _oPos = getposATL _projectile;
									private _dir2 = ((_Targetpos select 0) - (_oPos select 0)) atan2 ((_Targetpos select 1) - (_oPos select 1));
									private _range = (_unit distance2D _NE)/10;
									_range = _range + (random 2);
									
									private _GetVelocity = velocity _NE;
									
									private _boostX = (_GetVelocity select 0) * 1.5;
									private _boostY = (_GetVelocity select 1) * 1.5;
									private _LOS = [ObjNull, "GEOM"] checkVisibility [eyePos _unit, eyePos _NE];
									private _ZBoost = 2.5;
									if (_LOS isEqualTo 0) then {_ZBoost = 1;_range = _range/5;};
									_projectile setvelocity [_speed * (sin _dir2) + (_boostX), _speed * (cos _dir2) + (_boostY), _ZBoost * (_range/_speed)];								
								};
							}];
						_unit forceweaponfire [_x,_x];
						[_TempID,_unit] spawn {params ["_TempID","_Unit"];sleep 2;_unit removeEventHandler ["Fired", _TempID]};
						_ExitNow = true;
					};
				};
				if (_ExitNow) exitWith {};
			} foreach _PotentialGrenades;