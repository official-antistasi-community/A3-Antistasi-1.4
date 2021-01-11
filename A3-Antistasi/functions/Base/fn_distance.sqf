/*
Author: Barbolani, Bob-Murphy, ...
Description

Arguments:
none

Return Value:
none

Scope: Server
Environment: Scheduled
Public: Yes
Dependencies: Occupants, Invaders, teamPlayer, markersX, forcedSpawn, spawner

Example:
[] spawn A3A_fnc_distance;


                            ==(W{==========-      /===-
                              ||   .--.          /===-_---~~~~~~~~~------____
                              | \_,|**|,__      |===-~___                _,-' `
                 -==\\        `\ ' `--'   ),    `//~\\   ~~~~`---.___.-~~
             ______-==|        /`\_. .__/\ \    | |  \\           _-~`
       __--~~~  ,-/-==\\      (   | .  |~~~~|   | |   `\        ,'
    _-~       /'    |  \\     )__/==0==-\<>/   / /      \      /
  .'        /       |   \\      /~\___/~~\/  /' /        \   /'
 /  ____  /         |    \`\.__/-~~   \  |_/'  /          \/'
/-'~    ~~~~~---__  |     ~-/~         ( )   /'        _--~`
                  \_|      /        _) | ;  ),   __--~~
                    '~~--_/      _-~/- |/ \   '-~ \
                   {\__--_/}    / \\_>-|)<__\      \
                   /'   (_/  _-~  | |__>--<__|      |
                  |   _/) )-~     | |__>--<__|      |
                  / /~ ,_/       / /__>---<__/      |
                 o-o _//        /-~_>---<__-~      /
                 (^(~          /~_>---<__-      _-~
                ,/|           /__>--<__/     _-~
             ,//('(          |__>--<__|     /                  .----_
            ( ( '))          |__>--<__|    |                 /' _---_~\
         `-)) )) (           |__>--<__|    |               /'  /     ~\`\
        ,/,'//( (             \__>--<__\    \            /'  //        ||
      ,( ( ((, ))              ~-__>--<_~-_  ~--____---~' _/'/        /'
    `~/  )` ) ,/|                 ~-_~>--<_/-__       __-~ _/
  ._-~//( )/ )) `                    ~~-'_/_/ /~~~~~~~__--~
   ;'( ')/ ,)(                              ~~~~~~~~~~
  ' ') '( (/
    '   '  `

/* -------------------------------------------------------------------------- */
/*                                   defines                                  */
/* -------------------------------------------------------------------------- */

// the spawn units array will update ones at this count cycles
#define COUNT_CYCLES 6
#define NOT_EXIST -1
#define ENABLED 0
#define DISABLED 1
#define DESPAWN 2

/* -------------------------------------------------------------------------- */
/*                                 procedures                                 */
/* -------------------------------------------------------------------------- */

private _processOccupantMarker = {

	switch (spawner getVariable _marker)
	do
	{
		case ENABLED:
		{
			// if somebody green is inside distanceSPWN
			// or somebody opfor is inside distanceSPWN2
			// or somebody blufor is Player and is inside distanceSPWN2
			// or this marker is forced spawn than exit (marker still ENABLED)
			if (_greenfor findIf { _x distance2D _position < distanceSPWN } != NOT_EXIST || {
				_opfor findIf { _x distance2D _position < distanceSPWN2 } != NOT_EXIST || {
				_blufor findIf { isPlayer _x && { _x distance2D _position < distanceSPWN2 }} != NOT_EXIST || {
				_marker in forcedSpawn }}}) exitWith {};

			// DISABLE this marker
			spawner setVariable [_marker, DISABLED, true];

			// disable simulation for all marker units
			private _disableSimulation =
			[
				{ _x enableSimulation false; },
				{ _x enableSimulationGlobal false; }
			] select isMultiplayer;

			{
				if (_x getVariable ["markerX", ""] == _marker && {
					vehicle _x == _x }) then _disableSimulation;
			} forEach allUnits;
		};

		case DISABLED:
		{
			// if somebody green is inside distanceSPWN
			// or somebody opfor is inside distanceSPWN2
			// or this marker is forced to spawn than ENABLE marker
			if (_greenfor findIf { _x distance2D _position < distanceSPWN } != NOT_EXIST || {
				_opfor findIf { _x distance2D _position < distanceSPWN2 } != NOT_EXIST || {
				_marker in forcedSpawn }})
			then
			{
				// ENABLE this marker
				spawner setVariable [_marker, ENABLED, true];

				// enable simulation for all marker units
				private _enableSimulation =
				[
					{ _x enableSimulation true; },
					{ _x enableSimulationGlobal true; }
				] select isMultiplayer;

				{
					if (_x getVariable ["markerX", ""] == _marker && {
						vehicle _x == _x }) then _enableSimulation;
				} forEach allunits;
			}
			else
			{
				// if somebody green is inside distanceSPWN1
				// or somebody opfor is inside distanceSPWN than exit (marker still DISABLED)
				if (_greenfor findIf { _x distance2D _position < distanceSPWN1 } != NOT_EXIST || {
					_opfor findIf { _x distance2D _position < distanceSPWN } != NOT_EXIST })
				exitWith {};

				// DESPAWN this marker
				spawner setVariable [_marker, DESPAWN, true];
			};
		};

		case DESPAWN:
		{
			// if nobody green is inside distanceSPWN
			// and nobody opfor is inside distanceSPWN2
			// and marker is not forced to spawn than exit (marker still DESPAWN)
			if (_greenfor findIf { _x distance2D _position < distanceSPWN } == NOT_EXIST && {
				_opfor findIf { _x distance2D _position < distanceSPWN2 } == NOT_EXIST && {
				!(_marker in forcedSpawn) }}) exitWith {};

			// ENABLE this marker
			spawner setVariable [_marker, ENABLED, true];

			switch (true)
			do
			{
				case (_marker in citiesX):
				{
					// if somebody green is inside distanceSPWN
					// or somebody blufor is player and inside distanceSPWN2
					// or marker is forced to spawn than ...
					if (_greenfor findIf { _x distance2D _position < distanceSPWN } != NOT_EXIST || {
						_blufor findIf { isPlayer _x && { _x distance2D _position < distanceSPWN2 } } != NOT_EXIST || {
						_marker in forcedSpawn }})
					then
					{
						[[_marker], "A3A_fnc_createAICities"] call A3A_fnc_scheduler;
					};

					// if marker is not in destroyedSites
					// and somebody player is inside distanceSPWN or marker is forced to spawn than ...
					if (!(_marker in destroyedSites) && {
						allUnits findIf { isplayer _x && { _x distance2D _position < distanceSPWN } } != NOT_EXIST || {
						_marker in forcedSpawn }})
					then
					{
						[[_marker], "A3A_fnc_createCIV"] call A3A_fnc_scheduler;
					};
				};

				case (_marker in controlsX):
				{
					[[_marker], "A3A_fnc_createAIcontrols"] call A3A_fnc_scheduler;
				};

				case (_marker in airportsX):
				{
					[[_marker], "A3A_fnc_createAIAirplane"] call A3A_fnc_scheduler;
				};

				case (_marker in resourcesX);
				case (_marker in factories):
				{
					[[_marker], "A3A_fnc_createAIresources"] call A3A_fnc_scheduler;
				};

				case (_marker in outposts);
				case (_marker in seaports):
				{
					[[_marker], "A3A_fnc_createAIOutposts"] call A3A_fnc_scheduler;
				};
			};
		};
	};
};

private _processFIAMarker = {

	switch (spawner getVariable _marker)
	do
	{
		case ENABLED:
		{
			// if somebody blufor is inside distanceSPWN
			// or somebody opfor is inside distanceSPWN
			// or somebody green is control unit and is inside distanceSPWN2
			// or marker is forced to spawn than exit (marker still ENABLED)
			if (_blufor findIf { _x distance2D _position < distanceSPWN } != NOT_EXIST || {
				_opfor findIf { _x distance2D _position < distanceSPWN } != NOT_EXIST || {
				_greenfor findIf { _x getVariable ["owner", objNull] == _x && { _x distance2D _position
					< distanceSPWN2 }} != NOT_EXIST || {
				_marker in forcedSpawn }}}) exitWith {};

			// DISABLE marker
			spawner setVariable [_marker, DISABLED, true];

			// disable simulation for all marker units
			private _disableSimulation =
			[
				{ _x enableSimulation false; },
				{ _x enableSimulationGlobal false; }
			] select isMultiplayer;

			{
				if (_x getVariable ["markerX", ""] == _marker && {
					vehicle _x == _x }) then _disableSimulation;
			} forEach allUnits;
		};

		case DISABLED:
		{
			// if somebody blufor is inside distanceSPWN
			// or sombody opfor is inside distanceSPWN
			// or somebody green is player and is inside distanceSPWN2
			// or marker is forced spawn than ENABLE marker
			if (_blufor findIf { _x distance2D _position < distanceSPWN } != NOT_EXIST || {
				_opfor findIf { _x distance2D _position < distanceSPWN } != NOT_EXIST || {
				_greenfor findIf { _x getVariable ["owner", objNull] == _x && { _x distance2D _position
					< distanceSPWN2 }} != NOT_EXIST || {
				_marker in forcedSpawn }}})
			then
			{
				// ENABLE this marker
				spawner setVariable [_marker, ENABLED, true];

				// enable simulation for all marker units
				private _enableSimulation =
				[
					{ _x enableSimulation true; },
					{ _x enableSimulationGlobal true; }
				] select isMultiplayer;

				{
					if (_x getVariable ["markerX", ""] == _marker && {
						vehicle _x == _x }) then _enableSimulation;
				} forEach allunits;
			}
			else
			{
				// if sombody blufor is inside distanceSPWN1
				// or somebody opfor is inside distanceSPWN1
				// or somebody green is player and is inside distanceSPWN
				// then exit (marker still DISABLED)
				if (_blufor findIf { _x distance2D _position < distanceSPWN1 } != NOT_EXIST || {
					_opfor findIf { _x distance2D _position < distanceSPWN1 } != NOT_EXIST || {
					_greenfor findIf { _x getVariable ["owner", objNull] == _x
						&& { _x distance2D _position < distanceSPWN }} != NOT_EXIST }})
				exitWith {};

				// DESPAWN this marker
				spawner setVariable [_marker, DESPAWN, true];
			};
		};

		case DESPAWN:
		{
			// if nobody blufor is inside distanceSPWN
			// and nobody opfor is inside distanceSPWN
			// and nobody green player ia inside distanceSPWN2
			// and marker is not forced spawn then exit (marker still DESPAWN)
			if (_blufor findIf { _x distance2D _position < distanceSPWN } == NOT_EXIST && {
				_opfor findIf { _x distance2D _position < distanceSPWN } == NOT_EXIST && {
				_greenfor findIf { _x getVariable ["owner", objNull] == _x && { _x distance2D _position
					< distanceSPWN2 }} == NOT_EXIST && {
				!(_marker in forcedSpawn) }}}) exitWith {};

			// ENABLED this marker
			spawner setVariable [_marker, ENABLED, true];

			// run spawn procedures
			switch (true)
			do
			{
				case (_marker in citiesX):
				{
					// if marker not in destroy cites
					// and somebody player is inside distanceSPWN
					// or marker is forced spawn then spawn civs
					if (!(_marker in destroyedSites) && {
						allunits findIf { isPlayer _x && { _x distance2D _position
							< distanceSPWN }} != NOT_EXIST || {
						_marker in forcedSpawn }})
					then
					{
						[[_marker], "A3A_fnc_createCIV"] call A3A_fnc_scheduler;
					};
				};

				case (_marker in outpostsFIA):
				{
					[[_marker], "A3A_fnc_createFIAOutposts2"] call A3A_fnc_scheduler;
				};

				case !(_marker in controlsX):
				{
					[[_marker], "A3A_fnc_createSDKGarrisons"] call A3A_fnc_scheduler;
				};
			};
		};
	};
};

private _processInvaderMarker = {

	switch (spawner getVariable _marker)
	do
	{
		case ENABLED:
		{
			// if somebody green is inside distanceSPWN
			// or somebody opfor is inside distanceSPWN2
			// or somebody blufor is inside distanceSPWN2
			// or marker is forced spawn then exit (marker still ENABLED)
			if (_greenfor findIf { _x distance2D _position < distanceSPWN } != NOT_EXIST || {
				_opfor findIf { _x distance2D _position < distanceSPWN2 } != NOT_EXIST || {
				_blufor findif { _x distance2D _position < distanceSPWN2 } != NOT_EXIST || {
				_marker in forcedSpawn }}}) exitWith {};

			// DISABLE this marker
			spawner setVariable [_marker, DISABLED, true];

			// disable simulation for all marker units
			private _disableSimulation =
			[
				{ _x enableSimulation false; },
				{ _x enableSimulationGlobal false; }
			] select isMultiplayer;

			{
				if (_x getVariable ["markerX", ""] == _marker && {
					vehicle _x == _x }) then _disableSimulation;
			} forEach allUnits;
		};

		case DISABLED:
		{
			// if somebody green is inside distanceSPWN
			// or somebody bluefor is inside distanceSPWN2
			// or marker is forced spawn then ENABLED this marker
			if (_greenfor findIf { _x distance2D _position < distanceSPWN } != NOT_EXIST || {
				_blufor findIf { _x distance2D _position < distanceSPWN2 } != NOT_EXIST || {
				_marker in forcedSpawn }})
			then
			{
				// ENABLE this marker
				spawner setVariable [_marker, ENABLED, true];

				// enable simulation for all marker units
				private _enableSimulation =
				[
					{ _x enableSimulation true; },
					{ _x enableSimulationGlobal true; }
				] select isMultiplayer;

				{
					if (_x getVariable ["markerX", ""] == _marker && {
						vehicle _x == _x }) then _enableSimulation;
				} forEach allunits;
			}
			else
			{
				// if somebody green is inside distanceSPWN1
				// or somebody bluefor is inside distanceSPWN then exit (marker still DISABLED)
				if (_greenfor findIf { _x distance2D _position < distanceSPWN1 } != NOT_EXIST || {
					_blufor findIf { _x distance2D _position < distanceSPWN } != NOT_EXIST })
				exitWith {};

				// DESPAWN this marker
				spawner setVariable [_marker, DESPAWN, true];
			};
		};

		case DESPAWN:
		{
			// if nobody is inside distanceSPWN
			// and nobody is inside distanceSPWN2
			// and marker is not forced to spawn then exit (marker still DESPAWN)
			if (_greenfor findIf { _x distance2D _position < distanceSPWN } == NOT_EXIST && {
				_blufor findIf { _x distance2D _position < distanceSPWN2 } == NOT_EXIST && {
				!(_marker in forcedSpawn) }}) exitWith {};

			// ENABLE this marker
			spawner setVariable [_marker, ENABLED, true];


			switch (true)
			do
			{
				case (_marker in controlsX):
				{
					[[_marker], "A3A_fnc_createAIcontrols"] call A3A_fnc_scheduler;
				};

				case (_marker in airportsX):
				{
					[[_marker], "A3A_fnc_createAIAirplane"] call A3A_fnc_scheduler;
				};

				case (_marker in resourcesX);
				case (_marker in factories):
				{
					[[_marker], "A3A_fnc_createAIresources"] call A3A_fnc_scheduler;
				};

				case (_marker in outposts);
				case (_marker in seaports):
				{
					[[_marker], "A3A_fnc_createAIOutposts"] call A3A_fnc_scheduler;
				};
			};
		};
	};
};

/* -------------------------------------------------------------------------- */
/*                                    start                                   */
/* -------------------------------------------------------------------------- */

if !(isServer) exitwith {};

waitUntil { sleep 0.1; if !(isnil "theBoss") exitWith { true }; false };

/* -------------------------------------------------------------------------- */

private _time = 1 / (count markersX);
private _counter = 0;
private _greenfor = [];
private _blufor = [];
private _opfor = [];

private ["_markers", "_marker", "_position"];

while { true }
do
{
	_counter = _counter + 1;

	if (_counter >= COUNT_CYCLES)
	then
	{
		_counter = 0;

		_blufor = [];
		_opfor = [];
		_greenfor = [];

		_spawners = allunits select { _x getVariable ["spawner", false]; };

		{
			switch (side (group _x))
			do
			{
				case Occupants: { _blufor pushBack _x; };
				case Invaders: { _opfor pushBack _x; };
				case teamPlayer: { _greenfor pushBack _x; };
			};
		} forEach _spawners;
	};

	{
		sleep _time;

		_marker = _x;
		_position = getmarkerPos (_marker);

		switch (sidesX getVariable [_marker, sideUnknown])
		do
		{
			case Occupants: _processOccupantMarker;
			case Invaders: _processInvaderMarker;
			case teamPlayer: _processFIAMarker;
		};
	} forEach markersX;
};