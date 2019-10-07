//Ensures that any referencing of the Euclid object, which from this point forward be known as SCP-petros-nullPointer, will not have undesired consequences.
// (call A3A_fnc_getPetros)
// petros replace file exclusion filter: "fn_getPetros.sqf,fn_createPetros.sqf,fn_spawnDebuggingLoop.sqf,*sqm,*txt,*.hpp"
if (isNil "petros" || {isNull petros}) then 
{
	[] call A3A_fnc_createPetros;
};
petros;