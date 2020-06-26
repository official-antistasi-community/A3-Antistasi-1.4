private _houses = [];
private _mrk = createMarkerLocal ["ambientCiv", position player];
_mrk setMarkerShapeLocal "RECTANGLE";
_mrk setMarkerSizeLocal [300,300];
_mrk setMarkerTypeLocal "hd_warning";
_mrk setMarkerColorLocal "ColorRed";
_mrk setMarkerBrushLocal "DiagGrid";
_mrk setMarkerAlphaLocal 0;
private _groupX = grpNull;
private _reset = true;
private _civs = [];
while {true} do {
	if (player distance getMarkerPos _mrk > 300) then {
		_mrk setMarkerPosLocal (position player);
		_reset = true;
		_abuse = [];
		{
			_civ = _x;
			if (!(alive _civ) or ({_civ distance _x <= 300} count (allPlayers - (entities "HeadlessClient_F")) == 0)) then {
				_groupX = group _x;
				_abuse pushBack _x;
				deleteVehicle _x;
				if ({alive _x} count (units _groupX) == 0) then {deleteGroup _groupX};
			};
		} forEach _civs;
		_civs = _civs - _abuse;
	};
	_allCivs = allUnits select {(alive _x) and (side _x == civilian)};
	if ((count _allCivs < civPerc) and ({(local _x) and (simulationEnabled _x) and (alive _x)} count allUnits < maxUnits)) then {
		if (_reset) then {_houses = (nearestTerrainObjects [player, ["House"], 300]) select {(count (_x buildingPos -1) > 0)}};
		_houses = _houses select {!((typeOf _x) in listMilBld)};
		_numhouses = count _houses;
		if (_numhouses > 0) then {
			_reset = false;
			if ((daytime < 8) or (daytime > 21)) then {_numhouses = round (_numhouses / 2)};
			if ({_x distance player < 300} count _allCivs <= _numhouses) then {
				_houseX = selectRandom _houses;
				if ({_x distance _houseX < 20} count (allPlayers - (entities "HeadlessClient_F")) == 0) then {
					if (isNull _groupX) then {
						_groupX = createGroup civilian;
					}
					else {
						if (count units _groupX > 2) then {_groupX = createGroup civilian};
					};
					_posHouse = selectRandom (_houseX buildingPos -1);
					_unit = selectRandom arrayCivs;
					_civ = [_groupX, _unit, _posHouse, [],0, "NONE"] call A3A_fnc_createUnit;
					_civ setPosATL _posHouse;
					[_civ] spawn A3A_fnc_CIVinit;
					_civs pushBack _civ;
					if (_civ == leader _civ) then {_nul = [_civ, "ambientCiv", "SAFE", "SPAWNED","NOFOLLOW", "NOVEH2","NOSHARE","DoRelax"] execVM "scripts\UPSMON.sqf"};
					//TODO delete UPSMON
				};
			};
		};
	};
sleep 5;
};
