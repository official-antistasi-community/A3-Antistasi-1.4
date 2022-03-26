#include "..\..\dialogues\ids.inc"
#include "..\..\dialogues\defines.hpp"
#include "..\..\dialogues\textures.inc"
#include "..\..\script_component.hpp"

private _display = findDisplay A3A_IDD_FACTIONSELECTORDIALOG;


// array
private _CUPtemplates = [
	["ACR (ARID)","cup\baseconfigs\cup_baseconfigs\data\flags\flag_cz_co.paa"],
	["ACR (TEMPERATE)","cup\baseconfigs\cup_baseconfigs\data\flags\flag_cz_co.paa"],
	["AFRF (ARCTIC)","\CUP\BaseConfigs\CUP_BaseConfigs\data\Flags\flag_rus_co.paa"],
	["AFRF (ARID)","\CUP\BaseConfigs\CUP_BaseConfigs\data\Flags\flag_rus_co.paa"],
	["ARFR (TEMPERATE)","\CUP\BaseConfigs\CUP_BaseConfigs\data\Flags\flag_rus_co.paa"],
	["BAF (ARID)","\A3\Data_F\Flags\flag_uk_co.paa"],
	["BAF (TEMPERATE)","\A3\Data_F\Flags\flag_uk_co.paa"],
	["CDF (ARCTIC)","cup\baseconfigs\cup_baseconfigs\data\flags\flag_cdf_co.paa"],
	["CDF (TEMPERATE)","cup\baseconfigs\cup_baseconfigs\data\flags\flag_cdf_co.paa"],
	["ION (ARCTIC)","\CUP\BaseConfigs\CUP_BaseConfigs\data\Flags\flag_ion_black_co.paa"],
	["ION (ARID)","\CUP\BaseConfigs\CUP_BaseConfigs\data\Flags\flag_ion_black_co.paa"],
	["RACS (TROPICAL)","\CUP\BaseConfigs\CUP_BaseConfigs\data\Flags\flag_racs_co.paa"],
	["RACS (TEMPERATE)","\CUP\BaseConfigs\CUP_BaseConfigs\data\Flags\flag_racs_co.paa"],
	["SLA (TEMPERATE)","\CUP\BaseConfigs\CUP_BaseConfigs\data\Flags\flag_sla_co.paa"],
	["TKA (ARID)","\CUP\BaseConfigs\CUP_BaseConfigs\data\Flags\flag_tka_co.paa"],
	["US ARMY (ARID)","a3\data_f\flags\flag_us_co.paa"],
	["US ARMY (TEMPERATE)","a3\data_f\flags\flag_us_co.paa"],
	["US MARINE (ARID)","a3\data_f\flags\flag_us_co.paa"],
	["US MARINE (TEMPERATE)","a3\data_f\flags\flag_us_co.paa"]
];

private _CUPrebtemplates = [
	["NPC", "\CUP\BaseConfigs\CUP_BaseConfigs\data\Flags\flag_napa_co.paa"],
	["TKL", "\CUP\BaseConfigs\CUP_BaseConfigs\data\Flags\flag_tkg_co.paa"]
];

private _CUPcivtemplates = [
	["CUP","\CUP\Creatures\People\CUP_Creatures_People_Core\ui\logo_cup_ca_small.paa"]
];

private _VANILLAtemplates = [
	["AAF", "a3\data_f\flags\flag_aaf_co.paa"],
	["CSAT (ARID)", "A3\Data_F\Flags\Flag_CSAT_CO.paa"],
	["CSAT (ENOCH)", "A3\Data_F\Flags\Flag_CSAT_CO.paa"],
	["CSAT (TROPICAL)", "A3\Data_F\Flags\Flag_CSAT_CO.paa"],
	["LDF", "a3\data_f_enoch\flags\flag_enoch_co.paa"],
	["NATO (ARID)", "\A3\Data_F\Flags\Flag_NATO_CO.paa"],
	["NATO (TEMPERATE)", "\A3\Data_F\Flags\Flag_NATO_CO.paa"],
	["NATO (TROPICAL)", "\A3\Data_F\Flags\Flag_NATO_CO.paa"]
];

private _VNtemplates = [
	["MACV","vn\objects_f_vietnam\flags\data\vn_flag_01_usa_co.paa"],
	["PAVN","vn\objects_f_vietnam\flags\data\vn_flag_01_pavn_co.paa"]
];

private _RHStemplates = [
	["AFRF (ARID)", "rhsafrf\addons\rhs_main\data\flag_rus_co.paa"],
	["AFRF (TEMPERATE)", "rhsafrf\addons\rhs_main\data\flag_rus_co.paa"],
	["CDF", "\rhsgref\addons\rhsgref_main\data\Flags\flag_cdf_co.paa"],
	["USAF ARMY", "a3\data_f\flags\flag_us_co.paa"],
	["USAF ARMY", "a3\data_f\flags\flag_us_co.paa"],
	["USAF MARINES", "a3\data_f\flags\flag_us_co.paa"],
	["USAF MARINES", "a3\data_f\flags\flag_us_co.paa"]
];

private _3CBtemplates = [
	["AAF", "a3\data_f\flags\flag_aaf_co.paa"],
	["ADA", "uk3cb_factions\addons\uk3cb_factions_adc\flag\adc_flag_co.paa"],
	["ANA", "uk3cb_factions\addons\uk3cb_factions_ana\flag\afg_13_flag_co.paa"],
	["BAF (ARCTIC)", "\A3\Data_F\Flags\flag_uk_co.paa"],
	["BAF (ARID)", "\A3\Data_F\Flags\flag_uk_co.paa"],
	["BAF (TEMPERATE)", "\A3\Data_F\Flags\flag_uk_co.paa"],
	["BAF (TROPICAL)", "\A3\Data_F\Flags\flag_uk_co.paa"],
	["CW SOV", "uk3cb_factions\addons\uk3cb_factions_cw_sov\flag\cw_sov_army_flag_co.paa"],
	["CW US", "a3\data_f\flags\flag_us_co.paa"],
	["HIDF", "a3\data_f_exp\flags\flag_tanoa_co.paa"],
	["MDF", "uk3cb_factions\addons\uk3cb_factions_mdf\flag\mal_flag_co.paa"]
	["TKA EAST", "UK3CB_Factions\addons\UK3CB_Factions_TKA\Flag\tka_flag_co.paa"],
	["TKA MIX", "UK3CB_Factions\addons\UK3CB_Factions_TKA\Flag\tka_flag_co.paa"],
	["TKA WEST", "UK3CB_Factions\addons\UK3CB_Factions_TKA\Flag\tka_flag_co.paa"]
];



// get the listBox IDC
private _rebelsList = _display displayCtrl A3A_IDC_REBELSLISTBOX;
private _occupantsList = _display displayCtrl A3A_IDC_OCCUPANTSLISTBOX;
private _invadersList = _display displayCtrl A3A_IDC_INVADERSLISTBOX;
private _civiliansList = _display displayCtrl A3A_IDC_CIVILIANSLISTBOX;


// get the text idc 
private _addonPackText = _display displayCtrl A3A_IDC_ADDONPACKSTEXT;
private _infoText = _display displayCtrl A3A_IDC_INFOTEXT;

// find addons
private _infoTextField = "";
if (A3A_hasRHS) then {
	_infoTextField = _infoTextField + "RHS DETECTED \n";
		{
		private _indexInvaders = _invadersList lbAdd _x # 0;
		_invadersList lbSetPicture [_indexInvaders, _x # 1];
		_invadersList lbSetPictureRight [_indexInvaders, "\CUP\Creatures\People\CUP_Creatures_People_Core\ui\logo_cup_ca_small.paa"];

		private _indexOccupants = _occupantsList lbAdd _x # 0;
		_occupantsList lbSetPicture [_indexOccupants, _x # 1];
		_occupantsList lbSetPictureRight [_indexOccupants, "\CUP\Creatures\People\CUP_Creatures_People_Core\ui\logo_cup_ca_small.paa"];
	} forEach _CUPtemplates;

	{
		private _indexRebels = _rebelsList lbAdd _x # 0;
		_rebelsList lbSetPicture [_indexRebels, _x # 1];
		_rebelsList lbSetPictureRight [_indexRebels, "\CUP\Creatures\People\CUP_Creatures_People_Core\ui\logo_cup_ca_small.paa"];
	} forEach _CUPrebtemplates;

	{
		private _indexCivs = _civiliansList lbAdd _x # 0;
		_civiliansList lbSetPicture [_indexCivs, _x # 1];
		_civiliansList lbSetPictureRight [_indexCivs, "\CUP\Creatures\People\CUP_Creatures_People_Core\ui\logo_cup_ca_small.paa"];
	} forEach _CUPcivtemplates;
};

if (A3A_has3CBFactions) then {
	_infoTextField = _infoTextField + "3CB Factions DETECTED \n";
		{
		private _indexInvaders = _invadersList lbAdd _x # 0;
		_invadersList lbSetPicture [_indexInvaders, _x # 1];
		_invadersList lbSetPictureRight [_indexInvaders, "\CUP\Creatures\People\CUP_Creatures_People_Core\ui\logo_cup_ca_small.paa"];

		private _indexOccupants = _occupantsList lbAdd _x # 0;
		_occupantsList lbSetPicture [_indexOccupants, _x # 1];
		_occupantsList lbSetPictureRight [_indexOccupants, "\CUP\Creatures\People\CUP_Creatures_People_Core\ui\logo_cup_ca_small.paa"];
	} forEach _CUPtemplates;

	{
		private _indexRebels = _rebelsList lbAdd _x # 0;
		_rebelsList lbSetPicture [_indexRebels, _x # 1];
		_rebelsList lbSetPictureRight [_indexRebels, "\CUP\Creatures\People\CUP_Creatures_People_Core\ui\logo_cup_ca_small.paa"];
	} forEach _CUPrebtemplates;

	{
		private _indexCivs = _civiliansList lbAdd _x # 0;
		_civiliansList lbSetPicture [_indexCivs, _x # 1];
		_civiliansList lbSetPictureRight [_indexCivs, "\CUP\Creatures\People\CUP_Creatures_People_Core\ui\logo_cup_ca_small.paa"];
	} forEach _CUPcivtemplates;
};

if (A3A_has3CBBAF) then {
	_infoTextField = _infoTextField + "3CB BAF DETECTED \n";
		{
		private _indexInvaders = _invadersList lbAdd _x # 0;
		_invadersList lbSetPicture [_indexInvaders, _x # 1];
		_invadersList lbSetPictureRight [_indexInvaders, "\CUP\Creatures\People\CUP_Creatures_People_Core\ui\logo_cup_ca_small.paa"];

		private _indexOccupants = _occupantsList lbAdd _x # 0;
		_occupantsList lbSetPicture [_indexOccupants, _x # 1];
		_occupantsList lbSetPictureRight [_indexOccupants, "\CUP\Creatures\People\CUP_Creatures_People_Core\ui\logo_cup_ca_small.paa"];
	} forEach _CUPtemplates;

	{
		private _indexRebels = _rebelsList lbAdd _x # 0;
		_rebelsList lbSetPicture [_indexRebels, _x # 1];
		_rebelsList lbSetPictureRight [_indexRebels, "\CUP\Creatures\People\CUP_Creatures_People_Core\ui\logo_cup_ca_small.paa"];
	} forEach _CUPrebtemplates;

	{
		private _indexCivs = _civiliansList lbAdd _x # 0;
		_civiliansList lbSetPicture [_indexCivs, _x # 1];
		_civiliansList lbSetPictureRight [_indexCivs, "\CUP\Creatures\People\CUP_Creatures_People_Core\ui\logo_cup_ca_small.paa"];
	} forEach _CUPcivtemplates;
};

if (A3A_hasVN) then {
	_infoTextField = _infoTextField + "VN (SOG) DETECTED \n";
		{
		private _indexInvaders = _invadersList lbAdd _x # 0;
		_invadersList lbSetPicture [_indexInvaders, _x # 1];
		_invadersList lbSetPictureRight [_indexInvaders, "\CUP\Creatures\People\CUP_Creatures_People_Core\ui\logo_cup_ca_small.paa"];

		private _indexOccupants = _occupantsList lbAdd _x # 0;
		_occupantsList lbSetPicture [_indexOccupants, _x # 1];
		_occupantsList lbSetPictureRight [_indexOccupants, "\CUP\Creatures\People\CUP_Creatures_People_Core\ui\logo_cup_ca_small.paa"];
	} forEach _CUPtemplates;

	{
		private _indexRebels = _rebelsList lbAdd _x # 0;
		_rebelsList lbSetPicture [_indexRebels, _x # 1];
		_rebelsList lbSetPictureRight [_indexRebels, "\CUP\Creatures\People\CUP_Creatures_People_Core\ui\logo_cup_ca_small.paa"];
	} forEach _CUPrebtemplates;

	{
		private _indexCivs = _civiliansList lbAdd _x # 0;
		_civiliansList lbSetPicture [_indexCivs, _x # 1];
		_civiliansList lbSetPictureRight [_indexCivs, "\CUP\Creatures\People\CUP_Creatures_People_Core\ui\logo_cup_ca_small.paa"];
	} forEach _CUPcivtemplates;
};

if (A3A_hasCUP) then {
	_infoTextField = _infoTextField + "CUP DETECTED \n";
	{
		private _indexInvaders = _invadersList lbAdd _x # 0;
		_invadersList lbSetPicture [_indexInvaders, _x # 1];
		_invadersList lbSetPictureRight [_indexInvaders, "\CUP\Creatures\People\CUP_Creatures_People_Core\ui\logo_cup_ca_small.paa"];

		private _indexOccupants = _occupantsList lbAdd _x # 0;
		_occupantsList lbSetPicture [_indexOccupants, _x # 1];
		_occupantsList lbSetPictureRight [_indexOccupants, "\CUP\Creatures\People\CUP_Creatures_People_Core\ui\logo_cup_ca_small.paa"];
	} forEach _CUPtemplates;

	{
		private _indexRebels = _rebelsList lbAdd _x # 0;
		_rebelsList lbSetPicture [_indexRebels, _x # 1];
		_rebelsList lbSetPictureRight [_indexRebels, "\CUP\Creatures\People\CUP_Creatures_People_Core\ui\logo_cup_ca_small.paa"];
	} forEach _CUPrebtemplates;

	{
		private _indexCivs = _civiliansList lbAdd _x # 0;
		_civiliansList lbSetPicture [_indexCivs, _x # 1];
		_civiliansList lbSetPictureRight [_indexCivs, "\CUP\Creatures\People\CUP_Creatures_People_Core\ui\logo_cup_ca_small.paa"];
	} forEach _CUPcivtemplates;
}; 

// addInfo to addonPacks
_addonPackText ctrlSetText _infoTextField;