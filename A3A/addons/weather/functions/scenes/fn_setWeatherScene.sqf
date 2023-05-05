/*
    Author: [Hazey]
    Description:
		Set Initial weather values and loop weather with new values if enabled.

    Arguments:
		<Number> Selected Weather System.
		<Array> Array of initial Overcast Weather values, Min/Max and Modifiers.
		<Array> Array of initial Rain Weather values, Min/Max and Modifiers.
		<Array> Array of initial Fog Weather values, Min/Max and Modifiers.
		<Bool> Should snow be allowed to happen? True = Yes, False = No.

    Return Value:
        N/A

    Scope: Any
    Environment: Any
    Public: No

    Example: 
		private _initialArgs = [
			_selectedWeather, // Which weather system has been selected.
			[0.5, 0.2, 1, 0.2], // Initial Overcast, Min, Max, Modifier.
			[0.4, 0.1, 1, 0.4], // Initial Rain, Min, Max, Modifier.
			[0, 0, 0.6, 0.05], // Initial Fog, Min, Max, Modifier.
			false // Allow snow?
		];
		_initialArgs call A3A_fnc_setWeatherScene;

    License: MIT License

	USAGE NOTES: We use additional math to keep two decimal places on the value at all times for more control over the effects
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params [
	"_selectedWeather",
	"_overcastArray",
	"_rainArray",
	"_fogArray",
	["_allowSnow", false]
];

[_selectedWeather, _allowSnow] call A3A_fnc_setRainTexture;

private _windSpeed = random 5;
private _windDir = round (random 360);
private _newWaves = ((vectorMagnitude [-_windSpeed * sin(_windDir), -_windSpeed * cos(_windDir), 0]) / 16.0) min 1.0;

// Set Initial Weather Effects.
if (abs(_newWaves - waves) > 0.1) then {
	10 setWaves _newWaves;
};
10 setOvercast (_overcastArray # 0);
10 setRain (_rainArray # 0);
10 setWindDir _windDir;
10 setWindForce _windSpeed;

if (WeatherAllowFog) then {
	10 setFog [(_fogArray # 0), 1, 1];
} else {
	10 setFog [0, -1, 5000];
};

ServerDebug_6("WeatherManager | Initial forecast | Overcast %1 | Rain %2 | Fog %3 | Humidity %4 | Wind %5 | Dir %6", _overcastArray # 0, _rainArray # 0, _fogArray # 0, round(humidity * (10 ^ 2)) / (10 ^ 2), _windSpeed, _windDir);

// Force initial weather settings. This will do an initial sync for all client connected at start.
forceWeatherChange;

// Add weather values to MissionNameSpace for saving later.
missionNamespace setVariable ["WeatherVariables", [
	_selectedWeather,
	_overcastArray,
	_rainArray,
	_fogArray,
	_allowSnow
]];

if (WeatherCycleDelay == -1) exitWith {
	ServerDebug("WeatherManager | Weather Cycle Delay Disabled, weather loop disabled.");
};

sleep 10;

[_selectedWeather, _overcastArray, _rainArray, _fogArray, _windDir, _allowSnow] spawn {
	params ["_selectedWeather", "_overcastArray", "_rainArray", "_fogArray","_windDir", "_allowSnow"];

	while {true} do {
		// Set Rain Texture.
		[_selectedWeather, _allowSnow] call A3A_fnc_setRainTexture;

		// Get current weather values.
		private _currentOvercast = round(overcast * (10 ^ 2)) / (10 ^ 2);
		private _currentRain = round(rain * (10 ^ 2)) / (10 ^ 2);
		private _currentFog = round(fog * (10 ^ 2)) / (10 ^ 2);
		private _currentHumidity = round(humidity * (10 ^ 2)) / (10 ^ 2);
		
		// We don't really care about wind at the moment, just set it random of 5.
		private _windSpeed = random 5;

		// Get New Overcast Value based on current Overcast.
		private _newOvercastValue = [_currentOvercast, (_overcastArray # 1), (_overcastArray # 2), (_overcastArray # 3)] call A3A_fnc_getWeatherValue;

		// Get new Rain value based on current Rain.
		private _newRainValue = [_currentRain, (_rainArray # 1), (_rainArray # 2), (_rainArray # 3)] call A3A_fnc_getWeatherValue;

		// Get new Fog values based on current Fog.
		private _newFogValue = [_currentFog, (_fogArray # 1), (_fogArray # 2), (_fogArray # 3)] call A3A_fnc_getWeatherValue;

		// Get Wind.
		_windDir = round ((_windDir + random 45) - random 45);

		// If wind value goes over 360 degrees, we subtract 360 to get its correct direction.
		if (_windDir > 360) then { _windDir = _windDir - 360};

		// If wind value goes under 0 degrees, we add 360 to get its correct direction.
		if (_windDir < 0) then { _windDir = _windDir + 360};

		// Get waves based on wind values.
		private _newWaves = ((vectorMagnitude [-_windSpeed * sin(_windDir), -_windSpeed * cos(_windDir),0]) / 16.0) min 1.0;

		// Apply new weather values.
		WeatherCycleDelay setOvercast _newOvercastValue;
		WeatherCycleDelay setRain _newRainValue;
		WeatherCycleDelay setWindDir _windDir;
		WeatherCycleDelay setWindForce _windSpeed;

		if (WeatherAllowFog) then {
			WeatherCycleDelay setFog [_newFogValue, 1, 0];
		} else {
			WeatherCycleDelay setFog [0, -1, 5000];
		};

		if (abs(_newWaves - waves) > 0.1) then {
			WeatherCycleDelay setWaves _newWaves;
		};

		// Update weather values to MissionNameSpace for saving later.
		missionNamespace setVariable ["WeatherVariables", [
			_selectedWeather,
			[_newOvercastValue, (_overcastArray # 1), (_overcastArray # 2), (_overcastArray # 3)],
			[_newRainValue, (_rainArray # 1), (_rainArray # 2), (_rainArray # 3)],
			[_newFogValue, (_fogArray # 1), (_fogArray # 2), (_fogArray # 3)],
			_allowSnow
		]];
		
		ServerDebug_7("WeatherManager | Upcoming forecast | Overcast %1 | Rain %2 | Fog %3 | Humidity %4 | Wind %5 | Dir %6 | In %7 seconds", _newOvercastValue, _newRainValue, _currentFog, _currentHumidity,_windSpeed, _windDir, WeatherCycleDelay);

		// Sleep to run again. This is set in the Mission Params at the start of a mission.
		sleep WeatherCycleDelay;
	};
};