#include "RHS_AI_AFRF_Arid.sqf"

["vehiclesArtillery", ["rhs_9k79","rhs_9k79_K"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["rhs_9k79",["1_Rnd_RHS_9M79_1_F"]],
["rhs_9k79_K",["1_Rnd_RHS_9M79_1_K"]]
]] call _fnc_saveToTemplate; //element format: [Vehicle class, [Magazines]]