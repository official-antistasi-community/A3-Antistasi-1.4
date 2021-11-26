[] spawn {
// All assume sorted in acceding order
private _fnc_mean = {
    private _total = 0;
    { _total = _total + _x} forEach _this;
    _total / count _this;
};
private _fnc_min = {
    _this#0;
};
private _fnc_max = {
    _this#(count _this -1);
};
private _fnc_median = {
    private _half = count _this /2;
    if (_half%1 == 0) exitWith {
        (_this#(_half -1) + _this#_half) / 2
    };
    _this#(_half -0.5);
};
private _fnc_stdDev = {
    params ["_array","_mean"];
    private _total = 0;
    {_total = _total + (_x - _mean)^2} forEach _array;
    sqrt (_total / count _array);
};

// Common for transforming 3DPos to 2D.
A3A_NG_const_pos2DSelect = [0,2];
A3A_NG_const_emptyArray = [];
DEV_getStats_output = [];

private _fnc_log2 = {
    (log _this) / (log 2);
};

private _fnc_toStringDistanceDeviation = {
    private _pos = getPosATL _x;
    private _roughPos = parseSimpleArray str _pos;
    _pos distance _roughPos;
};

private _halfWorldSize = worldSize/2;
private _worldCentre = [_halfWorldSize,_halfWorldSize];
private _worldMaxRadius = sqrt(0.5 * (worldSize^2));
A3A_NG_const_roadTypeEnum = ["TRACK","ROAD","MAIN ROAD"];

hint "1/4 - Extracting roads.";
private _allRoadObjects = nearestTerrainObjects [_worldCentre, A3A_NG_const_roadTypeEnum, _worldMaxRadius, false, true] select {!isNil{getRoadInfo _x #0} && {getRoadInfo _x #0 in A3A_NG_const_roadTypeEnum}};
hint "2/4 - Performing distance searches.";
private _distances = _allRoadObjects apply {_x call _fnc_toStringDistanceDeviation};
//copyToClipboard str _distances;
DEV_getStats_output pushBack _distances;
hint "3/4 - Sorting distances.";
_distances sort true;

hint "4/4 - 1/5 Calculating min.";
private _min = _distances call _fnc_min;
hint "4/4 - 2/5 Calculating max.";
private _max = _distances call _fnc_max;
hint "4/4 - 3/5 Calculating mean.";
private _mean = _distances call _fnc_mean;
hint "4/4 - 4/5 Calculating median.";
private _median = _distances call _fnc_median;
hint "4/4 - 5/5 Calculating stdDev.";
private _stdDev = [_distances,_mean] call _fnc_stdDev;

private _formattedData = format ["Position to string inaccuracy distance; world: %1; worldSize: %2; processedRoads: %3; min: %4m; max: %5m; mean: %6m; median: %7m; stdDev: %8m;",worldName,worldSize,count _allRoadObjects,_min,_max,_mean,_median,_stdDev];
copyToClipboard _formattedData;
DEV_getStats_output pushBack _formattedData;
hint "Road statistics copied to clipboard!" + endL + endL + _formattedData;
};
"Data is crunching, please watch hint field. Data can be extracted from DEV_getStats_output";








// Determine string and parse number inaccuracy.

private _deviations = [];
for "_e" from -37 to 37 do {
    private _number = 1 + 10^_e;
    private _roughNumber = parseNumber str _number;
    _deviations pushBack [_e,abs (_number - _roughNumber)];
};
private _formattedData = (_deviations apply {str _x}) joinString endL;
copyToClipboard _formattedData;
_formattedData;







private _halfWorldSize = worldSize/2;
private _worldCentre = [_halfWorldSize,_halfWorldSize];
private _worldMaxRadius = sqrt(0.5 * (worldSize^2));
A3A_NG_const_roadTypeEnum = ["TRACK","ROAD","MAIN ROAD"];

private _allRoadObjects = nearestTerrainObjects [_worldCentre, A3A_NG_const_roadTypeEnum, _worldMaxRadius, false, true] select {!isNil{getRoadInfo _x #0} && {getRoadInfo _x #0 in A3A_NG_const_roadTypeEnum}};

A3A_NG_const_emptyArray = [];
{nearestTerrainObjects [getPosATL _x, A3A_NG_const_roadTypeEnum, 0, false, true] isEqualTo A3A_NG_const_emptyArray} count _allRoadObjects;