_unit = _this select 0;
_tipo = typeOf _unit;
_loadout = "rhsgref_ins_g_militiaman_mosin";
switch _tipo do
	{
	case "I_G_officer_F": {_loadout = "rhsgref_ins_g_squadleader"};
	case "I_G_Soldier_AR_F": {_loadout = "rhsgref_ins_g_machinegunner"};
	case "I_G_Soldier_LAT2_F": {_loadout = "rhsgref_nat_grenadier_rpg"};
	case "I_G_medic_F": {_loadout = "rhsgref_ins_g_medic"};
	case "I_G_engineer_F": {_loadout = "rhsgref_ins_g_engineer"};
	case "I_G_Soldier_GL_F": {_loadout = "rhsgref_nat_pmil_grenadier"};
	case "B_recon_TL_F": {_loadout = "rhsusf_usmc_recon_marpat_d_teamleader_lite"};
	case "B_CTRG_Soldier_TL_tna_F": {_loadout = "rhsusf_usmc_recon_marpat_d_teamleader_lite"};
	case "B_recon_M_F": {_loadOut = "rhsusf_usmc_recon_marpat_d_marksman_lite"};
	case "B_CTRG_Soldier_M_tna_F": {_loadOut = "rhsusf_usmc_recon_marpat_d_marksman_lite"};
	case "B_recon_medic_F": {_loadOut = "rhsusf_navy_sarc_d_fast"};
	case "B_CTRG_Soldier_Medic_tna_F": {_loadOut = "rhsusf_navy_sarc_d_fast"};
	case "B_recon_LAT_F": {_loadOut = "rhsusf_usmc_recon_marpat_d_rifleman_at_lite"};
	case "B_CTRG_Soldier_LAT_tna_F": {_loadOut = "rhsusf_usmc_recon_marpat_d_rifleman_at_lite"};
	case "B_recon_F": {_loadOut = "rhsusf_army_ucp_grenadier"};
	case "B_CTRG_Soldier_tna_F": {_loadOut = "rhsusf_army_ucp_grenadier"};
	case "B_recon_JTAC_F": {_loadOut = "rhsusf_army_ucp_rifleman_m590"};
	case "B_CTRG_Soldier_JTAC_tna_F": {_loadOut = "rhsusf_army_ucp_rifleman_m590"};
	case "B_recon_exp_F": {_loadOut = "rhsusf_army_ucp_engineer"};
	case "B_CTRG_Soldier_Exp_tna_F": {_loadOut = "rhsusf_army_ucp_engineer"};
	case "B_Patrol_Soldier_MG_F": {_loadOut = "rhsusf_usmc_recon_marpat_d_machinegunner"};
	case "B_CTRG_Soldier_AR_tna_F": {_loadOut = "rhsusf_usmc_recon_marpat_d_machinegunner"};
	};
_unit setUnitLoadout _loadout;

_unit selectWeapon (primaryWeapon _unit);
