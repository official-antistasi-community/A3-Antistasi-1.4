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
		[] call A3A_fnc_weatherServerInit;

    License: MIT License
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_startType"];

if !(isServer) exitWith {};

private _currentmonth = (date # 1);
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

if (_startType == "load") exitWith {
    ServerDebug("WeatherManager | Loading Weather from save or exiting for backwards compatability");
};

switch (_selectedWeather) do {

    case 2: { // Arid Weather
        // Winter (October, November, December, January, February and March)
        if ((_currentmonth >= 10 && _currentmonth <= 12) || (_currentmonth >= 1 && _currentmonth <= 3)) then {
            ServerDebug_1("WeatherManager | Arid Winter | Current Month is %1", _currentmonth);

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
        if (_currentmonth >= 4 && _currentmonth <= 9) then {
            ServerDebug_1("WeatherManager | Arid Summer | Current Month is %1", _currentmonth);

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
        if ((_currentmonth >= 11 && _currentmonth <= 12) || (_currentmonth >= 1 && _currentmonth <= 2)) then {
            ServerDebug_1("WeatherManager | Artic Winter | Current Month is %1", _currentmonth);

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
        if (_currentmonth >= 3 && _currentmonth <= 5) then {
            ServerDebug_1("WeatherManager | Artic Spring | Current Month is %1", _currentmonth);

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
        if (_currentmonth >= 6 && _currentmonth <= 8) then {
            ServerDebug_1("WeatherManager | Artic Summer | Current Month is %1", _currentmonth);

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
        if (_currentmonth >= 9 && _currentmonth <= 10) then {
            ServerDebug_1("WeatherManager | Artic Fall | Current Month is %1", _currentmonth);

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
        if ((_currentmonth == 12) || (_currentmonth >= 1 && _currentmonth <= 2)) then {
            ServerDebug_1("WeatherManager | Temperate Winter | Current Month is %1", _currentmonth);

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
        if (_currentmonth >= 3 && _currentmonth <= 5) then {
            ServerDebug_1("WeatherManager | Temperate Spring | Current Month is %1", _currentmonth);

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
        if (_currentmonth >= 6 && _currentmonth <= 9) then {
            ServerDebug_1("WeatherManager | Temperate Summer | Current Month is %1", _currentmonth);

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
        if (_currentmonth >= 10 && _currentmonth <= 11) then {
            ServerDebug_1("WeatherManager | Temperate Fall | Current Month is %1", _currentmonth);

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
        if ((_currentmonth >= 11 && _currentmonth <= 12) || (_currentmonth >= 1 && _currentmonth <= 2)) then {
            ServerDebug_1("WeatherManager | Tropical Winter | Current Month is %1", _currentmonth);

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
        if (_currentmonth >= 3 && _currentmonth <= 4) then {
            ServerDebug_1("WeatherManager | Tropical Spring | Current Month is %1", _currentmonth);

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
        if (_currentmonth >= 5 && _currentmonth <= 8) then {
            ServerDebug_1("WeatherManager | Tropical Summer | Current Month is %1", _currentmonth);

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
        if (_currentmonth >= 9 && _currentmonth <= 10) then {
            ServerDebug_1("WeatherManager | Tropical Fall | Current Month is %1", _currentmonth);

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