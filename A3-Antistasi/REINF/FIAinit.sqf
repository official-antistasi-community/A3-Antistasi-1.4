private ["_unit","_victim","_killer","_skill","_nameX","_typeX"];

_unit = _this select 0;

[_unit] call A3A_fnc_initRevive;																	// trigger medical handler
_unit setVariable ["spawner",true,true];

_unit allowFleeing 0;																			// prevent unit surrender
_typeX = typeOf _unit;																			// get unit type
_skill = skillFIA * 0.05 * skillMult;																// current initial skill is [0.025,0.05,0.1] based on difficulty. at skillFIA = 10 [0.25,0.5,1] at 20 [0.5,1,2]
if (!hasGREF) then {if (not((uniform _unit) in REBELuniformsPM)) then {[_unit] call A3A_fnc_reDress}};			// if RHS GREF isnt detected and unit isnt wearing a REBEL uniform from templates then redress him

if ((!isMultiplayer) and (leader _unit == theBoss)) then {_skill = _skill + 0.1};							// if SP and unit is in players squad then boost their skill by 0.1
_unit setSkill _skill;																			// set the units skill

if (_typeX in SDKSniper) then																		// if unit is in the sniper list
	{																						//
	diag_log format ["%1: [Antistasi] | INFO | FIAinit.sqf | Equipping primary weapon of unit type %2",servertime,_typeX];
	if (count unlockedSN > 0) then																// and we have unlocked sniper rifles
		{																					//
		[_unit,unlockedSN] call A3A_fnc_randomRifle;													// give him a random sniper rifle
		}
	else 																					// if we dont have any sniper rifles
		{																					//
		[_unit,unlockedRifles] call A3A_fnc_randomRifle;												// give him any random rifle
		};
	// add sniper uniforms/vests/items
	}
else 																		// if unit is not a sniper
	{																		//
	if (_unit skill "aimingAccuracy" > 0.35) then {_unit setSkill ["aimingAccuracy",0.35]}; 	// maximum accuracy is 35%
	if (random 40 < skillFIA) then 												// at best 50% chance that units will have their helmets removed if they have poor armor and replaced with unlocked helmets
		{
		if (getNumber (configfile >> "CfgWeapons" >> headgear _unit >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Head" >> "armor") < 2) then {removeHeadgear _unit;_unit addHeadgear (selectRandom helmets)};
		};
	if ((_typeX in SDKMil) or (_typeX == staticCrewTeamPlayer)) then						// If unit is in the military or static crew troop lists
		{																	//
		diag_log format ["%1: [Antistasi] | INFO | FIAinit.sqf | Equipping primary weapon of unit type %2",servertime,_typeX];
		[_unit,unlockedRifles] call A3A_fnc_randomRifle;								// Give them a Rifle
		if ((loadAbs _unit < 340) and (_typeX in SDKMil)) then							//
			{																//
			if ((random 20 < skillFIA) and (count unlockedAA > 0)) then					// if roll succeeds and there are unlocked AA launchers
				{															//
				diag_log format ["%1: [Antistasi] | INFO | FIAinit.sqf | Equipping launcher weapon of unit type %2",servertime,_typeX];
				_unit addbackpack (unlockedBackpacks select 0);						// give them the first unlocked backpack (needs improvement)
				[_unit, selectRandom unlockedAA, 2, 0] call BIS_fnc_addWeapon;			// give them a random launcher from the AA list and 2 magazines of the first type in CfgWeapons
				};															//
			};
		// add SDKmil or static crew gear here										//
		}																	//
	else
		{
		if (_typeX in SDKMG) then												// if they meet the MG list
			{																//
			diag_log format ["%1: [Antistasi] | INFO | FIAinit.sqf | Equipping primary weapon of unit type %2",servertime,_typeX];
			if (count unlockedMG > 0) then										// and we have unlocked MG's
			{																//
				[_unit,unlockedMG] call A3A_fnc_randomRifle;							// give them an MG class primary
			}																//
		else 																// or
			{																//
				[_unit,unlockedRifles] call A3A_fnc_randomRifle;						// give them a rifle
			};
			}
		else
			{
			if (_typeX in SDKGL) then											// if they meet the GL lists
				{															//
				diag_log format ["%1: [Antistasi] | INFO | FIAinit.sqf | Equipping primary weapon of unit type %2",servertime,_typeX];
				if (count unlockedGL > 0) then									// and we have unlocked Gl Rifles
					{														//
					[_unit,unlockedGL] call A3A_fnc_randomRifle;						// Give them a GL
				}															//
			else 															//
					{														//
					[_unit,unlockedRifles] call A3A_fnc_randomRifle;					// give them a rifle
					};
				}
			else
				{
				if (_typeX != SDKUnarmed) then {[_unit,unlockedRifles] call A3A_fnc_randomRifle};		// Otherwise as long as the unit is not a prisoner/refugee give them any random rifle
				diag_log format ["%1: [Antistasi] | INFO | FIAinit.sqf | Equipping primary weapon of unit type %2",servertime,_typeX];
				if (_typeX in SDKExp) then													// if unit is explosive specialist
					{																	//
					diag_log format ["%1: [Antistasi] | INFO | FIAinit.sqf | Setting Exp. Spec. trait to unit of type %2",servertime,_typeX];
					_unit setUnitTrait ["explosiveSpecialist",true];								// give them the proper trait
					}
				else
					{
					if (_typeX in SDKMedic) then												// if unit is a medic
						{																//
						if (debug) then {diag_log format ["%1: [Antistasi] | INFO | FIAinit.sqf | Setting Medic trait and gear to unit of type %2",servertime,_typeX];};
						_unit setUnitTrait ["medic",true];										// give them the proper trait
						if ({_x == "Medikit"} count (items _unit) < 1) then						// see if they have a medikit
							{															//
							_unit addItemToBackpack "Medikit"									// and if not, give them one
							};
						}
					else
						{
						if (_typeX in SDKATman) then											// if unit is an AT soldier
							{															//
							if !(unlockedAT isEqualTo []) then									// and we have unlockedAT
								{														//
								_rlauncher = selectRandom unlockedAT;							// pick a random one
								if (_rlauncher != secondaryWeapon _unit) then					// and if the unit isnt currently carrying it
									{													//
									diag_log format ["%1: [Antistasi] | INFO | FIAinit.sqf | Equipping launcher to unit of type %2, because it was AT and didnt have one that matched unlockedAT",servertime,_typeX];
									_magazines = getArray (configFile / "CfgWeapons" / (secondaryWeapon _unit) / "magazines");
									{_unit removeMagazines _x} forEach _magazines;				// remove whatever magazines he had for the secondary weapon he was carrying
									_unit removeWeaponGlobal (secondaryWeapon _unit);				// and the weapon
									[_unit, _rlauncher, 4, 0] call BIS_fnc_addWeapon;				// and add the chosen launcher with 4 magazines of the first type
								};														// TODO: add second type of secondary mags too for TITAN_AP
								}
							else
								{
								if (hasIFA) then											// if IFA is detected
									{													//
									diag_log format ["%1: [Antistasi] | INFO | FIAinit.sqf | Giving IFA weapon to unit of type %2",servertime,_typeX];
									[_unit, "LIB_PTRD", 10, 0] call BIS_fnc_addWeapon;			// assign IFA Secondary
									};
								};
							}
						else
							{
							if (_typeX in squadLeaders) then									// if unit is a squad leader
								{														//
								_unit setskill ["courage",_skill + 0.2];						// boost his courage
								_unit setskill ["commanding",_skill + 0.2];						// boost his commanding skill
								};
							};
						};
					};
				};
			};
		};
	};

_unit setUnitTrait ["camouflageCoef",0.8];														// make unit slightly harder to spot
_unit setUnitTrait ["audibleCoef",0.8];															// make unit slightly harder to hear

_unit selectWeapon (primaryWeapon _unit);														// make the unit draw his primary weapon

if (!haveRadio) then																		// if radio's are not unlocked
	{																					//
	if ((_unit != leader _unit) and (_typeX != staticCrewTeamPlayer)) then {_unit unlinkItem "ItemRadio"};	// remove units radio if it is not the squad leader or a mortar crewman
	};

if ({if (_x in smokeX) exitWith {1}} count unlockedMagazines > 0) then {_unit addMagazines [selectRandom smokeX,2]};	// give unit 2 random smoke grenades
if ({if (_x in chemX) exitWith {1}} count unlockedMagazines > 0) then {_unit addMagazines [selectRandom chemX,2]};		// give unit 2 random chem sticks
	
if !(hasIFA) then																					// if we DONT detect IFA
	{																							//
	if ((sunOrMoon < 1) and (_typeX != SDKUnarmed)) then													// if it is night and unit isnt a prisoner/refugee
		{																						//
		if (haveNV) then																			// and NVG's are unlocked
			{																					//
			if (hmd _unit == "") then {_unit linkItem (selectRandom NVGoggles)};								// if unit doesnt already have NVG's give him a pair
			_pointers = pointers arrayIntersect unlockedItems;											// pull laser pointers out of unlockedItems
			if !(_pointers isEqualTo []) then															// if we have any
				{																				//
				_pointers = _pointers arrayIntersect ((primaryWeapon _unit) call BIS_fnc_compatibleItems);		// build an array of laser pointers that are compatible with the units primary weapon
				if !(_pointers isEqualTo []) then														// if we have any
					{																			//
					_pointer = selectRandom _pointers;													// pick one at random
					_unit addPrimaryWeaponItem _pointer;												// and attach it
			        _unit assignItem _pointer;															// turn it on
			        _unit enableIRLasers true;															// and tell the unit it has a laser pointer
					};
				};
			}
		else
			{																					// if we dont have NVG's unlocked
			_hmd = hmd _unit;																		// get the units NVG
			if (_hmd != "") then																	// if it has one
				{																				//
				_unit unassignItem _hmd;																// take it off
				_unit removeItem _hmd;																// and remove it
			};																					//
			_flashlights = flashlights arrayIntersect unlockedItems;										// create an array of flashlights in unlocked items
			if !(_flashlights isEqualTo []) then														// if we have some
				{																				//
				_flashlights = _flashlights arrayIntersect ((primaryWeapon _unit) call BIS_fnc_compatibleItems);	// create an array of flashlights compatible with units primary weapon
				if !(_flashlights isEqualTo []) then													// if we have some
					{																			//
					_flashlight = selectRandom _flashlights;											// select a random one
					_unit addPrimaryWeaponItem _flashlight;												// attach it to the primary weapon
				    _unit assignItem _flashlight;														// turn it on?
				    _unit enableGunLights _flashlight;													// and tell the unit it has a flashlight on its primary
					};
				};
		    };
		}
	else 																						// if it is day or unit is prisoner/refugee
		{																						//
		_hmd = hmd _unit;																			// check for NVG's
		if (_hmd != "") then																		// if there is one
			{																					//
			_unit unassignItem _hmd;																	// take it off
			_unit removeItem _hmd;																	// and remove it
			};
		};
	};
	
if (player == leader _unit) then																		// if the leader of of this unit is a player
	{																							//
	_unit setVariable ["owner",player];																// set that flag
	_EHkilledIdx = _unit addEventHandler ["killed", {														// add a killedEH
		_victim = _this select 0;																	//
		[_victim] spawn A3A_fnc_postmortem;															// trigger the cleanup flag
		_killer = _this select 1;																	// store the killer
		if !(hasIFA) then {arrayids pushBackUnique (name _victim)};											// if IFA was not detected add the killed units name to the ID array for recycling
		if (side _killer == Occupants) then															// if the killer was the DEFENDER force
			{																					//
			_nul = [0.25,0,getPos _victim] remoteExec ["A3A_fnc_citySupportChange",2];							// each time a REBEL unit is killed DEFENDER support in the nearest town increases 0.25
			[-0.25,0] remoteExec ["A3A_fnc_prestige",2];													// and DEFENDER aggression drops 0.25
			}
		else
			{
			if (side _killer == Invaders) then															// if the killer was the INVADER force
				{																				//
				[0,-0.25] remoteExec ["A3A_fnc_prestige",2]												// reduce INVADER aggression 0.25
				}
			else
				{
				if (isPlayer _killer) then															// if the killer is a player who WASNT side INVADER or DEFENDER
					{																			//
					_killer addRating 1000;															// add negative rating so firendlies dont like them
					};
				};
			};
		_victim setVariable ["spawner",nil,true];														// remove spawner flag from killed unit
	}];																							// end of KilledEH
	if ((typeOf _unit != SDKUnarmed) and !hasIFA) then
		{																						// if the unit isnt a refugee/prisoner and IFA isnt detected
		_idUnit = arrayids call BIS_Fnc_selectRandom;													//
		arrayids = arrayids - [_idunit];																// grab a free unit identity
		_unit setIdentity _idUnit;																	// apply it to this unit
		};
	if (captive player) then {[_unit] spawn A3A_fnc_undercoverAI};											// if player is undercover apply on player too

	_unit setVariable ["rearming",false];																// remove rearming flag
	if ((!haveRadio) and (!hasTFAR) and (!hasACRE) and !(hasIFA)) then
		{																						// if radios arent unlocked, and none of TFAR, ACRE or IFA are detected
		while {alive _unit} do																		// as long as the unit is alive
			{																					//
			sleep 10;																				// every 10 seconds
			if (("ItemRadio" in assignedItems _unit) and ([player] call A3A_fnc_hasRadio)) exitWith {_unit groupChat format ["This is %1, radiocheck OK",name _unit]}; // report ok if the player asked for a radio check
			if (unitReady _unit) then
				{																				// and if the unit is in 'ready' status
				if ((alive _unit) and (_unit distance (getMarkerPos respawnTeamPlayer) > 50) and (_unit distance leader group _unit > 500) and ((vehicle _unit == _unit) or ((typeOf (vehicle _unit)) in arrayCivVeh))) then
					{																			// if the unit is alive, and more than 50m from HQ, and more than 500m from the player, and is a mounted unit or in a civililian car
					hint format ["%1 lost communication, he will come back with you if possible", name _unit];	// notify the player
					[_unit] join stragglers;															// assign the unit to straggles group
					if ((vehicle _unit isKindOf "StaticWeapon") or (isNull (driver (vehicle _unit)))) then {unassignVehicle _unit; [_unit] orderGetIn false}; // if the unit is in a static, or not the driver of the vehicle it is in, make it get out
					_unit doMove position player;														// order the unit to move to the players current position
					_timeX = time + 900;															// and wait 15 minutes
					waitUntil {sleep 1;(!alive _unit) or (_unit distance player < 500) or (time > _timeX)};		// waituntil the unit dies, gets within 500m of the player or the 15 minute timer expires
					if ((_unit distance player >= 500) and (alive _unit)) then {_unit setPos (getMarkerPos respawnTeamPlayer)};	// if the unit is still more than 500m away and still alive then teleport him to HQ
					[_unit] join group player;														// and put him back in the players group
					};																			//
				};																				// end of 'unit ready' loop
			};																					// end of 'while alive' loop
		};
	}																							// end of 'if unit group leader is player'
else
	{																							// if the units leaer ISNT a player
	_EHkilledIdx = _unit addEventHandler ["killed", {														// add a killedEH
		_victim = _this select 0;																	// store the killed unit
		_killer = _this select 1;																	// store the killer
		[_victim] remoteExec ["A3A_fnc_postmortem",2];													// flag the killed unit for cleanup
		if ((isPlayer _killer) and (side _killer == teamPlayer)) then										// if the unit was killed by a player on REBELS
			{																					//
			if (!isMultiPlayer) then																	// and the game is SP
				{																				//
				_nul = [0,-20] remoteExec ["A3A_fnc_resourcesFIA",2];										// penalize the player 20 dollars
				_killer addRating 1000;																// and add penalty rating to him
				};
			}
		else
			{																					// if the killer wasnt a REBEL and a player
			if (side _killer == Occupants) then														// check if killer was a DEFENDER
				{																				// and if it was
				_nul = [0.25,0,getPos _victim] remoteExec ["A3A_fnc_citySupportChange",2];						// increase DEFENDER support by 0.25 in the nearest town to where the unit was killed
				[-0.25,0] remoteExec ["A3A_fnc_prestige",2];												// reduce DEFENDER aggression by 0.25
				}
			else
				{
				if (side _killer == Invaders) then														// if the killer was an INVADER
					{																			//
					[0,-0.25] remoteExec ["A3A_fnc_prestige",2]											// reduce INVADER aggression by 0.25
					}
				else
					{
					if (isPlayer _killer) then														// if the killer was a player, but wasnt an INVADER/DEFENDER/REBEL somehow
						{																		//
						_killer addRating 1000;														// give him penalty rating
						};
					};																			// end of 'mystery faction player'
				};																				// end of 'killer was INVADER'
			};																					// end of 'killer was DEFENDER'
		_victim setVariable ["spawner",nil,true];														// remove spawner flag from killed unit
		}];																						// end of 'non player group-member killedEH'
	};																							// end of 'non player group-member'


