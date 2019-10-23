private ["_tipo","_texto"];

_tipo = typeOf player;
_texto = "";
switch (_tipo) do
	{
	case "I_C_Soldier_Para_7_F": {player setUnitTrait ["UAVHacker",true]};
	case "I_C_Soldier_Para_8_F": {player setUnitTrait ["engineer",true]; player setUnitTrait ["explosiveSpecialist",true]};
	case "I_C_Soldier_Para_3_F": {player setUnitTrait ["medic",true]};
	case tipoPetros: {player setUnitTrait ["UAVHacker",true]};
	/*
	case "I_C_Soldier_Para_3_F":  {_texto = "Medic role.\n\nMedics do not have any bonus or penalties, but have the ability to use Medikits for full health restoration"};
	case "B_G_officer_F": {player setUnitTrait ["camouflageCoef",0.8]; player setUnitTrait ["audibleCoef",0.8]; player setUnitTrait ["loadCoef",1.4];};
	case SDKRifleman:  {player setUnitTrait ["audibleCoef",0.8]; player setUnitTrait ["loadCoef",1.2]; _texto = "Rifleman role.\n\nRiflemen are more suitable to silent sneak but have less carryng capacity"};
	case "B_G_Soldier_LAT_F": {player setUnitTrait ["camouflageCoef",1.2]; player setUnitTrait ["loadCoef",0.8]; _texto = "AT Man role.\n\nAT men have a slight bonus on carry capacity, but are easy to spot"};
	case "B_G_Soldier_AR_F": {player setUnitTrait ["audibleCoef",1.2]; player setUnitTrait ["loadCoef",0.8]; _texto = "Autorifleman role.\n\nAutoriflemen have a slight bonus on carry capacity, but make too much noise when they move"};
	case "B_G_engineer_F":  {_texto = "Engineer role.\n\nEngineers do not have any bonus or penalties, but have the ability to use Repair Kits for vehicle repair"};
	case "B_G_Soldier_A_F":  {player setUnitTrait ["camouflageCoef",1.2]; player setUnitTrait ["audibleCoef",1.2]; player setUnitTrait ["loadCoef",0.6]; _texto = "Ammo bearer role.\n\nAmmo bearers have a great strenght but are easy to spot and easy to hear."};
	case "B_G_Soldier_M_F":  {player setUnitTrait ["camouflageCoef",0.8]; player setUnitTrait ["loadCoef",1.2]; _texto = "Marksman role.\n\nMarksmen know well how to hide, but have less carry capacity."};
	*/
	};
/*
if (isMultiPlayer) then
	{
	sleep 5;
	hint format ["You have selected %1",_texto];
	};
