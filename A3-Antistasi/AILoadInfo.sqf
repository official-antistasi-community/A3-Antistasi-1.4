//Original Author: Barbolani
//Edited and updated by the Antstasi Community Development Team

if (!isServer) exitWith {};

if (count hcArray == 0) exitWith {
	[petros, "hint", "No Headless Client Detected"] remoteExec ["A3A_fnc_commsMP", theBoss];//TODO Multilanguage variable
};

private _textX = "";
private _aliveUnits = allUnits select {alive _x};
private ["_west", "_east", "_indep", "_civ", "_total", "_client"];

{
	_client = _x;
	_textX = format ["%1HC %2 AI\n\n", _textX, _forEachIndex];
	_indep = 0; _west = 0; _east = 0; _civ = 0; _total = 0;

	{
		if (owner _x == _client) then {

			_total = _total + 1;

			switch (side _x) do {
				case teamPlayer: { _indep = _indep + 1; };
				case Occupants: { _west = _west + 1; };
				case Invaders: { _east = _east + 1; };
				case civilian: { _civ = _civ + 1; };
			};
		};
	} forEach _aliveUnits;

	_textX = format ["%1SDK: %2\nWest:%3\nEast:%4\nCiv:%5\nTOTAL:%6\n\n", _textX, _indep, _west, _east, _civ, _total];//TODO Multilanguage variable

} forEach hcArray;

[petros, "hint", _textX] remoteExec ["A3A_fnc_commsMP", theBoss];
