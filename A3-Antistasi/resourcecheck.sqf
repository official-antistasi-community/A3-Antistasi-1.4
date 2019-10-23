if (!isServer) exitWith{};

if (isMultiplayer) then {waitUntil {!isNil "switchCom"}};

private ["_texto"];
scriptName "resourcecheck";
_cuentaSave = 3600;

while {true} do
	{
	//sleep 600;//600
	nextTick = time + 600;
	waitUntil {sleep 15; time >= nextTick};
	if (isMultiplayer) then {waitUntil {sleep 10; isPlayer theBoss}};
	_suppBoost = 1+ ({lados getVariable [_x,sideUnknown] == buenos} count puertos);
	_recAddSDK = 25;//0
	_hrAddBLUFOR = 0;//0
	_popFIA = 0;
	_popAAF = 0;
	_popCSAT = 0;
	_popTotal = 0;
	_bonusFIA = 1 + (0.25*({(lados getVariable [_x,sideUnknown] == buenos) and !(_x in destroyedCities)} count fabricas));
	{
	_ciudad = _x;
	_recAddCiudadSDK = 0;
	_hrAddCiudad = 0;
	_datos = server getVariable _ciudad;
	_numCiv = _datos select 0;
	_numVeh = _datos select 1;
	//_roads = _datos select 2;
	_prestigeNATO = _datos select 2;
	_prestigeSDK = _datos select 3;
	_power = [_ciudad] call A3A_fnc_powerCheck;
	_popTotal = _popTotal + _numCiv;
	_popFIA = _popFIA + (_numCiv * (_prestigeSDK / 100));
	_popAAF = _popAAF + (_numCiv * (_prestigeNATO / 100));
	_multiplicandorec = if (_power != buenos) then {0.5} else {1};
	//if (not _power) then {_multiplicandorec = 0.5};

	if (_ciudad in destroyedCities) then
		{
		_recAddCiudadSDK = 0;
		_hrAddCiudad = 0;
		_popCSAT = _popCSAT + _numCIV;
		}
	else
		{
		_recAddCiudadSDK = ((_numciv * _multiplicandorec*(_prestigeSDK / 100))/3);
		_hrAddCiudad = (_numciv * (_prestigeSDK / 10000));///20000 originalmente
		switch (_power) do
			{
			case buenos: {[-1,_suppBoost,_ciudad] spawn A3A_fnc_citySupportChange};
			case malos: {[1,-1,_ciudad] spawn A3A_fnc_citySupportChange};
			case muyMalos: {[-1,-1,_ciudad] spawn A3A_fnc_citySupportChange};
			};
		if (lados getVariable [_ciudad,sideUnknown] == malos) then
			{
			_recAddCiudadSDK = (_recAddCiudadSDK/2);
			_hrAddCiudad = (_hrAddCiudad/2);
			};
		};
	_recAddSDK = _recAddSDK + _recAddCiudadSDK;
	_hrAddBLUFOR = _hrAddBLUFOR + _hrAddCiudad;
	// revuelta civil!!
	if ((_prestigeNATO < _prestigeSDK) and (lados getVariable [_ciudad,sideUnknown] == malos)) then
		{
		["TaskSucceeded", ["", format ["%1 joined %2",[_ciudad, false] call A3A_fnc_fn_location,nameBuenos]]] remoteExec ["BIS_fnc_showNotification",buenos];
		lados setVariable [_ciudad,buenos,true];
		_nul = [5,0] remoteExec ["A3A_fnc_prestige",2];
		_mrkD = format ["Dum%1",_ciudad];
		_mrkD setMarkerColor colorBuenos;
		garrison setVariable [_ciudad,[],true];
		sleep 5;
		{_nul = [_ciudad,_x] spawn A3A_fnc_deleteControles} forEach controles;
		if ((!(["CONVOY"] call BIS_fnc_taskExists)) and (!bigAttackInProgress)) then
			{
			_base = [_ciudad] call A3A_fnc_findBasesForConvoy;
			if (_base != "") then
				{
				[[_ciudad,_base],"CONVOY"] call A3A_fnc_scheduler;
				};
			};
		[] call A3A_fnc_tierCheck;
		};
	if ((_prestigeNATO > _prestigeSDK) and (lados getVariable [_ciudad,sideUnknown] == buenos)) then
		{
		["TaskFailed", ["", format ["%1 joined %2",[_ciudad, false] call A3A_fnc_fn_location,nameMalos]]] remoteExec ["BIS_fnc_showNotification",buenos];
		lados setVariable [_ciudad,malos,true];
		_nul = [-5,0] remoteExec ["A3A_fnc_prestige",2];
		_mrkD = format ["Dum%1",_ciudad];
		_mrkD setMarkerColor colorMalos;
		garrison setVariable [_ciudad,[],true];
		sleep 5;
		[] call A3A_fnc_tierCheck;
		};
	} forEach ciudades;
	if (_popCSAT > (_popTotal / 3)) then {["destroyedCities",false,true] remoteExec ["BIS_fnc_endMission"]};
	if ((_popFIA > _popAAF) and ({lados getVariable [_x,sideUnknown] == buenos} count aeropuertos == count aeropuertos)) then {["end1",true,true,true,true] remoteExec ["BIS_fnc_endMission",0]};
	/*
	{
	_fabrica = _x;
	if (lados getVariable [_fabrica,sideUnknown] == buenos) then
		{
		if (not(_fabrica in destroyedCities)) then {_bonusFIA = _bonusFIA + 0.25};
		};
	} forEach fabricas;
	*/
	{
	_recurso = _x;
	if (lados getVariable [_recurso,sideUnknown] == buenos) then
		{
		if (not(_recurso in destroyedCities)) then {_recAddSDK = _recAddSDK + (300 * _bonusFIA)};
		};
	} forEach recursos;
	_hrAddBLUFOR = (round _hrAddBLUFOR);
	_recAddSDK = (round _recAddSDK);

	_texto = format ["<t size='0.6' color='#C1C0BB'>Taxes Income.<br/> <t size='0.5' color='#C1C0BB'><br/>Manpower: +%1<br/>Money: +%2 €",_hrAddBLUFOR,_recAddSDK];
	[] call A3A_fnc_FIAradio;
	//_updated = false;
	_updated = [] call A3A_fnc_arsenalManage;
	if (_updated != "") then {_texto = format ["%1<br/>Arsenal Updated<br/><br/>%2",_texto,_updated]};
	[petros,"taxRep",_texto] remoteExec ["A3A_fnc_commsMP",[buenos,civilian]];
	_hrAddBLUFOR = _hrAddBLUFOR + (server getVariable "hr");
	_recAddSDK = _recAddSDK + (server getVariable "resourcesFIA");
	server setVariable ["hr",_hrAddBLUFOR,true];
	server setVariable ["resourcesFIA",_recAddSDK,true];
	bombRuns = bombRuns + (({lados getVariable [_x,sideUnknown] == buenos} count aeropuertos) * 0.25);
	[petros,"taxRep",_texto] remoteExec ["A3A_fnc_commsMP",[buenos,civilian]];
	[] call A3A_fnc_economicsAI;
	if (isMultiplayer) then
		{
		[] spawn A3A_fnc_assigntheBoss;
		difficultyCoef = floor ((({side group _x == buenos} count playableUnits) - ({side group _x != buenos} count playableUnits)) / 5);
		publicVariable "difficultyCoef";
		};
	if ((!bigAttackInProgress) and (random 100 < 50)) then {[] call A3A_fnc_missionRequestAUTO};
	[[],"A3A_fnc_reinforcementsAI"] call A3A_fnc_scheduler;
	{
	_veh = _x;
	if ((_veh isKindOf "StaticWeapon") and ({isPlayer _x} count crew _veh == 0) and (alive _veh)) then
		{
		_veh setDamage 0;
		[_veh,1] remoteExec ["setVehicleAmmoDef",_veh];
		};
	} forEach vehicles;
	cuentaCA = cuentaCA - 600;
	if (cuentaCA < 0) then {cuentaCA = 0};
	publicVariable "cuentaCA";
	if ((cuentaCA == 0)/* and (diag_fps > minimoFPS)*/) then
		{
		[1200] remoteExec ["A3A_fnc_timingCA",2];
		if (!bigAttackInProgress) then
			{
			_script = [] spawn A3A_fnc_ataqueAAF;
			waitUntil {sleep 5; scriptDone _script};
			};
		};
	sleep 3;
	if ((count antenasMuertas > 0) and (not(["REP"] call BIS_fnc_taskExists))) then
		{
		_posibles = [];
		{
		_marcador = [marcadores, _x] call BIS_fnc_nearestPosition;
		if ((lados getVariable [_marcador,sideUnknown] == malos) and (spawner getVariable _marcador == 2)) exitWith
			{
			_posibles pushBack [_marcador,_x];
			};
		} forEach antenasMuertas;
		if (count _posibles > 0) then
			{
			_posible = selectRandom _posibles;
			[[_posible select 0,_posible select 1],"REP_Antena"] call A3A_fnc_scheduler;
			};
		}
	else
		{
		_cambiado = false;
		{
		_chance = 5;
		if ((_x in recursos) and (lados getVariable [_x,sideUnknown] == muyMalos)) then {_chace = 20};
		if (random 100 < _chance) then
			{
			_cambiado = true;
			destroyedCities = destroyedCities - [_x];
			_nombre = [_x] call A3A_fnc_localizar;
			["TaskSucceeded", ["", format ["%1 Rebuilt",_nombre]]] remoteExec ["BIS_fnc_showNotification",[buenos,civilian]];
			sleep 2;
			};
		} forEach (destroyedCities - ciudades) select {lados getVariable [_x,sideUnknown] != buenos};
		if (_cambiado) then {publicVariable "destroyedCities"};
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
								_grupo = group _x;
								deleteVehicle _x;
								if ({alive _x} count units _grupo == 0) then {deleteGroup _grupo};
								};
							};
						};
					};
				};
			};
		} forEach allUnits;
		if (autoSave) then
			{
			_cuentaSave = _cuentaSave - 600;
			if (_cuentaSave <= 0) then
				{
				_cuentaSave = 3600;
				_nul = [] execVM "statSave\saveLoop.sqf";
				};
			};
		};

	sleep 4;
	};