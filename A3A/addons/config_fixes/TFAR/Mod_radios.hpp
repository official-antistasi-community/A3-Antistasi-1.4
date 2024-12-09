//TFAR - Mod_radios.hpp
// TFAR backpacks from other mods/CDLCs than vanilla and TFAR alone

// CWR3
class cwr3_b_backpack_radio;

class a3a_cwr3_b_backpack_radio : cwr3_b_backpack_radio
{
	scope = 2;
    scopeCurator = 2;
	tf_dialog = "anprc155_radio_dialog;";
	tf_dialogUpdate = "call TFAR_fnc_updateLRDialogToChannel;";
	tf_encryptionCode = "tf_independent_radio_code";
	tf_hasLRradio = 1;
	tf_range = "20000";
	tf_subtype = "digital_lr";
};

// CUP
class CUP_B_Kombat_Radio_Olive;
class CUP_B_Motherlode_Radio_MTP;
class CUP_B_Predator_Radio_MTP;

class a3a_CUP_B_Kombat_Radio_Olive : CUP_B_Kombat_Radio_Olive
{
	scope = 2;
    scopeCurator = 2;
	tf_dialog = "anprc155_radio_dialog;";
	tf_dialogUpdate = "call TFAR_fnc_updateLRDialogToChannel;";
	tf_encryptionCode = "tf_independent_radio_code";
	tf_hasLRradio = 1;
	tf_range = "20000";
	tf_subtype = "digital_lr";
};

class a3a_CUP_B_Motherlode_Radio_MTP : CUP_B_Motherlode_Radio_MTP
{
	scope = 2;
    scopeCurator = 2;
	tf_dialog = "anprc155_radio_dialog;";
	tf_dialogUpdate = "call TFAR_fnc_updateLRDialogToChannel;";
	tf_encryptionCode = "tf_independent_radio_code";
	tf_hasLRradio = 1;
	tf_range = "20000";
	tf_subtype = "digital_lr";
};

class a3a_CUP_B_Predator_Radio_MTP : CUP_B_Predator_Radio_MTP
{
	scope = 2;
    scopeCurator = 2;
	tf_dialog = "anprc155_radio_dialog;";
	tf_dialogUpdate = "call TFAR_fnc_updateLRDialogToChannel;";
	tf_encryptionCode = "tf_independent_radio_code";
	tf_hasLRradio = 1;
	tf_range = "20000";
	tf_subtype = "digital_lr";
};

// RHS
class rhs_r148; // shorter range for small radio

class a3a_rhs_r148 : rhs_r148
{
	scope = 2;
    scopeCurator = 2;
	tf_dialog = "anprc155_radio_dialog;";
	tf_dialogUpdate = "call TFAR_fnc_updateLRDialogToChannel;";
	tf_encryptionCode = "tf_independent_radio_code";
	tf_hasLRradio = 1;
	tf_range = "10000"; 
	tf_subtype = "digital_lr";
};

// Aegis and/or WS
class B_RadioBag_01_coyote_F;
class B_RadioBag_01_oicamo_F;
class B_RadioBag_01_green_F;
class B_RadioBag_01_sage_F;
class B_RadioBag_01_arid_F;
class B_RadioBag_01_taiga_F;
class Aegis_B_RadioBag_01_des_lxWS;

class a3a_B_RadioBag_01_coyote_F : B_RadioBag_01_coyote_F
{
	scope = 2;
    scopeCurator = 2;
	tf_encryptionCode = "tf_independent_radio_code";
};

class a3a_B_RadioBag_01_oicamo_F : B_RadioBag_01_oicamo_F
{
	scope = 2;
    scopeCurator = 2;
	tf_encryptionCode = "tf_independent_radio_code";
};

class a3a_B_RadioBag_01_green_F : B_RadioBag_01_green_F
{
	scope = 2;
    scopeCurator = 2;
	tf_encryptionCode = "tf_independent_radio_code";
};

class a3a_B_RadioBag_01_sage_F : B_RadioBag_01_sage_F
{
	scope = 2;
    scopeCurator = 2;
	tf_encryptionCode = "tf_independent_radio_code";
};

class a3a_B_RadioBag_01_arid_F : B_RadioBag_01_arid_F
{
	scope = 2;
    scopeCurator = 2;
	tf_encryptionCode = "tf_independent_radio_code";
};

class a3a_B_RadioBag_01_taiga_F : B_RadioBag_01_taiga_F
{
	scope = 2;
    scopeCurator = 2;
	tf_encryptionCode = "tf_independent_radio_code";
};

class a3a_Aegis_B_RadioBag_01_des_lxWS : Aegis_B_RadioBag_01_des_lxWS
{
	scope = 2;
    scopeCurator = 2;
	tf_encryptionCode = "tf_independent_radio_code";
};