/*
file: show_fps.sqf
by someone edited by DaVidoSS
displays markers with current performance load
created for Barbolani's Antistasi
parameters none
return VOID
*/

private [ "_sourcestr", "_position", "_myfpsmarker", "_myfps", "_localunits", "_localvehicles", "_localgroups" ];

if (!hasInterface) then {

	if (isDedicated) then {
		_sourcestr = "Server";
		_position = 0;
	} else {
	
		waitUntil {sleep 1; !isNil "bis_fnc_init" && {getClientState == "BRIEFING READ"}};
		
		if (!isNil "hc") then {
			if (!isNull hc) then {
				if (local hc) then {
					_sourcestr = "hc";
					_position = 1;
				};
			};
		};

		if (!isNil "hc_1") then {
			if (!isNull hc_1) then {
				if (local hc_1) then {
					_sourcestr = "hc_1";
					_position = 2;
				};
			};
		};

		if (!isNil "hc_2") then {
			if (!isNull hc_2) then {
				if (local hc_2) then {
					_sourcestr = "hc_2";
					_position = 3;
				};
			};
		};
		if (!isNil "hc_3") then {
			if (!isNull hc_3) then {
				if (local hc_3) then {
					_sourcestr = "hc_3";
					_position = 4;
				};
			};
		};
		if (!isNil "hc_4") then {
			if (!isNull hc_4) then {
				if (local hc_4) then {
					_sourcestr = "hc_4";
					_position = 5;
				};
			};
		};
		if (!isNil "hc_5") then {
			if (!isNull hc_5) then {
				if (local hc_5) then {
					_sourcestr = "hc_5";
					_position = 6;
				};
			};
		};
	};

	_myfpsmarker = createMarker [ format ["fpsmarker%1", _sourcestr ], [ 50, 50 + (50 * _position) ] ];
	_myfpsmarker setMarkerType "mil_start";
	_myfpsmarker setMarkerSize [ 0.7, 0.7 ];

	while { true } do {

		_myfps = diag_fps;
		_localunits = { local _x } count allUnits;
		_localvehicles = { local _x } count vehicles;
		_localgroups = count allGroups;

		switch (true) do {
		case (_myfps > 30): {_myfpsmarker setMarkerColor "ColorGREEN"};
		case (_myfps < 30 && {_myfps >= 20}): {_myfpsmarker setMarkerColor "ColorYELLOW"};
		case (_myfps < 20 && {_myfps >= 10}): {_myfpsmarker setMarkerColor "ColorORANGE"};
		case (_myfps < 10): {_myfpsmarker setMarkerColor "ColorRED"};
		};

		_myfpsmarker setMarkerText format [ "%1: %2 fps, %3 units, %4 vehicles, %5 groups", _sourcestr, ( round ( _myfps * 100.0 ) ) / 100.0 , _localunits, _localvehicles, _localgroups ];
		
		sleep 5;
	};

} else {

	_sourcestr = profileNameSteam;
	_position = 7;
	_myfpsmarker = createMarkerLocal [ format ["fpsmarker%1", _sourcestr ], [ 50, 50 + (50 * _position) ] ];
	_myfpsmarker setMarkerTypeLocal "mil_start";
	_myfpsmarker setMarkerSizeLocal [ 0.7, 0.7 ];

	while { true } do {

		_myfps = diag_fps;
		_localunits = { local _x } count allUnits;
		_localvehicles = { local _x } count vehicles;

		switch (true) do {
		case (_myfps > 30): {_myfpsmarker setMarkerColorLocal "ColorGREEN"};
		case (_myfps < 30 && {_myfps >= 20}): {_myfpsmarker setMarkerColorLocal "ColorYELLOW"};
		case (_myfps < 20 && {_myfps >= 10}): {_myfpsmarker setMarkerColorLocal "ColorORANGE"};
		case (_myfps < 10): {_myfpsmarker setMarkerColorLocal "ColorRED"};
		};

		_myfpsmarker setMarkerTextLocal format [ "%1: %2 fps, %3 units, %4 vehicles", _sourcestr, ( round ( _myfps * 100.0 ) ) / 100.0 , _localunits, _localvehicles ];
		
		sleep 5;
	};
};