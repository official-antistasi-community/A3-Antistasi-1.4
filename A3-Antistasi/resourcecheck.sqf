if (!isServer) exitWith{};

if (isMultiplayer) then {waitUntil {!isNil "switchCom"}};

private ["_textX"];
scriptName "resourcecheck";
_countSave = 3600;

while {true} do
	{
	//sleep 600;//600
	nextTick = time + 600;
	waitUntil {sleep 15; time >= nextTick};
	if (isMultiplayer) then {waitUntil {sleep 10; isPlayer theBoss}};
	_seaportBoost = 1 + ({sidesX getVariable [_x,sideUnknown] == rebelSide} count seaports);
	_rebelMoneyAdd = 25;//0
	_hrAddBLUFOR = 0;//0
	_popRebel = 0;
	_popGovt = 0;
	_popKilled = 0;
	_popTotal = 0;
	_bonusRebels = 1 + (0.25*({(sidesX getVariable [_x,sideUnknown] == rebelSide) and !(_x in destroyedCities)} count factories));
	{
	_city = _x;
	_rebelMoneyFromCity = 0;
	_hrAddCity = 0;
	_dataX = server getVariable _city;
	_numCiv = _dataX select 0;
	_numVeh = _dataX select 1;
	//_roads = _dataX select 2;
	_prestigeNATO = _dataX select 2;
	_rebelCitySupport = _dataX select 3;
	_CityTowerInfluence = [_city] call A3A_fnc_powerCheck;
	_popTotal = _popTotal + _numCiv;
	_popRebel = _popRebel + (_numCiv * (_rebelCitySupport / 100));
	_popGovt = _popGovt + (_numCiv * (_prestigeNATO / 100));
	_rebelTowerBonus = if (_CityTowerInfluence != rebelSide) then {0.5} else {1};
	//if (not _CityTowerInfluence) then {_rebelTowerBonus = 0.5};

	if (_city in destroyedCities) then
		{
		_rebelMoneyFromCity = 0;
		_hrAddCity = 0;
		_popKilled = _popKilled + _numCIV;
		}
	else
		{
		_rebelMoneyFromCity = ((_numciv * _rebelTowerBonus*(_rebelCitySupport / 100))/3);
		_hrAddCity = (_numciv * (_rebelCitySupport / 10000));///20000 originalmente
		switch (_CityTowerInfluence) do
			{
			case rebelSide: {[-1,_seaportBoost,_city] spawn A3A_fnc_citySupportChange};
			case Occupants: {[1,-1,_city] spawn A3A_fnc_citySupportChange};
			case Invaders: {[-1,-1,_city] spawn A3A_fnc_citySupportChange};
			};
		if (sidesX getVariable [_city,sideUnknown] == Occupants) then
			{
			_rebelMoneyFromCity = (_rebelMoneyFromCity/2);
			_hrAddCity = (_hrAddCity/2);
			};
		};
	_rebelMoneyAdd = _rebelMoneyAdd + _rebelMoneyFromCity;
	_hrAddBLUFOR = _hrAddBLUFOR + _hrAddCity;
	// revuelta civil!!
	if ((_prestigeNATO < _rebelCitySupport) and (sidesX getVariable [_city,sideUnknown] == Occupants)) then
		{
		["TaskSucceeded", ["", format ["%1 joined %2",[_city, false] call A3A_fnc_fn_location,rebelFactionName]]] remoteExec ["BIS_fnc_showNotification",rebelSide];
		sidesX setVariable [_city,rebelSide,true];
		_nul = [5,0] remoteExec ["A3A_fnc_prestige",2];
		_mrkD = format ["Dum%1",_city];
		_mrkD setMarkerColor rebelColor;
		garrison setVariable [_city,[],true];
		sleep 5;
		{_nul = [_city,_x] spawn A3A_fnc_deleteControls} forEach controlsX;
		if ((!(["CONVOY"] call BIS_fnc_taskExists)) and (!bigAttackInProgress)) then
			{
			_base = [_city] call A3A_fnc_findBasesForConvoy;
			if (_base != "") then
				{
				[[_city,_base],"CONVOY"] call A3A_fnc_scheduler;
				};
			};
		[] call A3A_fnc_tierCheck;
		};
	if ((_prestigeNATO > _rebelCitySupport) and (sidesX getVariable [_city,sideUnknown] == rebelSide)) then
		{
		["TaskFailed", ["", format ["%1 joined %2",[_city, false] call A3A_fnc_fn_location,nameOccupants]]] remoteExec ["BIS_fnc_showNotification",rebelSide];
		sidesX setVariable [_city,Occupants,true];
		_nul = [-5,0] remoteExec ["A3A_fnc_prestige",2];
		_mrkD = format ["Dum%1",_city];
		_mrkD setMarkerColor colorOccupants;
		garrison setVariable [_city,[],true];
		sleep 5;
		[] call A3A_fnc_tierCheck;
		};
	} forEach citiesX;
	if (_popKilled > (_popTotal / 3)) then {["destroyedCities",false,true] remoteExec ["BIS_fnc_endMission"]};
	if ((_popRebel > _popGovt) and ({sidesX getVariable [_x,sideUnknown] == rebelSide} count airportsX == count airportsX)) then {["end1",true,true,true,true] remoteExec ["BIS_fnc_endMission",0]};
	/*
	{
	_fabrica = _x;
	if (sidesX getVariable [_fabrica,sideUnknown] == rebelSide) then
		{
		if (not(_fabrica in destroyedCities)) then {_bonusRebels = _bonusRebels + 0.25};
		};
	} forEach factories;
	*/
	{
	_recurso = _x;
	if (sidesX getVariable [_recurso,sideUnknown] == rebelSide) then
		{
		if (not(_recurso in destroyedCities)) then {_rebelMoneyAdd = _rebelMoneyAdd + (300 * _bonusRebels)};
		};
	} forEach resourcesX;
	_hrAddBLUFOR = (round _hrAddBLUFOR);
	_rebelMoneyAdd = (round _rebelMoneyAdd);

	_textX = format ["<t size='0.6' color='#C1C0BB'>Taxes Income.<br/> <t size='0.5' color='#C1C0BB'><br/>Manpower: +%1<br/>Money: +%2 €",_hrAddBLUFOR,_rebelMoneyAdd];
	[] call A3A_fnc_rebelRadio;
	//_updated = false;
	_updated = [] call A3A_fnc_arsenalManage;
	if (_updated != "") then {_textX = format ["%1<br/>Arsenal Updated<br/><br/>%2",_textX,_updated]};
	[petros,"taxRep",_textX] remoteExec ["A3A_fnc_commsMP",[rebelSide,civilian]];
	_hrAddBLUFOR = _hrAddBLUFOR + (server getVariable "hr");
	_rebelMoneyAdd = _rebelMoneyAdd + (server getVariable "rebelMoney");
	server setVariable ["hr",_hrAddBLUFOR,true];
	server setVariable ["rebelMoney",_rebelMoneyAdd,true];
	bombRuns = bombRuns + (({sidesX getVariable [_x,sideUnknown] == rebelSide} count airportsX) * 0.25);
	[petros,"taxRep",_textX] remoteExec ["A3A_fnc_commsMP",[rebelSide,civilian]];
	[] call A3A_fnc_economicsAI;
	if (isMultiplayer) then
		{
		[] spawn A3A_fnc_assigntheBoss;
		difficultyCoef = floor ((({side group _x == rebelSide} count playableUnits) - ({side group _x != rebelSide} count playableUnits)) / 5);
		publicVariable "difficultyCoef";
		};
	if ((!bigAttackInProgress) and (random 100 < 50)) then {[] call A3A_fnc_missionRequestAUTO};
	[[],"A3A_fnc_reinforcementsAI"] call A3A_fnc_scheduler;
	{
	_veh = _x;
	if ((_veh isKindOf "StaticWeapon") and ({isPlayer _x} count crew _veh == 0) and (alive _veh)) then
		{
		_veh setDamage 0;
		[_veh,1] remoteExec ["setVehicleAmmo",_veh];
		};
	} forEach vehicles;
	countCA = countCA - 600;
	if (countCA < 0) then {countCA = 0};
	publicVariable "countCA";
	if ((countCA == 0)/* and (diag_fps > minimoFPS)*/) then
		{
		[1200] remoteExec ["A3A_fnc_timingCA",2];
		if (!bigAttackInProgress) then
			{
			_script = [] spawn A3A_fnc_aiAttackCreate;
			waitUntil {sleep 5; scriptDone _script};
			};
		};
	sleep 3;
    _numWreckedAntennas = count antennasDead;
	//Probability of spawning a mission in.
    _shouldSpawnRepairThisTick = round(random 100) < 20;
    if ((_numWreckedAntennas > 0) && _shouldSpawnRepairThisTick && !(["REP"] call BIS_fnc_taskExists)) then
		{
		_potentials = [];
		{
		_markerX = [markersX, _x] call BIS_fnc_nearestPosition;
		if ((sidesX getVariable [_markerX,sideUnknown] == Occupants) and (spawner getVariable _markerX == 2)) exitWith
			{
			_potentials pushBack [_markerX,_x];
			};
		} forEach antennasDead;
		if (count _potentials > 0) then
			{
			_potential = selectRandom _potentials;
			[[_potential select 0,_potential select 1],"REP_Antenna"] call A3A_fnc_scheduler;
			};
		}
	else
		{
		_changingX = false;
		{
		_chance = 5;
		if ((_x in resourcesX) and (sidesX getVariable [_x,sideUnknown] == Invaders)) then {_chance = 20};
		if (random 100 < _chance) then
			{
			_changingX = true;
			destroyedCities = destroyedCities - [_x];
			_nameX = [_x] call A3A_fnc_localizar;
			["TaskSucceeded", ["", format ["%1 Rebuilt",_nameX]]] remoteExec ["BIS_fnc_showNotification",[rebelSide,civilian]];
			sleep 2;
			};
		} forEach (destroyedCities - citiesX) select {sidesX getVariable [_x,sideUnknown] != rebelSide};
		if (_changingX) then {publicVariable "destroyedCities"};
		};
	if (isDedicated) then
		{
		{
		if (side _x == civilian) then
			{
			_var = _x getVariable "statusAct";
			if (isNil "_var") then
				{
				if (local _x) then
					{
					if ((typeOf _x) in arrayCivs) then
						{
						if (vehicle _x == _x) then
							{
							if (primaryWeapon _x == "") then
								{
								_groupX = group _x;
								deleteVehicle _x;
								if ({alive _x} count units _groupX == 0) then {deleteGroup _groupX};
								};
							};
						};
					};
				};
			};
		} forEach allUnits;
		if (autoSave) then
			{
			_countSave = _countSave - 600;
			if (_countSave <= 0) then
				{
				_countSave = 3600;
				_nul = [] execVM "statSave\saveLoop.sqf";
				};
			};
		};

	sleep 4;
	};