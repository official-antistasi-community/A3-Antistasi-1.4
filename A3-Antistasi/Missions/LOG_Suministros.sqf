if (!isServer and hasInterface) exitWith{};
private ["_marcador","_dificil","_salir","_contacto","_grpContacto","_tsk","_posHQ","_ciudades","_ciudad","_tam","_posicion","_posCasa","_nombreDest","_tiempoLim","_fechaLim","_fechaLimNum","_pos","_camion","_cuenta", "_emptybox"];

_debugMode = 2;

[format ["LOG_Suministros.sqf: Running script with taskTerminateLogBox %1", missionNamespace getVariable ["taskTerminateLogBox", false]], _debugMode] call A3A_fnc_debug;

try {
	_marcador = _this select 0;
	_dificil = if (random 10 < tierWar) then {true} else {false};
	_salir = false;
	_contacto = objNull;
	_grpContacto = grpNull;
	_tsk = "";
	_posicion = getMarkerPos _marcador;

	_tiempolim = if (_dificil) then {30} else {60};
	if (hayIFA) then {_tiempolim = _tiempolim * 2};
	_fechalim = [date select 0, date select 1, date select 2, date select 3, (date select 4) + _tiempolim];
	_fechalimnum = dateToNumber _fechalim;
	_nombredest = [_marcador] call A3A_fnc_localizar;
	_taskDescription = format ["%1 population is in need of supplies. We may improve our relationship with that city if we are the ones who provide them. I reserved a transport truck with supplies near our HQ. Drive the transport truck to %1 city center. Hold it there for 2 minutes and it's done. Do this before %2:%3. You may allways sell those supplies here, that money can be welcome. Just sell the truck and job is done",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4];

	[[buenos,civilian],"LOG",[_taskDescription,"City Supplies",_marcador],_posicion,false,0,true,"Heal",true] call BIS_fnc_taskCreate;
	misiones pushBack ["LOG","CREATED"]; publicVariable "misiones";
	_pos = (getMarkerPos respawnBuenos) findEmptyPosition [1,50,"C_Van_01_box_F"];

	//Creating the box
	_camion = "Land_PaperBox_01_open_boxes_F" createVehicle _pos;
	missionNamespace setVariable ["LOG_BOX", _camion, true];
	_camion allowDamage false;
	_camion call jn_fnc_logistics_addAction;
	_camion addAction ["Delivery infos",
		{
			_text = format ["Deliver this box to %1, unload it to start distributing to people",(_this select 0) getVariable "destino"]; //This need a rework
			_text remoteExecCall ["hint",_this select 2];	//Thisi need a rework
		},
		nil,
		0,
		false,
		true,
		"",
		"(isPlayer _this) and (_this == _this getVariable ['owner',objNull])"
	];
	[_camion] call A3A_fnc_AIVEHinit;
	//{_x reveal _camion} forEach (allPlayers - (entities "HeadlessClient_F"));
	_camion setVariable ["destino",_nombredest,true];

	[_camion,"Supply Box"] spawn A3A_fnc_inmuneConvoy;

	[format ["LOG_Suministros.sqf: waiting for cargo to be unloaded at the target or taskTerminateLogBox: %1 == true", missionNamespace getVariable ["taskTerminateLogBox", false]], _debugMode] call A3A_fnc_debug;
	waitUntil {
		sleep 1;
		(missionNamespace getVariable ["taskTerminateLogBox", false]) or
		(
			(dateToNumber date > _fechalimnum) or ((_camion distance _posicion < 40) and (isNull attachedTo _camion)) or (isNull _camion)
		)
	};
	[format ["LOG_Suministros.sqf: loaded cargo or taskTerminateLogBox%1 == true", missionNamespace getVariable ["taskTerminateLogBox", false]], _debugMode] call A3A_fnc_debug;
	if !(missionNamespace getVariable ["taskTerminateLogBox", false]) then {
		_bonus = if (_dificil) then {2} else {1};
		// Fail if time elapsed or box is destroyed
		if ((dateToNumber date > _fechalimnum) or (isNull _camion)) then
			{
				["LOG_Suministros.sqf: failed because box is destroyed or time elapsed!", _debugMode] call A3A_fnc_debug;
				["LOG",[_taskDescription,"City Supplies",_marcador],_posicion,"FAILED","Heal"] call A3A_fnc_taskUpdate;
				[5*_bonus,-5*_bonus,_posicion] remoteExec ["A3A_fnc_citySupportChange",2];
				[-10*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
			}
		// Normal path
		else
			{
				["LOG_Suministros.sqf: unloaded cargo", _debugMode] call A3A_fnc_debug;
				_cuenta = 120*_bonus;//120
				// Spawn/hook up patrol
				[[_posicion,malos,"",false],"A3A_fnc_patrolCA"] remoteExec ["A3A_fnc_scheduler",2];
				// Show bad guys supplies are being deployed
				["TaskFailed", ["", format ["%2 deploying supplies in %1",_nombredest,nameBuenos]]] remoteExec ["BIS_fnc_showNotification",malos];
				{_amigo = _x;
					if (captive _amigo) then
						{
						[_amigo,false] remoteExec ["setCaptive",0,_amigo];
						_amigo setCaptive false;
						};
					{
					if ((side _x == malos) and (_x distance _posicion < distanciaSPWN)) then
						{
							if (_x distance _posicion < 300) then {_x doMove _posicion} else {_x reveal [_amigo,4]};
						};
						if ((side _x == civilian) and (_x distance _posicion < 300) and (vehicle _x == _x)) then {_x doMove position _camion};
					} forEach allUnits;
				} forEach ([300,0,_camion,"GREENFORSpawn"] call A3A_fnc_distanceUnits);
				
				["LOG_Suministros.sqf: entering distance loop", _debugMode] call A3A_fnc_debug;
				while {
						((_cuenta > 0)/* or (_camion distance _posicion < 40)*/ and (dateToNumber date < _fechalimnum) and !(isNull _camion))
					} do
					// Cargo unloaded loop
					{
						// ["LOG_Suministros.sqf: distance loop", _debugMode] call A3A_fnc_debug;
						// Countdown loop
						while {(_cuenta > 0) and (_camion distance _posicion < 40) and ({[_x] call A3A_fnc_canFight} count ([80,0,_camion,"GREENFORSpawn"] call A3A_fnc_distanceUnits) == count ([80,0,_camion,"GREENFORSpawn"] call A3A_fnc_distanceUnits)) and ({(side _x == malos) and (_x distance _camion < 50)} count allUnits == 0) and (dateToNumber date < _fechalimnum) and (isNull attachedTo _camion)} do
							{
								// ["LOG_Suministros.sqf: countdown loop", _debugMode] call A3A_fnc_debug;
								// If cancelled break out
								if (missionNamespace getVariable ["taskTerminateLogBox", false]) exitWith {};
								_formato = format ["%1", _cuenta];
								{if (isPlayer _x) then {[petros,"countdown",_formato] remoteExec ["A3A_fnc_commsMP",_x]}} forEach ([80,0,_camion,"GREENFORSpawn"] call A3A_fnc_distanceUnits);
								sleep 1;
								_cuenta = _cuenta - 1;
							};
						// If cancelled, break out
						if (missionNamespace getVariable ["taskTerminateLogBox", false]) exitWith {};
						
						// reset if-statement and loop
						if (_cuenta > 0) then
							{
							["LOG_Suministros.sqf: resetting distance", _debugMode] call A3A_fnc_debug;
							_cuenta = 120*_bonus;//120
							if (((_camion distance _posicion > 40) or (not([80,1,_camion,"GREENFORSpawn"] call A3A_fnc_distanceUnits)) or ({(side _x == malos) and (_x distance _camion < 50)} count allUnits != 0)) and (alive _camion)) then {{[petros,"hint","Don't get the truck far from the city center, and stay close to it, and clean all BLUFOR presence in the surroundings or count will restart"] remoteExec ["A3A_fnc_commsMP",_x]} forEach ([100,0,_camion,"GREENFORSpawn"] call A3A_fnc_distanceUnits)};
								
								waitUntil {
									sleep 5; 
									["LOG_Suministros.sqf: resetting distance waitUntil", _debugMode] call A3A_fnc_debug; 
									// if !(((_camion distance _posicion < 40) and ([80,1,_camion,"GREENFORSpawn"] call A3A_fnc_distanceUnits) and ({(side _x == malos) and (_x distance _camion < 50)} count allUnits == 0)) or (dateToNumber date > _fechalimnum) or (isNull _camion)) then {
									// 	["distance calculation is false", _debugMode] call A3A_fnc_debug;
									// };
									if (missionNamespace getVariable ["taskTerminateLogBox", false]) exitWith { true };
									((_camion distance _posicion < 40) and ([80,1,_camion,"GREENFORSpawn"] call A3A_fnc_distanceUnits) and ({(side _x == malos) and (_x distance _camion < 50)} count allUnits == 0)) or (dateToNumber date > _fechalimnum) or (isNull _camion)
								};
							};
						if (_cuenta < 1) exitWith {};
					};
				// Mission status changed. Cleanup after!
				[format ["LOG_Suministros.sqf: task finished with taskTerminateLogBox %1", missionNamespace getVariable ["taskTerminateLogBox", false]], _debugMode] call A3A_fnc_debug;
				if !(missionNamespace getVariable ["taskTerminateLogBox", false]) then {
					if ((dateToNumber date < _fechalimnum) and !(isNull _camion)) then
						{
							[petros,"hint","Supplies Delivered"] remoteExec ["A3A_fnc_commsMP",[buenos,civilian]];
							["LOG",[_taskDescription,"City Supplies",_marcador],_posicion,"SUCCEEDED","Heal"] call A3A_fnc_taskUpdate;
							// give score (money??) to nearby players
							{if (_x distance _posicion < 500) then {[10*_bonus,_x] call A3A_fnc_playerScoreAdd}} forEach (allPlayers - (entities "HeadlessClient_F"));
							[5*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
							if (!isMultiplayer) then {_bonus = _bonus + ((20-skillFIA)*0.1)};
							// Change support and aggression
							[-1*(20-skillFIA),15*_bonus,_marcador] remoteExec ["A3A_fnc_citySupportChange",2];
							[-3,0] remoteExec ["A3A_fnc_prestige",2];
						}
					else
						{
							["LOG",[_taskDescription,"City Supplies",_marcador],_posicion,"FAILED","Heal"] call A3A_fnc_taskUpdate;
							[5*_bonus,-5*_bonus,_posicion] remoteExec ["A3A_fnc_citySupportChange",2];
							[-10*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
						};
				} else {
					["LOG",[_taskDescription,"City Supplies",_marcador],_posicion,"CANCELLED","Heal"] call A3A_fnc_taskUpdate;
				};
			};
		if !(isNil "_camion") then {
			_ecpos = getpos _camion;
			deleteVehicle _camion;
			_emptybox = "Land_PaperBox_01_open_empty_F" createVehicle _ecpos;
		};
	} else {
		[format ["LOG_Suministros.sqf: taskTerminateLogBox %1: skipped code after loading cargo waitUntil", taskTerminateLogBox], _debugMode] call A3A_fnc_debug;
	};
	
	[format ["LOG_Suministros.sqf: destroying task with taskTerminateLogBox %1", taskTerminateLogBox], _debugMode] call A3A_fnc_debug;
	if (["LOG"] call BIS_fnc_taskExists) then {
		_nul = [0,"LOG"] spawn A3A_fnc_borrarTask; //timeout was 1200
	};
	// Not sure what this line entails. Don't delete if still in base? Doesn't make sense..
	waitUntil {
		sleep 1; 
		(missionNamespace getVariable ["taskTerminateLogBox", false] ) or 
		(
			((not([distanciaSPWN,1,_camion,"GREENFORSpawn"] call A3A_fnc_distanceUnits)) or (_camion distance (getMarkerPos respawnBuenos) < 60))
		)
	};
	if !(isNil "_camion") then {
		deleteVehicle _camion;
	};
	if !(isNil "_emptybox") then {
		deleteVehicle _emptybox;
	};
	[format ["LOG_Suministros.sqf: setting taskTerminateLogBox %1 to false", missionNamespace getVariable ["taskTerminateLogBox", false]], _debugMode] call A3A_fnc_debug;
	missionNamespace setVariable ["taskTerminateLogBox", false, true];
} catch {
	[format ["LOG_Suministros.sqf:  <%1>", _exception], _debugMode] call A3A_fnc_debug;
	missionNamespace setVariable ["taskTerminateLogBox", false, true];
};