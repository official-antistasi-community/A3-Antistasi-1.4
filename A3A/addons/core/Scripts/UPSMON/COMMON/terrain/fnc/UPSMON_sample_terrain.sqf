/****************************************************************
File: UPSMON_sample_terrain.sqf
Author: Azroul13

Description:
	Get the Type of the terrain that surrounding the position ("inhabited"/"forest"/"sea"/"coast"/"undefined")
Parameter(s):
	<--- position
Returns:
	Array [terrain type, value of the terrain]
****************************************************************/

private ["_sample", "_sampleValue", "_sampleType"];

_sample = selectBestPlaces [
   _this, // sample position
   30, // radius
   "(1000 * houses) + (100 * forest) + (10 * trees) + (1 * meadow) - (1000 * sea)", // expression
   10, // precision
   1 // sourcesCount
];

if ((count _sample) < 1) exitWith
{
   ["undefined", 0]
};

_sampleValue = (_sample select 0) select 1;
_sampleType = "meadow";

switch (true) do
{
   case (_sampleValue > 200):  { _sampleType = "inhabited"; };
   case (_sampleValue > 50):   { _sampleType = "forest"; };
   case (_sampleValue < -992): { _sampleType = "sea"; };
   case (_sampleValue < 0):    { _sampleType = "coast"; };
   case (_sampleValue == 0):   { _sampleType = "undefined"; }; // out of map/end of world
};

// return sample
[_sampleType, _sampleValue]