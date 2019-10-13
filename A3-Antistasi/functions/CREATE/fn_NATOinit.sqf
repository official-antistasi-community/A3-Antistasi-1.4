private ["_unit","_veh","_sideX","_typeX","_skill","_riflefinal","_magazines","_hmd","_markerX","_revealX"];

_unit = _this select 0;
if ((isNil "_unit") || (isNull _unit)) exitWith {diag_log format ["%1: [Antistasi] | ERROR | NATOinit.sqf | Error with Nato Parameter:%2",servertime,_this];};
_typeX = typeOf _unit;
if (typeOf _unit == "Fin_random_F") exitWith {};
_sideX = side _unit;
//_unit setVariable ["sideX",_sideX];
_unit addEventHandler ["HandleDamage",A3A_fnc_handleDamageAAF];

_unit addEventHandler ["killed",A3A_fnc_occupantInvaderUnitKilledEH];
if (count _this > 1) then
	{
	_markerX = _this select 1;
	if (_markerX != "") then
		{
		_unit setVariable ["markerX",_markerX,true];
		if ((spawner getVariable _markerX != 0) and (vehicle _unit != _unit)) then {if (!isMultiplayer) then {_unit enableSimulation false} else {[_unit,false] remoteExec ["enableSimulationGlobal",2]}};
		};
	}
else
	{
	if (vehicle _unit != _unit) then
		{
		_veh = vehicle _unit;
		if (_unit in (assignedCargo _veh)) then
			{
			//if (typeOf _veh in vehAPCs) then {if (isMultiplayer) then {[_unit,false] remoteExec ["enableSimulationGlobal",2]} else {_unit enableSimulation false}};
			_unit addEventHandler ["GetOutMan",
				{
				_unit = _this select 0;
				_veh = _this select 2;
				_driver = driver _veh;
				if (!isNull _driver) then
					{
					if (side group _driver != teamPlayer) then
						{
						if !(_unit getVariable ["spawner",false]) then
							{
							_unit setVariable ["spawner",true,true]
							};
						};
					};
				}];
			}
		else
			{
			_unit setVariable ["spawner",true,true]
			};
		}
	else
		{
		_unit setVariable ["spawner",true,true]
		};
	};

_skill = (0.15 + (0.02 * difficultyCoef) + (0.01 * tierWar)) * skillMult;
/* PBP - removed for my new difficulty math
if ((faction _unit != factionGEN) and (faction _unit != factionFIA)) then
	{
	if (side _unit == Occupants) then
		{
		_skill = _skill + 0.1;
		}
	else
		{
		if (count _this > 1) then
			{
			_skill = _skill + 0.2;
			}
		else
			{
			_skill = _skill + 0.3;
			};
		};
	}
else
	{
	if (faction _unit == factionFIA) then
		{
		_skill = _skill min 0.3;
		}
	else
		{
		_skill = _skill min 0.2;
		if ((tierWar > 1) and !hasIFA) then
			{
			_rifleFinal = primaryWeapon _unit;
			_magazines = getArray (configFile / "CfgWeapons" / _rifleFinal / "magazines");
			{_unit removeMagazines _x} forEach _magazines;
			_unit removeWeaponGlobal (_rifleFinal);
			if (tierWar < 5) then {[_unit, "arifle_MX_Black_F", 6, 0] call BIS_fnc_addWeapon} else {[_unit, "arifle_AK12_F", 6, 0] call BIS_fnc_addWeapon};
			_unit selectWeapon (primaryWeapon _unit);
			};
		};
	};

if (_skill > 0.58) then {_skill = 0.58};
*/

_unit setSkill _skill;
/* PBP - prevented non-sniper aim nerf
if (not(_typeX in sniperUnits)) then
	{
	if (_unit skill "aimingAccuracy" > 0.35) then {_unit setSkill ["aimingAccuracy",0.35]};
	*/
	if (_typeX in squadLeaders) then
		{
		_unit setskill ["courage",_skill + 0.2];
		_unit setskill ["commanding",_skill + 0.2];
		};
	//};

_hmd = hmd _unit;
if !(hasIFA) then
	{
	if (sunOrMoon < 1) then
		{
		if (!hasRHS) then
			{
			if ((faction _unit != factionMaleOccupants) and (faction _unit != factionMaleInvaders) and (_unit != leader (group _unit))) then
				{
				if (_hmd != "") then
					{
					if ((random 5 > tierWar) and (!haveNV)) then
						{
						_unit unassignItem _hmd;
						_unit removeItem _hmd;
						_hmd = "";
						};
					};
				};
			}
		else
			{
			_arr = (allNVG arrayIntersect (items _unit));
			if (!(_arr isEqualTo []) or (_hmd != "")) then
				{
				if ((random 5 > tierWar) and (!haveNV) and (_unit != leader (group _unit))) then
					{
					if (_hmd == "") then
						{
						_hmd = _arr select 0;
						_unit removeItem _hmd;
						}
					else
						{
						_unit unassignItem _hmd;
						_unit removeItem _hmd;
						};
					_hmd = "";
					}
				else
					{
					_unit assignItem _hmd;
					};
				};
			};
		_weaponItems = primaryWeaponItems _unit;
		if (_hmd != "") then
			{
			if (_weaponItems findIf {_x in attachmentLaser} != -1) then
				{
				_unit action ["IRLaserOn", _unit];
				_unit enableIRLasers true;
				};
			}
		else
			{
			_pointers = _weaponItems arrayIntersect attachmentLaser;
			if !(_pointers isEqualTo []) then
				{
				_unit removePrimaryWeaponItem (_pointers select 0);
				};
			_lamp = "";
			_lamps = _weaponItems arrayIntersect attachmentLight;
			if (_lamps isEqualTo []) then
				{
				_compatibleLamps = ((primaryWeapon _unit) call BIS_fnc_compatibleItems) arrayIntersect attachmentLight;
				if !(_compatibleLamps isEqualTo []) then
					{
					_lamp = selectRandom _compatibleLamps;
					_unit addPrimaryWeaponItem _lamp;
				    _unit assignItem _lamp;
					};
				}
			else
				{
				_lamp = _lamps select 0;
				};
			if (_lamp != "") then
				{
				_unit enableGunLights "AUTO";
				};
			//Reduce their magical night-time spotting powers.
			_unit setskill ["spotDistance", _skill * 0.7];
			_unit setskill ["spotTime", _skill * 0.5];
			};
		}
	else
		{
		if (!hasRHS) then
			{
			if ((faction _unit != factionMaleOccupants) and (faction _unit != factionMaleInvaders)) then
				{
				if (_hmd != "") then
					{
					_unit unassignItem _hmd;
					_unit removeItem _hmd;
					};
				};
			}
		else
			{
			_arr = (allNVG arrayIntersect (items _unit));
			if (count _arr > 0) then
				{
				_hmd = _arr select 0;
				_unit removeItem _hmd;
				};
			};
		};
	}
else
	{
	_unit unlinkItem (_unit call A3A_fnc_getRadio);
	};
_revealX = false;
if (vehicle _unit != _unit) then
	{
	if (_unit == gunner (vehicle _unit)) then
		{
		_revealX = true;
		};
	}
else
	{
	if ((secondaryWeapon _unit) in mlaunchers) then {_revealX = true};
	};
if (_revealX) then
	{
	{
	_unit reveal [_x,1.5];
	} forEach allUnits select {(vehicle _x isKindOf "Air") and (_x distance _unit <= distanceSPWN)}
	};