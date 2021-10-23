// TODO UI-update: get rid of canBuild checks and use canBuild instead
if (!(isNil "placingVehicle") && {placingVehicle}) exitWith {["Build Info", "You can't build while placing something."] call A3A_fnc_customHint;};
if (player != player getVariable ["owner",objNull]) exitWith {["Build Info", "You cannot construct anything while controlling AI."] call A3A_fnc_customHint;};

build_engineerSelected = objNull; // TODO: This needs to be changed to get params from the build menu

private _engineers = (units group player) select {_x getUnitTrait "engineer"};
private _playerIsEngineer = false;
private _otherPlayerEngineers = [];
private _aiEngineers = [];

private _abortMessage = "";

{
	if (_x getUnitTrait "engineer") then {
		if (isPlayer _x) then {
			if (player == _x) then {
				_playerIsEngineer = true;
			} else {
				_otherPlayerEngineers pushBack _x;
			};
		} else {
			//AI Engineer
			_aiEngineers pushBack _x;
		};
	};
} forEach units group player;

private _engineerIsBusy = {
	private _engineer = param [0, objNull];
	((_engineer getVariable ["helping",false])
	or (_engineer getVariable ["rearming",false])
	or (_engineer getVariable ["constructing",false]));
};

//Check if the player can build
if (_playerIsEngineer) then {
	if ([player] call A3A_fnc_canFight && !([player] call _engineerIsBusy)) then {
		build_engineerSelected = player;
	} else {
		_abortMessage = _abortMessage + "You are an engineer, but not in a state to build: you may be unconscious or undercover.<br/>";
	};
} else {
	_abortMessage =	_abortMessage + "You are not an engineer.<br/>";
};

//Check if an engineer can build.
if (isNull build_engineerSelected && count _otherPlayerEngineers > 0) then {
	build_engineerSelected = _otherPlayerEngineers select 0;
	_abortMessage = _abortMessage + "There is a human engineer in your squad. Ask them to build.<br/>";
};

if (isNull build_engineerSelected) then {
	if (count _aiEngineers > 0 && player != leader player) exitWith {
		_abortMessage =	_abortMessage + "Only squad leaders can order AI to build.";
	};

	{
		if ([_x] call A3A_fnc_canFight && !([_x] call _engineerIsBusy)) exitWith {
			build_engineerSelected = _x;
			_abortMessage = _abortMessage + format ["Ordering %1 to build.", _x];
		};
	} forEach _aiEngineers;

	if (isNull build_engineerSelected) exitWith {
		_abortMessage =	_abortMessage + "You have no available engineers in your squad. They may be unconscious or busy.";
	};
};

if (isNull build_engineerSelected ||
   ((player != build_engineerSelected) and (isPlayer build_engineerSelected))) exitWith
{
	["Build Info", _abortMessage] call A3A_fnc_customHint;
};

// Build type needs to be set for some other things to work, haven't looked into exactly what yet. May change in the future
build_type = nil;
private _className = _this select 0;
build_time = 60;
build_cost = 0;
private _playerDir = getDir player;
private _playerPosition = position player;

// TODO UI-update: get these from initBuildableObjects:
switch (_className) do
{
    case ("Land_GarbageWashingMachine_F"):
    {
        build_type = "ST";
        build_time = 60;
        build_cost = 0;
    };
    case ("Land_JunkPile_F"):
    {
        build_type = "ST";
        build_time = 60;
        build_cost = 0;
    };
    case ("Land_Barricade_01_4m_F"):
    {
        build_type = "ST";
        build_time = 60;
        build_cost = 0;
    };
    case ("Land_WoodPile_F"):
    {
        build_type = "ST";
        build_time = 60;
        build_cost = 0;
    };
    case ("CraterLong_small"):
    {
        build_type = "ST";
        build_time = 60;
        build_cost = 0;
    };
    case ("Land_Barricade_01_10m_F"):
    {
        build_type = "MT";
        build_time = 60;
        build_cost = 0;
    };
    case ("Land_WoodPile_large_F"):
    {
        build_type = "MT";
        build_time = 60;
        build_cost = 0;
    };
    case ("Land_BagFence_01_long_green_F"):
    {
        build_type = "MT";
        build_time = 60;
        build_cost = 0;
    };
    case ("Land_SandbagBarricade_01_half_F"):
    {
        build_type = "MT";
        build_time = 60;
        build_cost = 0;
    };
    case ("Land_Tyres_F"):
    {
        build_type = "RB";
        build_time = 100;
        build_cost = 0;
    };
    case ("Land_TimberPile_01_F"):
    {
        build_type = "RB";
        build_time = 100;
        build_cost = 0;
    };
    case ("Land_BagBunker_01_small_green_F"):
    {
        build_type = "SB";
        build_time = 60;
        build_cost = 100;
    };
    case ("Land_PillboxBunker_01_big_F"):
    {
        build_type = "SB";
        build_time = 120;
        build_cost = 300;
    };
};

private _leave = false;
private _textX = "";
if ((build_type == "SB") or (build_type == "CB")) then
	{
	if (build_type == "SB") then {_playerDir = _playerDir + 180};
	_resourcesFIA = if (!isMultiPlayer) then {server getVariable "resourcesFIA"} else {player getVariable "moneyX"};
	if (build_cost > _resourcesFIA) then
		{
		_leave = true;
		_textX = format ["You do not have enough money for this construction (%1 € needed).",build_cost]
		}
	else
		{
		_sites = markersX select {sidesX getVariable [_x,sideUnknown] == teamPlayer};
		build_nearestFriendlyMarker = [_sites,_playerPosition] call BIS_fnc_nearestPosition;
		if (!(_playerPosition inArea build_nearestFriendlyMarker)) then
			{
			_leave = true;
			_textX = "You cannot build a bunker outside a controlled zone.";
			build_nearestFriendlyMarker = nil;
			};
		};
	};

if (_leave) exitWith {["Build Info", format ["%1",_textX]] call A3A_fnc_customHint;};

//START PLACEMENT HERE
[_className, "BUILDSTRUCTURE"] call HR_GRG_fnc_confirmPlacement;
