//RHS - chdkz_rhs.hpp

//Armour
class rhsgref_ins_t72ba;
class rhsgref_ins_t72bb;
class rhsgref_ins_t72bc;

class a3a_rhs_chdkz_72a : rhsgref_ins_t72ba
{

#if __A3_DEBUG__
    scope = 2;
#else
    scope = 1;
#endif
	class EventHandlers
	{
		fired = "_this call (uinamespace getvariable 'BIS_fnc_effectFired');";
		init = "";
		killed = "_this call (uinamespace getvariable 'BIS_fnc_effectKilled');";
	};
};
class a3a_rhs_chdkz_72b : rhsgref_ins_t72bb
{
#if __A3_DEBUG__
    scope = 2;
#else
    scope = 1;
#endif
	class EventHandlers
	{
		fired = "_this call (uinamespace getvariable 'BIS_fnc_effectFired');";
		init = "";
		killed = "_this call (uinamespace getvariable 'BIS_fnc_effectKilled');";
	};
};
class a3a_rhs_chdkz_72c : rhsgref_ins_t72bc
{
#if __A3_DEBUG__
    scope = 2;
#else
    scope = 1;
#endif
	hiddenSelectionsTextures[] =
	{
		"rhsafrf\addons\rhs_t72_camo\data\rhs_t72b_01a_chdkz_co.paa",
		"rhsafrf\addons\rhs_t72_camo\data\rhs_t72b_02a_chdkz_co.paa",
		"rhsafrf\addons\rhs_t72\data\rhs_t72b_03_co.paa",
		"rhsafrf\addons\rhs_t72\data\rhs_t72b_04_co.paa",
		"rhsafrf\addons\rhs_t72\data\rhs_t72b_05_co.paa"
	};
	class EventHandlers
	{
		fired = "_this call (uinamespace getvariable 'BIS_fnc_effectFired');";
		init = "";
		killed = "_this call (uinamespace getvariable 'BIS_fnc_effectKilled');";
	};
};

//Air
class RHS_Mi8T_vvsc;
class RHS_Mi8mt_vvsc;
class RHS_Mi8MTV3_vvsc;
class RHS_Mi8MTV3_heavy_vvsc;
class RHS_Mi8AMTSh_vvsc;

class a3a_rhs_Mi8T_chdkz : RHS_Mi8T_vvsc
{
	crew = "rhsgref_ins_pilot";
	dlc = "RHS_GREF";
	faction = "rhsgref_faction_chdkz";
	hiddenSelectionsTextures[] ={"rhsafrf\addons\rhs_a2port_air\mi17\data\mi8_body_g_chdkz_co.paa","rhsafrf\addons\rhs_a2port_air\mi17\data\mi8_det_g_cdf_co.paa","rhsafrf\addons\rhs_a2port_air\mi17\data\mi8t\camo\mi8t_tv2_g_chdkz_co.paa","rhsafrf\addons\rhs_a2port_air\mi17\data\mi8_decals_ca.paa","rhsafrf\addons\rhs_decals\data\numbers\aviared\5_ca.paa","rhsafrf\addons\rhs_decals\data\numbers\aviared\8_ca.paa","rhsafrf\addons\rhs_decals\data\labels\aviation\vvs_ca.paa"};
};
class a3a_rhs_Mi8mt_chdkz : RHS_Mi8mt_vvsc
{
	crew = "rhsgref_ins_pilot";
	dlc = "RHS_GREF";
	faction = "rhsgref_faction_chdkz";
	hiddenSelectionsTextures[] ={"rhsafrf\addons\rhs_a2port_air\mi17\data\mi8_body_g_chdkz_co.paa","rhsafrf\addons\rhs_a2port_air\mi17\data\mi8_det_g_cdf_co.paa","a3\data_f\clear_empty.paa","rhsafrf\addons\rhs_a2port_air\mi17\data\mi8_decals_ca.paa","rhsafrf\addons\rhs_decals\data\numbers\aviared\4_ca.paa","rhsafrf\addons\rhs_decals\data\numbers\aviared\9_ca.paa","rhsafrf\addons\rhs_decals\data\labels\aviation\vvs_ca.paa"};
};
class a3a_rhs_Mi8MTV3_chdkz : RHS_Mi8MTV3_vvsc
{
	crew = "rhsgref_ins_pilot";
	dlc = "RHS_GREF";
	faction = "rhsgref_faction_chdkz";
	hiddenSelectionsTextures[] ={"rhsafrf\addons\rhs_a2port_air\mi17\data\mi8_body_g_chdkz_co.paa","rhsafrf\addons\rhs_a2port_air\mi17\data\mi8_det_g_cdf_co.paa","a3\data_f\clear_empty.paa","rhsafrf\addons\rhs_a2port_air\mi17\data\mi8_decals_ca.paa","rhsafrf\addons\rhs_decals\data\numbers\aviared\3_ca.paa","rhsafrf\addons\rhs_decals\data\numbers\aviared\1_ca.paa","rhsafrf\addons\rhs_decals\data\labels\aviation\vvs_ca.paa"};
};
class a3a_rhs_Mi8MTV3_heavy_chdkz : RHS_Mi8MTV3_heavy_vvsc
{
	crew = "rhsgref_ins_pilot";
	dlc = "RHS_GREF";
	faction = "rhsgref_faction_chdkz";
	hiddenSelectionsTextures[] ={"rhsafrf\addons\rhs_a2port_air\mi17\data\mi8_body_g_chdkz_co.paa","rhsafrf\addons\rhs_a2port_air\mi17\data\mi8_det_g_cdf_co.paa","a3\data_f\clear_empty.paa","rhsafrf\addons\rhs_a2port_air\mi17\data\mi8_decals_ca.paa","rhsafrf\addons\rhs_decals\data\numbers\aviared\7_ca.paa","rhsafrf\addons\rhs_decals\data\numbers\aviared\2_ca.paa","rhsafrf\addons\rhs_decals\data\labels\aviation\vvs_ca.paa"};
};
class a3a_rhs_Mi8AMTSh_chdkz : RHS_Mi8AMTSh_vvsc
{
	crew = "rhsgref_ins_pilot";
	dlc = "RHS_GREF";
	faction = "rhsgref_faction_chdkz";
	hiddenSelectionsTextures[] ={"rhsafrf\addons\rhs_a2port_air\mi17\data\camo\mi_171_chdkz_co.paa","rhsafrf\addons\rhs_a2port_air\mi17\data\mi8_det_g_cdf_co.paa","a3\data_f\clear_empty.paa","rhsafrf\addons\rhs_a2port_air\mi17\data\mi8_decals_ca.paa","rhsafrf\addons\rhs_decals\data\numbers\aviared\9_ca.paa","rhsafrf\addons\rhs_decals\data\numbers\aviared\7_ca.paa","rhsafrf\addons\rhs_decals\data\labels\aviation\vvs_ca.paa"};
};