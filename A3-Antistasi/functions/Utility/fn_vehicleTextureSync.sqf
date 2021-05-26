/*
    A3A_fnc_vehicleTextureSync
    Makes local vehicle texture settings global, working around Arma misfeature/bug

    Parameters:
    0. <OBJECT> vehicle, should have been created locally
*/

params ["_veh"];

if (isNil "_veh" or {isNull _veh}) exitWith {};

// textureList is weighted array, so >2 means multiple texture options
if (count getArray (configfile >> "CfgVehicles" >> typeof _veh >> "textureList") > 2) then
{
    { _veh setObjectTextureGlobal [_forEachindex, _x] } forEach getObjectTextures _veh;
    { _veh setObjectMaterialGlobal [_forEachindex, _x] } forEach getObjectMaterials _veh;
};
