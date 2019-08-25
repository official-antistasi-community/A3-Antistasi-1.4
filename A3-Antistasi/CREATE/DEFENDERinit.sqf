private ["_unit","_veh","_typeX","_skill","_riflefinal","_magazines","_hmd","_markerX","_revealX"];

_unit = _this select 0;
if ((isNil "_unit") || (isNull _unit)) exitWith {diag_log format ["%1: [Antistasi] | ERROR | NATOinit.sqf | Error with Nato Parameter:%2",servertime,_this];};
_typeX = typeOf _unit;
if (typeOf _unit == "Fin_random_F") exitWith {};
_unit addEventHandler ["HandleDamage",A3A_fnc_handleDamageAAF];

_unit addEventHandler ["killed",A3A_fnc_AIkilledEH];
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

_skill = (tierWar + difficultyCoef) * 0.1 * skillMult;
if ((faction _unit != POLICE) and (faction _unit != factionFIA)) then
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
_unit setSkill _skill;
if (not(_typeX in sniperUnits)) then
	{
	if (_unit skill "aimingAccuracy" > 0.35) then {_unit setSkill ["aimingAccuracy",0.35]};
	if (_typeX in squadLeaders) then
		{
		_unit setskill ["courage",_skill + 0.2];
		_unit setskill ["commanding",_skill + 0.2];
		};
	};

_hmd = hmd _unit;
//If IFA was NOT detected
if !(hasIFA) then
	{
	//If night
	if (sunOrMoon < 1) then
		{
		//If RHS was NOT detected
		if (!hasRHS) then
			{
			//If unit is not specops or a squad leader
			if ((faction _unit != DEFENDERspecopsFACTION) and (faction _unit != INVADERspecopsFACTION) and (_unit != leader (group _unit))) then
				{
				//If the unit has NVG's
				if (_hmd != "") then
					{
					//If War Level is no higher than 5 AND REBELS dont have NVG's
					if ((random 5 > tierWar) and (!haveNV)) then
						{
						//Remove NVG's
						_unit unassignItem _hmd;
						_unit removeItem _hmd;
						_hmd = "";
						};
					};
				};
			}
		else
			//If RHS was detected
			{
			//Does unit have NVG's that match the NVG spawn array
			_arr = (NVGoggles arrayIntersect (items _unit));
			//If he does, or has something else on his head (pretty sure its only NVG's)
			if (!(_arr isEqualTo []) or (_hmd != "")) then
				{
				//If war level is no higher than 5, rebels don't have NVG's AND the unit isnt a squad leader
				if ((random 5 > tierWar) and (!haveNV) and (_unit != leader (group _unit))) then
					{
					//If unit isnt wearing NVG's
					if (_hmd == "") then
						{
						//Remove any in their inventory
						_hmd = _arr select 0;
						_unit removeItem _hmd;
						}
					else
						{
						//Otherwise unequip it, then remove it
						_unit unassignItem _hmd;
						_unit removeItem _hmd;
						};
					_hmd = "";
					}
				else
					{
					//If war level is high, REBELS have NVG's or the unit is a squad leader: Give them NVG's
					_unit assignItem _hmd;
					};
				};
			};
		//STILL IF NIGHT
		//Get unit primary weapon
		_weaponItems = primaryWeaponItems _unit;
		//Check for NVG's
		if (_hmd != "") then
			{
			//If has NVG's check for a laser pointer
			if (_weaponItems findIf {_x in pointers} != -1) then
				{
				//Turn it on if he has one
				_unit action ["IRLaserOn", _unit];
				_unit enableIRLasers true;
				};
			}
		else
			//If unit has no NVG's
			{
			//Check for laser pointers
			_pointers = _weaponItems arrayIntersect pointers;
			if !(_pointers isEqualTo []) then
				{
				//If he has one, then remove it
				_unit removePrimaryWeaponItem (_pointers select 0);
				};
			_lamp = "";
			//Look for a flashlight
			_lamps = _weaponItems arrayIntersect flashlights;
			if (_lamps isEqualTo []) then
				{
				//If not find a compatible one
				_compatibleLamps = ((primaryWeapon _unit) call BIS_fnc_compatibleItems) arrayIntersect flashlights;
				if !(_compatibleLamps isEqualTo []) then
					{
					//If we found one, attach it
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
				//If we have a flashlight, turn it on and reduce spotDistance and time
				_unit enableGunLights "AUTO";
				_unit setskill ["spotDistance",_skill - 0.2];
				_unit setskill ["spotTime",_skill - 0.2];
				};
			};
		}
	else
		//If DAYTIME
		{
		//If RHS was not detected
		if (!hasRHS) then
			{
			//If unit isnt Specops
			if ((faction _unit != DEFENDERspecopsFACTION) and (faction _unit != INVADERspecopsFACTION)) then
				{
				//And has NVG's
				if (_hmd != "") then
					{
					//Remove them
					_unit unassignItem _hmd;
					_unit removeItem _hmd;
					};
				};
			}
		else
			//If RHS was detected
			{
			//Check for NVG's in their inventory
			_arr = (NVGoggles arrayIntersect (items _unit));
			if (count _arr > 0) then
				{
				//Remove them
				_hmd = _arr select 0;
				_unit removeItem _hmd;
				};
			};
		};
	}
else
	{
	_unit unlinkItem "ItemRadio";
	};
// Reveal ANY airborne unit in spawning range to AI with launchers or manning statics
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