private _casas = [];
private _mrk = createMarkerLocal ["ambientCiv", position player];
_mrk setMarkerShapeLocal "RECTANGLE";
_mrk setMarkerSizeLocal [300,300];
_mrk setMarkerTypeLocal "hd_warning";
_mrk setMarkerColorLocal "ColorRed";
_mrk setMarkerBrushLocal "DiagGrid";
_mrk setMarkerAlphaLocal 0;
private _grupo = grpNull;
private _reset = true;
private _civs = [];

while {true} do
	{
	if (player distance getMarkerPos _mrk > 300) then
		{
		_mrk setMarkerPosLocal (position player);
		_reset = true;
		_aborrar = [];
		{
		_civ = _x;
		if (!(alive _civ) or ({_civ distance _x <= 300} count (allPlayers - (entities "HeadlessClient_F")) == 0)) then
			{
			_grupo = group _x;
			_aborrar pushBack _x;
			deleteVehicle _x;
			if ({alive _x} count (units _grupo) == 0) then {deleteGroup _grupo};
			};
		} forEach _civs;
		_civs = _civs - _aborrar;
		};
	_allCivs = allUnits select {(alive _x) and (side _x == civilian)};
	if ((count _allCivs < civPerc) and ({(local _x) and (simulationEnabled _x) and (alive _x)} count allUnits < maxUnits)) then
		{
		if (_reset) then {_casas = (nearestTerrainObjects [player, ["House"], 300]) select {(count (_x buildingPos -1) > 0)}};
		_casas = _casas select {!((typeOf _x) in listMilBld)};
		_numCasas = count _casas;
		if (_numCasas > 0) then
			{
			_reset = false;
			if ((daytime < 8) or (daytime > 21)) then {_numCasas = round (_numCasas / 2)};
			if ({_x distance player < 300} count _allCivs <= _numCasas) then
				{
				_casa = selectRandom _casas;
				if ({_x distance _casa < 20} count (allPlayers - (entities "HeadlessClient_F")) == 0) then
					{
					if (isNull _grupo) then
						{
						_grupo = createGroup civilian;
						}
					else
						{
						if (count units _grupo > 2) then {_grupo = createGroup civilian};
						};
					_posCasa = selectRandom (_casa buildingPos -1);
					_civ = _grupo createUnit [selectRandom arrayCivs, _posCasa, [],0, "NONE"];
					_civ setPosATL _posCasa;
					[_civ] spawn A3A_fnc_CIVinit;
					_civs pushBack _civ;
					if (_civ == leader _civ) then {_nul = [_civ, "ambientCiv", "SAFE", "SPAWNED","NOFOLLOW", "NOVEH2","NOSHARE","DoRelax"] execVM "scripts\UPSMON.sqf"};
					};
				};
			};
		};
	sleep 5;
	};