////////////////////////////////////
//     REBEL UNIFORMS LIST       ///
////////////////////////////////////
diag_log format ["%1: [Antistasi] | INFO | initVar | Creating Rebel Uniforms",servertime];
{
_unit = _x select 0;
_uniform = (getUnitLoadout _unit select 3) select 0;
uniformsSDK pushBackUnique _uniform;
banditUniforms pushBackUnique _uniform;
if (count _x > 1) then
	{
	_unit = _x select 1;
	_uniform = (getUnitLoadout _unit select 3) select 0;
	uniformsSDK pushBackUnique _uniform;
	};
} forEach [SDKSniper,SDKATman,SDKMedic,SDKMG,SDKExp,SDKGL,SDKMil,SDKSL,SDKEng,[SDKUnarmed],[staticCrewTeamPlayer]];

////////////////////////////////////
//      Uniforms Sorting        ///
////////////////////////////////////
{
_originUnit = getText (configfile >> "CfgWeapons" >> _x >> "ItemInfo" >> "uniformClass");
_uniformSide = getNumber (configfile >> "CfgVehicles" >> _originUnit >> "side");
switch (_uniformSide) do
	{
	case 3: {civilianUniform pushBack _x};
	};
} forEach allUniform;

{
_originUnit = getText (configfile >> "CfgWeapons" >> _x >> "ItemInfo" >> "uniformClass");
_uniformFaction = getNumber (configfile >> "CfgVehicles" >> _originUnit >> "side");
switch (_uniformFaction) do
	{
	case "IND_C_F";
	case "IND_G_F": {rebelUniform pushBack _x};
	};
} forEach allUniform;

////////////////////////////////////
//      Backpacks Sorting        ///
////////////////////////////////////
{
_itemFaction = getText (configfile >> "CfgVehicles" >> _x >> "faction");
switch (_itemFaction) do
	{
	case "Default": {allBackpackEmpty pushBack _x};
	default {allBackpackTool pushBack _x};
	};
} forEach allBackpack;

////////////////////////////////////
//   ARMORED VESTS LIST          ///
////////////////////////////////////
//WHY is there no clean list?
allVestArmored = allVest select {getNumber (configfile >> "CfgWeapons" >> _x >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Chest" >> "armor") > 5};

////////////////////////////////////
//   ARMORED HELMETS LIST        ///
////////////////////////////////////
//WHY is there no clean list?
armoredHelmet = allHeadgear select {getNumber (configfile >> "CfgWeapons" >> _x >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Head" >> "armor") > 2};
