private ["_unit","_veh","_sideX","_typeX","_skill","_riflefinal","_magazines","_hmd","_markerX","_revealX"];

_unit = _this select 0;
if ((isNil "_unit") || (isNull _unit)) exitWith {diag_log format ["%1: [Antistasi] | ERROR | NATOinit.sqf | Error with Nato Parameter:%2",servertime,_this];};
_typeX = typeOf _unit;
if (typeOf _unit == "Fin_random_F") exitWith {};
_sideX = side _unit;
//_unit setVariable ["sideX",_sideX];
_unit addEventHandler ["HandleDamage",A3A_fnc_handleDamageAAF];

_unit addEventHandler ["killed",A3A_fnc_occupantInvaderUnitKilledEH];
if (count _this > 1) then {
	_markerX = _this select 1;
	if (_markerX != "") then {
		_unit setVariable ["markerX",_markerX,true];
		if ((spawner getVariable _markerX != 0) and (vehicle _unit != _unit)) then {if (!isMultiplayer) then {_unit enableSimulation false} else {[_unit,false] remoteExec ["enableSimulationGlobal",2]}};
	};
}
else {
	if (vehicle _unit != _unit) then {
		_veh = vehicle _unit;
		if (_unit in (assignedCargo _veh)) then {
			_unit addEventHandler ["GetOutMan", {
				_unit = _this select 0;
				_veh = _this select 2;
				_driver = driver _veh;
				if (!isNull _driver) then {
					if (side group _driver != teamPlayer) then {
						if !(_unit getVariable ["spawner",false]) then {
							_unit setVariable ["spawner",true,true]
						};
					};
				};
			}];
		}
		else {
			_unit setVariable ["spawner",true,true]
		};
	}
	else {
		_unit setVariable ["spawner",true,true]
	};
};

_skill = (0.15 + (0.02 * difficultyCoef) + (0.01 * tierWar)) * skillMult;

if (faction _unit isEqualTo factionFIA) then {
		_skill = _skill min (0.2 * skillMult);
};
if (faction _unit isEqualTo factionGEN) then {
	_skill = _skill min (0.12 * skillMult);
	if (!hasIFA) then {
		_rifleFinal = primaryWeapon _unit;
		_magazines = getArray (configFile / "CfgWeapons" / _rifleFinal / "magazines");
		{_unit removeMagazines _x} forEach _magazines;
		_unit removeWeaponGlobal (_rifleFinal);
		if (tierWar < 5) then {[_unit, (selectRandom allSMGs), 6, 0] call BIS_fnc_addWeapon} else {[_unit, (selectRandom allRifles), 6, 0] call BIS_fnc_addWeapon};
		_unit selectWeapon (primaryWeapon _unit);
	};
};

_unit setSkill _skill;
if (_typeX in squadLeaders) then {
	_unit setskill ["courage",_skill + 0.2];
	_unit setskill ["commanding",_skill + 0.2];
};

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
			_arr = (allNVGs arrayIntersect (items _unit));
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
			if (_weaponItems findIf {_x in allLaserAttachments} != -1) then
				{
				_unit action ["IRLaserOn", _unit];
				_unit enableIRLasers true;
				};
			}
		else
			{
			_pointers = _weaponItems arrayIntersect allLaserAttachments;
			if !(_pointers isEqualTo []) then
				{
				_unit removePrimaryWeaponItem (_pointers select 0);
				};
			_lamp = "";
			_lamps = _weaponItems arrayIntersect allLightAttachments;
			if (_lamps isEqualTo []) then
				{
				_compatibleLamps = ((primaryWeapon _unit) call BIS_fnc_compatibleItems) arrayIntersect allLightAttachments;
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
			_arr = (allNVGs arrayIntersect (items _unit));
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
	if ((secondaryWeapon _unit) in allMissileLaunchers) then {_revealX = true};
	};
if (_revealX) then
	{
	{
	_unit reveal [_x,1.5];
	} forEach allUnits select {(vehicle _x isKindOf "Air") and (_x distance _unit <= distanceSPWN)}
	};