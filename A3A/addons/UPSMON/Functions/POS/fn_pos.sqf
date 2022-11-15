private ["_pos"];
_pos = [];

// Only marker is given as parameter
if (_this isEqualType "STRING") then {
	_pos = [_this] call UPSMON_fnc_getPosMarker;

// Parameter array
} else {
    if ((_this select 0) isEqualType "STRING") then {
      	_pos = _this call UPSMON_fnc_getPosMarker;
    } else {
     	 _pos = _this call UPSMON_fnc_getPos;
    };
};

// Return position
_pos