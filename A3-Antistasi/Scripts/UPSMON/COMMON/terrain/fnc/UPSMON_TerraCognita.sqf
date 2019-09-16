/****************************************************************
File: UPSMON_TerraCognita.sqf
Author: Rydgier

****************************************************************/	

private ["_position","_posX","_posY","_radius","_precision","_sourcesCount","_urban","_forest","_hills","_flat","_sea","_valS","_value","_val0","_samples","_sGr","_hprev","_hcurr","_samplePos","_i","_rds"];	

_position = _this select 0;
_samples = _this select 1;
_rds = 100;
if ((count _this) > 2) then {_rds = _this select 2};

if !((typeName _position) == "ARRAY") then {_position = getPosATL _position};

_posX = _position select 0;
_posY = _position select 1;

_radius = 5;
_precision = 1;
_sourcesCount = 1;

_urban = 0;
_forest = 0;
_hills = 0;
_flat = 0;
_sea = 0;

_sGr = 0;
_hprev = getTerrainHeightASL [_posX,_posY];

for "_i" from 1 to 10 do
{
	_samplePos = [_posX + ((random (_rds * 2)) - _rds),_posY + ((random (_rds * 2)) - _rds)];
	_hcurr = getTerrainHeightASL _samplePos;
	_sGr = _sGr + abs (_hcurr - _hprev)
};

_sGr = _sGr/10;

{
	_valS = 0;

	for "_i" from 1 to _samples do
	{
		_position = [_posX + (random (_rds/5)) - (_rds/10),_posY + (random (_rds/5)) - (_rds/10)];


		_value = selectBestPlaces [_position,_radius,_x,_precision,_sourcesCount];

		_val0 = _value select 0;
		_val0 = _val0 select 1;

		_valS = _valS + _val0;
	};

	_valS = _valS/_samples;

	switch (_x) do
	{
		case ("Houses") : {_urban = _urban + _valS};
		case ("Trees") : {_forest = _forest + (_valS/3)};
		case ("Forest") : {_forest = _forest + _valS};
		case ("Hills") : {_hills = _hills + _valS};
		case ("Meadow") : {_flat = _flat + _valS};
		case ("Sea") : {_sea = _sea + _valS};
	};
} foreach ["Houses","Trees","Forest","Hills","Meadow","Sea"];

[_urban,_forest,_hills,_flat,_sea,_sGr]