/*
file: TFAR_autofreq.sqf
by DaVIdoSS
some TFAR improvements for Barbolani's Antistasi
fired from init.sqf by
0 = [true] execVM "Scripts\improvements\TFAR_autofreq.sqf";
parameters:
0: BOOLEAN
return VOID
*/
params [["_autoFreq",false,[true]]];

if !(isClass (configFile >> "CfgPatches" >> "task_force_radio")) exitWith {}; 
private _arrayoffreq = ["TfarUFreqW","TfarUFreqE","TfarUFreqI","TfarVFreqW","TfarVFreqE","TfarVFreqI"];

if (isServer) then {
	TfarUFreqW = floor random [30,(floor random [200,230,270]),512];
	TfarUFreqE = floor random [30,(floor random [200,230,270]),512];
	TfarUFreqI = floor random [30,(floor random [200,230,270]),512];
	TfarVFreqW = floor random [30,(floor random [40,57,76]),87];
	TfarVFreqE = floor random [30,(floor random [40,57,76]),87];
	TfarVFreqI = floor random [30,(floor random [40,57,76]),87];
	{publicVariable _x} forEach _arrayoffreq;
};

if !(hasInterface) exitWith {};

waitUntil {sleep 1; ({!isNil _x} count _arrayoffreq) isEqualTo (count _arrayoffreq)};
(["SoldierWB","SoldierEB","SoldierGB"] select {player isKindOf _x}) params [["_side","",[""]]];

TFAR_autoFreq = _autoFreq;

private _fnc_addEH = {

	swradiofreq = param [0, 30, [0]];
	lrradiofreq = param [1, 50, [0]];
	radiocode = param [2, "", [""]];
	vehside   = param [3, "", [""]];
	
	player addEventHandler ["Respawn", {
		0 = [] spawn {
			if (TFAR_autoFreq) then {
				waitUntil {sleep 1; call TFAR_fnc_haveSWRadio || !alive player};
				if (!alive player) exitWith {};
				0 = [(call TFAR_fnc_activeSwRadio), 0] call TFAR_fnc_setSwChannel;
				0 = [(call TFAR_fnc_activeSwRadio),str swradiofreq] call TFAR_fnc_setSwFrequency;
			};
			if !((player call TFAR_fnc_backpackLR) isEqualTo []) then {
				waitUntil {sleep 1; call TFAR_fnc_haveLRRadio || !alive player};
				if (!alive player) exitWith {};
				0 = [(call TFAR_fnc_activeLrRadio) select 0, (call TFAR_fnc_activeLrRadio) select 1, radiocode] call TFAR_fnc_setLrRadioCode;
				if (TFAR_autoFreq) then {
					0 = [(call TFAR_fnc_activeLrRadio) select 0, (call TFAR_fnc_activeLrRadio) select 1, 0] call TFAR_fnc_setLrChannel;
					0 = [(call TFAR_fnc_activeLrRadio) select 0, (call TFAR_fnc_activeLrRadio) select 1, str lrradiofreq] call TFAR_fnc_setLrFrequency;
				};
			};
		};
	}];

	[missionNamespace, "arsenalClosed", {
		0 = [] spawn { 
			if (TFAR_autoFreq) then {
				waitUntil {sleep 1; call TFAR_fnc_haveSWRadio || !alive player};
				if (!alive player) exitWith {};
				0 = [(call TFAR_fnc_activeSwRadio), 0] call TFAR_fnc_setSwChannel;
				0 = [(call TFAR_fnc_activeSwRadio),str swradiofreq] call TFAR_fnc_setSwFrequency;
			};
			if !((player call TFAR_fnc_backpackLR) isEqualTo []) then {
				waitUntil {sleep 1; call TFAR_fnc_haveLRRadio || !alive player};
				if (!alive player) exitWith {};
				0 = [(call TFAR_fnc_activeLrRadio) select 0, (call TFAR_fnc_activeLrRadio) select 1, radiocode] call TFAR_fnc_setLrRadioCode;
				if (TFAR_autoFreq) then {
					0 = [(call TFAR_fnc_activeLrRadio) select 0, (call TFAR_fnc_activeLrRadio) select 1, 0] call TFAR_fnc_setLrChannel;
					0 = [(call TFAR_fnc_activeLrRadio) select 0, (call TFAR_fnc_activeLrRadio) select 1, str lrradiofreq] call TFAR_fnc_setLrFrequency;
				};
			};
		};
	}] call BIS_fnc_addScriptedEventHandler;
			
	player addEventHandler ["InventoryClosed",{
		0 = [] spawn { 
			if (TFAR_autoFreq) then {
				waitUntil {sleep 1; call TFAR_fnc_haveSWRadio || !alive player};
				if (!alive player) exitWith {};
				0 = [(call TFAR_fnc_activeSwRadio), 0] call TFAR_fnc_setSwChannel;
				0 = [(call TFAR_fnc_activeSwRadio),str swradiofreq] call TFAR_fnc_setSwFrequency;
			};
			if !((player call TFAR_fnc_backpackLR) isEqualTo []) then {
				waitUntil {sleep 1; call TFAR_fnc_haveLRRadio || !alive player};
				if (!alive player) exitWith {};
				0 = [(call TFAR_fnc_activeLrRadio) select 0, (call TFAR_fnc_activeLrRadio) select 1, radiocode] call TFAR_fnc_setLrRadioCode;
				if (TFAR_autoFreq) then {
					0 = [(call TFAR_fnc_activeLrRadio) select 0, (call TFAR_fnc_activeLrRadio) select 1, 0] call TFAR_fnc_setLrChannel;
					0 = [(call TFAR_fnc_activeLrRadio) select 0, (call TFAR_fnc_activeLrRadio) select 1, str lrradiofreq] call TFAR_fnc_setLrFrequency;
				};
			};
		};
	}];

	player addEventHandler ["GetInMan", {
		private _vehicle = _this select 2;
		if !(_vehicle call TFAR_fnc_hasVehicleRadio) then {_vehicle setVariable ["tf_hasRadio", true, true]};
		_vehicle setVariable ["tf_side", vehside, true];
		0 = [] spawn { 
			waitUntil {sleep 1; call TFAR_fnc_haveLRRadio || !alive player};
			if (!alive player) exitWith {};
			0 = [(call TFAR_fnc_activeLrRadio) select 0, (call TFAR_fnc_activeLrRadio) select 1, radiocode] call TFAR_fnc_setLrRadioCode;
			if (TFAR_autoFreq) then {
				0 = [(call TFAR_fnc_activeLrRadio) select 0, (call TFAR_fnc_activeLrRadio) select 1, 0] call TFAR_fnc_setLrChannel;
				0 = [(call TFAR_fnc_activeLrRadio) select 0, (call TFAR_fnc_activeLrRadio) select 1, str lrradiofreq] call TFAR_fnc_setLrFrequency;
			};
		};	
	}];
};

switch _side do {

	case "SoldierWB": {
		0 = [TfarUFreqW,TfarVFreqW,"_bluefor","west"] spawn _fnc_addEH;
	};
	case "SoldierEB": {
		0 = [TfarUFreqE,TfarVFreqE,"_opfor","east"] spawn _fnc_addEH;
	};
	case "SoldierGB": {
		0 = [TfarUFreqI,TfarVFreqI,"_independent","independent"] spawn _fnc_addEH;
	};
	default {};
};