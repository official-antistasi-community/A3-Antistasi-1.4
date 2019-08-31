fn_varNameToSaveName = {
	params ["_varName", ""];
	//Return the name of the save slot for the variable.
	if (worldName == "Tanoa") then
		{
		_varName + serverID + campaignID + "WotP";
		}
	else
		{
		if (side group petros == independent) then
			{
			_varName + serverID + campaignID + "Antistasi" + worldName;
			}
		else
			{
			_varName + serverID + campaignID + "AntistasiB" + worldName;
			};
		};
};

fn_SaveStat =
{
	_varName = _this select 0;
	_varValue = _this select 1;
	if (!isNil "_varValue") then
		{
		_varSaveName = [_varName] call fn_varNameToSaveName;
		profileNameSpace setVariable [_varSaveName, _varValue];
		if (isDedicated) then {saveProfileNamespace};
		};
};

fn_ReturnSavedStat =
{
	private _varName = _this select 0;

  _loadVariable = {
    private ["_varName","_varValue"];
    _varName = _this select 0;
		_varSaveName = [_varName] call fn_varNameToSaveName;

    //Return the value of this statement
		profileNameSpace getVariable (_varSaveName);
  };

  private _varValue = [_varName] call _loadVariable;

  if(isNil "_varValue") then
  {
    _spanishVarName = [_varName] call A3A_fnc_translateVariable;
    _varValue = [_spanishVarName] call _loadVariable;
  };

	if(isNil "_varValue") exitWith {
		diag_log format ["%1: [Antistasi] | ERROR | saveFuncs.sqf | Variable %2 does not exist.",servertime, _varName];
		};
	_varValue;
};

fn_LoadStat =
{
	private ["_varName","_varValue"];
	_varName = _this select 0;

	_varValue = [_varName] call fn_ReturnSavedStat;
	if (isNil "_varValue") exitWith {};
	[_varName,_varValue] call fn_SetStat;
};

fn_SavePlayerStat = {
	private _playerUID = _this select 0;
	private _varName = _this select 1;
	private _varValue = _this select 2;

	private _abort = false;

	if (isNil "_playerUID") then {
		_playerUID = "";
		_abort = true;
	};

	if (isNil "_varName") then {
		_varName = "";
		_abort = true;
	};

	if (isNil "_varValue") then {
		_varValue = "";
		_abort = true;
	};

	if (_abort) exitWith {
		diag_log format ["[Antistiasi] Save invalid for %1, saving %3 as %2", _playerUID, _varName, _varValue];
	};

	private _playerVarName = format ["player_%1_%2", _playerUID, _varName];
	[_playerVarName, _varValue] call fn_SaveStat;
};

fn_RetrievePlayerStat = {
	private _playerUID = _this select 0;
	private _varName = _this select 1;

	if (isNil "_playerUID" || isNil "_varName") exitWith {diag_log ["[Antistiasi] Load invalid for player %1 var %2", _playerUID, _varName]};

	private _playerVarName = format ["player_%1_%2", _playerUID, _varName];
	[_playerVarName] call fn_ReturnSavedStat;
};

//===========================================================================
//ADD VARIABLES TO THIS ARRAY THAT NEED SPECIAL SCRIPTING TO LOAD
/*specialVarLoads =
[
	"weaponsPlayer",
	"magazinesPlayer",
	"backpackPlayer",
	"mrkNATO",
	"rebelMarker",
	"prestigeNATO","prestigeCSAT", "hr","planesAAFcurrent","helisAAFcurrent","APCAAFcurrent","tanksAAFcurrent","armas","items","backpcks","ammunition","dateX", "WitemsPlayer","prestigeOPFOR","rebelCitySupport","resourcesAAF","rebelMoney","rebelTrainingLevel"];
*/
specialVarLoads =
["rebelWatchpostsAndRoadblocks","minesX","staticsX","countCA","antennas","mrkNATO","rebelMarker","prestigeNATO","prestigeCSAT","posHQ", "hr","armas","items","backpcks","ammunition","dateX", "prestigeOPFOR","rebelCitySupport","rebelMoney","rebelTrainingLevel","distanceSPWN","civPerc","maxUnits","destroyedCities","garrison","tasks","smallCAmrk","membersX","vehInGarage","destroyedBuildings","idlebases","idleassets","chopForest","weather","killZones","jna_dataList","rebelControlPoints","mrkCSAT","nextTick","bombRuns","difficultyX","gameMode"];
//THIS FUNCTIONS HANDLES HOW STATS ARE LOADED
fn_SetStat =
{
	_varName = _this select 0;
	_varValue = _this select 1;
	if(isNil '_varValue') exitWith {};
	if(_varName in specialVarLoads) then
	{
		if(_varName == 'countCA') then {countCA = _varValue; publicVariable "countCA"};
		if(_varName == 'difficultyX') then
			{
			if !(isMultiplayer) then
				{
				skillMult = _varValue;
				if (skillMult == 0.5) then {minWeaps = 15};
				if (skillMult == 2) then {minWeaps = 40};
				};
			};
		if(_varName == 'gameMode') then
			{
			if !(isMultiplayer) then
				{
				gameMode = _varValue;
				if (gameMode != 1) then
					{
					Occupants setFriend [Invaders,1];
				    Invaders setFriend [Occupants,1];
				    if (gameMode == 3) then {"CSAT_carrier" setMarkerAlpha 0};
				    if (gameMode == 4) then {"NATO_carrier" setMarkerAlpha 0};
					};
				};
			};
		if(_varName == 'bombRuns') then {bombRuns = _varValue; publicVariable "bombRuns"};
		if(_varName == 'nextTick') then {nextTick = time + _varValue};
		if(_varName == 'membersX') then {membersX = +_varValue; publicVariable "membersX"};
		if(_varName == 'smallCAmrk') then {smallCAmrk = +_varValue};
		if(_varName == 'mrkNATO') then {{sidesX setVariable [_x,Occupants,true]} forEach _varValue;};
		if(_varName == 'mrkCSAT') then {{sidesX setVariable [_x,Invaders,true]} forEach _varValue;};
		if(_varName == 'rebelMarker') then {{sidesX setVariable [_x,rebelSide,true]} forEach _varValue;};
		if(_varName == 'rebelControlPoints') then
			{
			{
			sidesX setVariable [_x,rebelSide,true]
			} forEach _varValue;
			};
		if(_varName == 'chopForest') then {chopForest = _varValue; publicVariable "chopForest"};
		if(_varName == 'jna_dataList') then {jna_dataList = +_varValue};
		if(_varName == 'prestigeNATO') then {prestigeNATO = _varValue; publicVariable "prestigeNATO"};
		if(_varName == 'prestigeCSAT') then {prestigeCSAT = _varValue; publicVariable "prestigeCSAT"};
		if(_varName == 'hr') then {server setVariable ["HR",_varValue,true]};
		if(_varName == 'dateX') then {setDate _varValue};
		if(_varName == 'weather') then
			{
			0 setFog (_varValue select 0);
			0 setRain (_varValue select 1);
			forceWeatherChange
			};
		if(_varName == 'rebelMoney') then {server setVariable ["rebelMoney",_varValue,true]};
		if(_varName == 'destroyedCities') then {destroyedCities = +_varValue; publicVariable "destroyedCities"};
		if(_varName == 'rebelTrainingLevel') then
			{
			rebelTrainingLevel = _varValue; publicVariable "rebelTrainingLevel";
			{
			_costs = server getVariable _x;
			for "_i" from 1 to _varValue do
				{
				_costs = round (_costs + (_costs * (_i/280)));
				};
			server setVariable [_x,_costs,true];
			} forEach rebelUnitsAll;
			};
		if(_varName == 'distanceSPWN') then {distanceSPWN = _varValue; distanceSPWN1 = distanceSPWN * 1.3; distanceSPWN2 = distanceSPWN /2; publicVariable "distanceSPWN";publicVariable "distanceSPWN1";publicVariable "distanceSPWN2"};
		if(_varName == 'civPerc') then {civPerc = _varValue; if (civPerc < 1) then {civPerc = 35}; publicVariable "civPerc"};
		if(_varName == 'maxUnits') then {maxUnits=_varValue; publicVariable "maxUnits"};
		if(_varName == 'vehInGarage') then {vehInGarage= +_varValue; publicVariable "vehInGarage"};
		if(_varName == 'destroyedBuildings') then
			{
			destroyedBuildings= +_varValue;
			//publicVariable "destroyedBuildings";
			{
				(nearestObject [_x, "House"]) setDamage [1,false];
			} forEach destroyedBuildings;
			};
		if(_varName == 'minesX') then
			{
			for "_i" from 0 to (count _varvalue) - 1 do
				{
				_typeMine = _varvalue select _i select 0;
				switch _typeMine do
					{
					case "APERSMine_Range_Ammo": {_typeMine = "APERSMine"};
					case "ATMine_Range_Ammo": {_typeMine = "ATMine"};
					case "APERSBoundingMine_Range_Ammo": {_typeMine = "APERSBoundingMine"};
					case "SLAMDirectionalMine_Wire_Ammo": {_typeMine = "SLAMDirectionalMine"};
					case "APERSTripMine_Wire_Ammo": {_typeMine = "APERSTripMine"};
					case "ClaymoreDirectionalMine_Remote_Ammo": {_typeMine = "Claymore_F"};
					};
				_posMine = _varvalue select _i select 1;
				_mineX = createMine [_typeMine, _posMine, [], 0];
				_detected = _varvalue select _i select 2;
				{_x revealMine _mineX} forEach _detected;
				if (count (_varvalue select _i) > 3) then//borrar esto en febrero
					{
					_dirMine = _varvalue select _i select 3;
					_mineX setDir _dirMine;
					};
				};
			};
		if(_varName == 'garrison') then
			{
			//_markersX = markersX - rebelWatchpostsAndRoadblocks - controlsX - citiesX;
			{garrison setVariable [_x select 0,_x select 1,true]} forEach _varvalue;
			};
		if(_varName == 'rebelWatchpostsAndRoadblocks') then
			{
			if (count (_varValue select 0) == 2) then
				{
				{
				_positionX = _x select 0;
				_garrison = _x select 1;
				_mrk = createMarker [format ["%2 post%1", random 1000], _positionX,rebelFactionName];
				_mrk setMarkerShape "ICON";
				_mrk setMarkerType "loc_bunker";
				_mrk setMarkerColor rebelColor;
				if (isOnRoad _positionX) then {_mrk setMarkerText format ["%1 Roadblock",rebelFactionName]} else {_mrk setMarkerText format ["%1 Watchpost",rebelFactionName]};
				spawner setVariable [_mrk,2,true];
				if (count _garrison > 0) then {garrison setVariable [_mrk,_garrison,true]};
				rebelWatchpostsAndRoadblocks pushBack _mrk;
				sidesX setVariable [_mrk,rebelSide,true];
				} forEach _varvalue;
				};
			};

		if(_varName == 'antennas') then
			{
			antennasDead = +_varvalue;
			for "_i" from 0 to (count _varvalue - 1) do
			    {
			    _posAnt = _varvalue select _i;
			    _mrk = [mrkAntennas, _posAnt] call BIS_fnc_nearestPosition;
			    _antenna = [antennas,_mrk] call BIS_fnc_nearestPosition;
			    {if ([antennas,_x] call BIS_fnc_nearestPosition == _antenna) then {[_x,false] spawn A3A_fnc_blackout}} forEach citiesX;
			    antennas = antennas - [_antenna];
			    _antenna removeAllEventHandlers "Killed";
			    _antenna setDamage [1,false];
			    deleteMarker _mrk;
			    };
			antennasDead = _varvalue;
			publicVariable "antennas";
			publicVariable "antennasDead";
			};
		if(_varname == 'prestigeOPFOR') then
			{
			for "_i" from 0 to (count citiesX) - 1 do
				{
				_city = citiesX select _i;
				_dataX = server getVariable _city;
				_numCiv = _dataX select 0;
				_numVeh = _dataX select 1;
				_prestigeOPFOR = _varvalue select _i;
				_rebelCitySupport = _dataX select 3;
				_dataX = [_numCiv,_numVeh,_prestigeOPFOR,_rebelCitySupport];
				server setVariable [_city,_dataX,true];
				};
			};
		if(_varname == 'rebelCitySupport') then
			{
			for "_i" from 0 to (count citiesX) - 1 do
				{
				_city = citiesX select _i;
				_dataX = server getVariable _city;
				_numCiv = _dataX select 0;
				_numVeh = _dataX select 1;
				_prestigeOPFOR = _dataX select 2;
				_rebelCitySupport = _varvalue select _i;
				_dataX = [_numCiv,_numVeh,_prestigeOPFOR,_rebelCitySupport];
				server setVariable [_city,_dataX,true];
				};
			};
		if(_varname == 'idlebases') then
			{
			{
			server setVariable [(_x select 0),(_x select 1),true];
			} forEach _varValue;
			};
		if(_varname == 'idleassets') then
			{
			{
			timer setVariable [(_x select 0),(_x select 1),true];
			} forEach _varValue;
			};
		if(_varname == 'killZones') then
			{
			{
			killZones setVariable [(_x select 0),(_x select 1),true];
			} forEach _varValue;
			};
		if(_varName == 'posHQ') then
			{
			_posHQ = if (count _varValue >3) then {_varValue select 0} else {_varValue};
			{if (getMarkerPos _x distance _posHQ < 1000) then
				{
				sidesX setVariable [_x,rebelSide,true];
				};
			} forEach controlsX;
			rebelRespawn setMarkerPos _posHQ;
			posHQ = getMarkerPos rebelRespawn;
			petros setPos _posHQ;
			"Synd_HQ" setMarkerPos _posHQ;
			if (chopForest) then
				{
				if (!isMultiplayer) then {{ _x hideObject true } foreach (nearestTerrainObjects [position petros,["tree","bush"],70])} else {{ _x hideObjectGlobal true } foreach (nearestTerrainObjects [position petros,["tree","bush"],70])};
				};
			if (count _varValue == 3) then
				{
				[] spawn A3A_fnc_buildHQ;
				}
			else
				{
				fireX setPos (_varValue select 1);
				boxX setDir ((_varValue select 2) select 0);
				boxX setPos ((_varValue select 2) select 1);
				mapX setDir ((_varValue select 3) select 0);
				mapX setPos ((_varValue select 3) select 1);
				flagX setPos (_varValue select 4);
				vehicleBox setDir ((_varValue select 5) select 0);
				vehicleBox setPos ((_varValue select 5) select 1);
				};
			{_x setPos _posHQ} forEach (playableUnits select {side _x == rebelSide});
			};
		if(_varname == 'staticsX') then
			{
			for "_i" from 0 to (count _varvalue) - 1 do
				{
				_typeVehX = _varvalue select _i select 0;
				_posVeh = _varvalue select _i select 1;
				_dirVeh = _varvalue select _i select 2;
				_veh = createVehicle [_typeVehX,[0,0,1000],[],0,"NONE"];
				_veh setDir _dirVeh;_veh setDir _dirVeh;
				_veh setPos _posVeh;
				_veh setVectorUp surfaceNormal (getPos _veh);
				if ((_veh isKindOf "StaticWeapon") or (_veh isKindOf "Building")) then
					{
					staticsToSave pushBack _veh;
					};
				[_veh] call A3A_fnc_AIVEHinit;
				};
			publicVariable "staticsToSave";
			};
		if(_varname == 'tasks') then
			{
			{
			if (_x == "aiAttack") then
				{
				[] call A3A_fnc_aiAttackCreate;
				}
			else
				{
				if (_x == "DEF_HQ") then
					{
					[] spawn A3A_fnc_attackHQ;
					}
				else
					{
					[_x,true] call A3A_fnc_missionRequest;
					};
				};
			} forEach _varvalue;
			};
	}
	else
	{
		call compile format ["%1 = %2",_varName,_varValue];
	};
};

//==================================================================================================================================================================================================
saveFuncsLoaded = true;
