/*
    Author: [Hazey]
    Description:
		Set initial weather values based on current map climate and current mission month.
        Starts weather loop if enabled

    Arguments:
        <String> Start Type, "new" / "load".

    Return Value:
        N/A

    Scope: Any
    Environment: Any
    Public: No

    Example: 
		["new"] call A3A_fnc_weatherServerInit;

    Game Params:
        WeatherSeason
            0. Spring
            1. Summer
            2. Fall
            3. Winter

    License: MIT License
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_startType"];

// Should only run on the server.
if !(isServer) exitWith {};

// Exit if _startType is load.
if (_startType == "load") exitWith {};

private _currentSeason = WeatherSeason;
private _selectedWeather = WeatherSystem;

// Dynamic Auto Selection.
if (_selectedWeather == 1) then {
    switch (A3A_climate) do {
        case "arid": {_selectedWeather = 2};
        case "artic": {_selectedWeather = 3};
        case "temperate": {_selectedWeather = 4};
        case "tropical": {_selectedWeather = 5};
        default {_selectedWeather = 4};
    };
};

switch (_selectedWeather) do {

    case 2: { // Arid Weather
        // Winter (October, November, December, January, February and March)
        if ((_currentSeason == 2) || (_currentSeason == 3)) then {
            ServerDebug_1("WeatherManager | Arid | Selected Season is %1", _currentSeason);

            // Starting Values for Arid Winter
            private _initialArgs = [
                _selectedWeather, // Which weather system has been selected.
                [0.2, 0, 0.4, 0.1], // Initial Overcast, Min, Max, Modifier.
                [0, 0, 0, 0], // Initial Rain, Min, Max, Modifier.
                [0, 0, 0.4, 0.1] // Initial Fog, Min, Max, Modifier.
            ];
            _initialArgs call A3A_fnc_setWeatherScene;
        };
        
        // Summer (April, May, June, July, August, September)
        if ((_currentSeason == 0) || (_currentSeason == 1)) then {
            ServerDebug_1("WeatherManager | Arid | Selected Season is %1", _currentSeason);

            // Starting Values for Arid Summer
            private _initialArgs = [
                _selectedWeather, // Which weather system has been selected.
                [0, 0, 0.2, 0.05], // Initial Overcast, Min, Max, Modifier.
                [0, 0, 0, 0], // Initial Rain, Min, Max, Modifier.
                [0, 0, 0.2, 0.02] // Initial Fog, Min, Max, Modifier.
            ];
            _initialArgs call A3A_fnc_setWeatherScene;
        };
    };

    case 3: { // Artic Weather
        // Winter (November, December, January and February)
        if (_currentSeason == 3) then {
            ServerDebug_1("WeatherManager | Artic | Selected Season is %1", _currentSeason);

            // Starting Values for Artic Winter
            private _initialArgs = [
                _selectedWeather, // Which weather system has been selected.
                [1, 0.6, 1, 0.2], // Initial Overcast, Min, Max, Modifier.
                [1, 0.1, 1, 0.5], // Initial Rain, Min, Max, Modifier.
                [0, 0, 0, 0] // Initial Fog, Min, Max, Modifier.
            ];
            _initialArgs call A3A_fnc_setWeatherScene;
        };

        // Spring (March, April and May)
        if (_currentSeason == 0) then {
            ServerDebug_1("WeatherManager | Artic | Selected Season is %1", _currentSeason);

            // Starting Values for Artic Spring
            private _initialArgs = [
                _selectedWeather, // Which weather system has been selected.
                [0.6, 0.1, 1, 0.4], // Initial Overcast, Min, Max, Modifier.
                [0.1, 0, 1, 0.1], // Initial Rain, Min, Max, Modifier.
                [0, 0, 0, 0] // Initial Fog, Min, Max, Modifier.
            ];
            _initialArgs call A3A_fnc_setWeatherScene;
        };

        // Summer (June, July and August)
        if (_currentSeason == 1) then {
            ServerDebug_1("WeatherManager | Artic | Selected Season is %1", _currentSeason);

            // Starting Values for Artic Summer
            private _initialArgs = [
                _selectedWeather, // Which weather system has been selected.
                [0.1, 0, 0.5, 0.15], // Initial Overcast, Min, Max, Modifier.
                [0, 0, 0.2, 0.1], // Initial Rain, Min, Max, Modifier.
                [0, 0, 0, 0] // Initial Fog, Min, Max, Modifier.
            ];
            _initialArgs call A3A_fnc_setWeatherScene;
        };

        // Fall (September, October)
        if (_currentSeason == 2) then {
            ServerDebug_1("WeatherManager | Artic | Selected Season is %1", _currentSeason);

            // Starting Values for Artic Fall
            private _initialArgs = [
                _selectedWeather, // Which weather system has been selected.
                [0.7, 0.4, 1, 0.2], // Initial Overcast, Min, Max, Modifier.
                [0.1, 0, 1, 0.3], // Initial Rain, Min, Max, Modifier.
                [0, 0, 0, 0] // Initial Fog, Min, Max, Modifier.
            ];
            _initialArgs call A3A_fnc_setWeatherScene;
        };
    };

    case 4: { // Temperate Weather
        // Winter (December, January and February)
        if (_currentSeason == 3) then {
            ServerDebug_1("WeatherManager | Temperate | Selected Season is %1", _currentSeason);

            // Starting Values for Temperate Winter
            private _initialArgs = [
                _selectedWeather, // Which weather system has been selected.
                [0.5, 0.2, 1, 0.2], // Initial Overcast, Min, Max, Modifier.
                [0.4, 0.1, 1, 0.4], // Initial Rain, Min, Max, Modifier.
                [0, 0, 0.6, 0.05], // Initial Fog, Min, Max, Modifier.
                true // Allow snow?
            ];
            _initialArgs call A3A_fnc_setWeatherScene;
        };

        // Spring (March, April and May)
        if (_currentSeason == 0) then {
            ServerDebug_1("WeatherManager | Temperate | Selected Season is %1", _currentSeason);

            // Starting Values for Temperate Spring
            private _initialArgs = [
                _selectedWeather, // Which weather system has been selected.
                [0.4, 0.1, 1, 0.4], // Initial Overcast, Min, Max, Modifier.
                [0, 0, 1, 0.3], // Initial Rain, Min, Max, Modifier.
                [0, 0, 0.3, 0.1] // Initial Fog, Min, Max, Modifier.
            ];
            _initialArgs call A3A_fnc_setWeatherScene;
        };
        
        // Summer (June, July, August, September)
        if (_currentSeason == 1) then {
            ServerDebug_1("WeatherManager | Temperate | Selected Season is %1", _currentSeason);

            // Starting Values for Temperate Summer
            private _initialArgs = [
                _selectedWeather, // Which weather system has been selected.
                [0, 0, 0.5, 0.10], // Initial Overcast, Min, Max, Modifier.
                [0, 0, 0.2, 0.1], // Initial Rain, Min, Max, Modifier.
                [0, 0, 0, 0.2] // Initial Fog, Min, Max, Modifier.
            ];
            _initialArgs call A3A_fnc_setWeatherScene;
        };

        // Fall (October, November)
        if (_currentSeason == 2) then {
            ServerDebug_1("WeatherManager | Temperate | Selected Season is %1", _currentSeason);

            // Starting Values for Temperate Fall
            private _initialArgs = [
                _selectedWeather, // Which weather system has been selected.
                [0.7, 0.4, 1, 0.4], // Initial Overcast, Min, Max, Modifier.
                [0.1, 0, 1, 0.3], // Initial Rain, Min, Max, Modifier.
                [0, 0, 0.4, 0.1] // Initial Fog, Min, Max, Modifier.
            ];
            _initialArgs call A3A_fnc_setWeatherScene;
        };
    };

    case 5: { // Tropical Weather
        // Winter (November, December, January and February)
        if (_currentSeason == 3) then {
            ServerDebug_1("WeatherManager | Tropical | Selected Season is %1", _currentSeason);

            // Starting Values for Tropical Winter
            private _initialArgs = [
                _selectedWeather, // Which weather system has been selected.
                [0.6, 0.4, 1, 0.4], // Initial Overcast, Min, Max, Modifier.
                [0.6, 0.4, 1, 0.4], // Initial Rain, Min, Max, Modifier.
                [0, 0, 1, 0.1] // Initial Fog, Min, Max, Modifier.
            ];
            _initialArgs call A3A_fnc_setWeatherScene;
        };

        // Spring (March, April)
        if (_currentSeason == 0) then {
            ServerDebug_1("WeatherManager | Tropical | Selected Season is %1", _currentSeason);

            // Starting Values for Tropical Spring
            private _initialArgs = [
                _selectedWeather, // Which weather system has been selected.
                [0.4, 0.1, 1, 0.4], // Initial Overcast, Min, Max, Modifier.
                [0.4, 0.3, 1, 0.3], // Initial Rain, Min, Max, Modifier.
                [0, 0, 0.6, 0.1] // Initial Fog, Min, Max, Modifier.
            ];
            _initialArgs call A3A_fnc_setWeatherScene;
        };
        
        // Summer (May, June, July, August)
        if (_currentSeason == 1) then {
            ServerDebug_1("WeatherManager | Tropical | Selected Season is %1", _currentSeason);

            // Starting Values for Tropical Summer
            private _initialArgs = [
                _selectedWeather, // Which weather system has been selected.
                [0.4, 0.2, 1, 0.2], // Initial Overcast, Min, Max, Modifier.
                [0, 0, 1, 0.2], // Initial Rain, Min, Max, Modifier.
                [0, 0, 0.4, 0.1] // Initial Fog, Min, Max, Modifier.
            ];
            _initialArgs call A3A_fnc_setWeatherScene;
        };

        // Fall (September, October)
        if (_currentSeason == 2) then {
            ServerDebug_1("WeatherManager | Tropical | Selected Season is %1", _currentSeason);

            // Starting Values for Tropical Fall
            private _initialArgs = [
                _selectedWeather, // Which weather system has been selected.
                [0.4, 0.1, 1, 0.4], // Initial Overcast, Min, Max, Modifier.
                [0.4, 0.3, 1, 0.3], // Initial Rain, Min, Max, Modifier.
                [0, 0, 0.6, 0.1] // Initial Fog, Min, Max, Modifier.
            ];
            _initialArgs call A3A_fnc_setWeatherScene;
        };
    };
};