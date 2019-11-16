//if (worldName != "Tanoa") exitWith {};
private ["_unit"];

_unit = _this select 0;

_unit addUniform (selectRandom allRebelUniforms);

_unit addItemToUniform "FirstAidKit";
