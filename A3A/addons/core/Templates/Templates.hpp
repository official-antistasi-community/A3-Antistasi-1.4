class Templates
{
    class Vanilla
    {
        priorityOcc = 1; //highest is favored when auto picking
        priorityInv = 1; //highest is favored when auto picking
        priorityReb = 1; //highest is favored when auto picking
        priorityCiv = 1; //highest is favored when auto picking

        requiredAddons[] = {}; //the cfgPatches class of the mod these templates are depending on
        path = QPATHTOFOLDER(Templates\Templates\Vanilla); //the path to the template folder
        logo = "a3\ui_f\data\logos\arma3_white_ca.paa";

        //Type class: AI, Reb, Civ
        class AI
        {
            //optional file overwrite set the `file` attribute here, whitout file extension, overwrites path aswell (ignored in this scope when factions calsses are defined)
            // note if `file` is set it becomes the following: {file}.sqf

            //for multiple templates per modset add the classes of faction names in the type class
            class CSAT
            { //template file name would follow: {path}\{Modset}_{Type}_{Faction}.sqf
                //optional file overwrite set the `file` attribute here, whitout file extension
                // note if `file` is set it becomes the following: {file}.sqf

                // camo determined by climate. climates: arid, tropical, temperate, arctic
                class camo
                { //template file name would follow: {path}\{Modset}_{Type}_{Faction}_{camo}.sqf
                // note if `file` is set it becomes the following: {file}_{camo}.sqf
                    tropical = "Tropical";
                    temperate = "Enoch";
                    Default = "Arid"; //default is the fallback if the climate is not in this class
                };
                flagTexture = "A3\Data_F\Flags\Flag_CSAT_CO.paa";
            };

            class LDF {
                flagTexture = "a3\data_f_enoch\flags\flag_enoch_co.paa";
            };

            class NATO
            {
                class camo
                {
                    arid = "Arid"
                    tropical = "Tropical";
                    Default = "Temperate";
                };
                flagTexture = "\A3\Data_F\Flags\Flag_NATO_CO.paa";
            };

            class AAF {
                flagTexture = "a3\data_f\flags\flag_aaf_co.paa";
            };

        };

        class Reb
        {
            class FIA {
                flagTexture = "a3\data_f\flags\flag_fia_co.paa";
            };

            class SDK {
                flagTexture = "\A3\Data_F_exp\Flags\Flag_Synd_CO.paa";
            };
        };

        class Civ {
            flagTexture = "a3\data_f\flags\flag_aaf_co.paa";
        }; //leave empty for a single template for this modset, file name would follow: {path}\{Modset}_{Type}.sqf

        //default template selection, classes within are worldname with side properties with faction name assigned to it (or empty when only one available)
        class worldDefaults
        {
            class Default
            {
                Occ = "NATO";
                Inv = "CSAT";
                Reb = "FIA";
                //Civ left out because we use only one available as there are not multiple civ factions
            };

            class altis: Default
            {
                Occ = "AAF";
            };

            class tanoa: Default
            {
                Reb = "SDK";
            };

            class enoch: Default
            {
                Occ = "LDF";
            };
        };

        //temporary soulution to load logistics nodes (pending logistics data convertion to class based) add full filename
        Nodes[] = {"Vanilla_Logistics_Nodes.sqf"};
    };

    class VN
    {
        priorityOcc = 2;
        priorityInv = 2;
        priorityReb = 2;
        priorityCiv = 2;

        requiredAddons[] = {"vn_weapons"};
        path = QPATHTOFOLDER(Templates\Templates\VN);
        logo = "\vn\data_f_vietnam\logos\vn_sml_ca.paa";
        class AI
        {
            class MACV {
                flagTexture = "vn\objects_f_vietnam\flags\data\vn_flag_01_usa_co.paa";
            };
            class PAVN {
                flagTexture = "vn\objects_f_vietnam\flags\data\vn_flag_01_pavn_co.paa";
            };
        };

        class Reb
        {
            class POF {
                flagTexture = "vn\objects_f_vietnam\flags\data\vn_flag_01_lao_dmg_ca.paa"
            };
        };

        class Civ {
            flagTexture = "\vn\objects_f_vietnam\flags\vn_flag_01_lao_co.paa";
        };

        class worldDefaults
        {
            class Default
            {
                Occ = "PAVN";
                Inv = "MACV";
                Reb = "POF";
            };
        };

        Nodes[] = {"VN_Logistics_Nodes.sqf"};
    };

    class RHS
    {
        priorityOcc = 3;
        priorityInv = 3;
        priorityReb = 3;
        priorityCiv = 3;

        requiredAddons[] = {"rhsgref_main"};// this requires usaf and afrf internaly so coveres all 3
        path = QPATHTOFOLDER(Templates\Templates\RHS);
        logo = "\rhsusf\addons\rhsusf_main\data\rhs_logo_ca.paa";

        class AI
        {
            class AFRF
            {
                class camo
                {
                    arid = "Arid";
                    Default = "Temperate";
                };
                flagTexture = "rhsafrf\addons\rhs_main\data\flag_rus_co.paa";
            };

            class CDF {
                flagTexture = "\rhsgref\addons\rhsgref_main\data\Flags\flag_cdf_co.paa";
            };

            class USAF_Army
            {
                displayName = "USAF";
                class camo
                {
                    arid = "Arid";
                    Default = "Temperate";
                };
                flagTexture = "a3\data_f\flags\flag_us_co.paa";
            };
            class USAF_Marines
            {
                displayName = "US Marines";
                class camo
                {
                    arid = "Arid";
                    Default = "Temperate";
                };
                flagTexture = "a3\data_f\flags\flag_us_co.paa";
            };
        };

        class Reb
        {
            class NAPA {
                flagTexture = "a3\data_f\flags\flag_fia_co.paa";
            };
        };

        class Civ {
            flagTexture = "a3\data_f\flags\flag_fia_co.paa";
        };

        class worldDefaults
        {
            class Default
            {
                Occ = "USAF";
                Inv = "AFRF";
                Reb = "NAPA";
            };

            class chernarus_summer : Default
            {
                Occ = "CDF";
            };
            class chernarus_winter : chernarus_summer {};
        };

        Nodes[] = {"RHS_Logistics_Nodes.sqf"};
    };

    class Factions
    {
        variantOf = "3CB";
        priorityOcc = 4;
        priorityInv = 4;
        priorityReb = 4;
        priorityCiv = 4;

        requiredAddons[] = {"UK3CB_Factions_Vehicles_SUV"};
        path = QPATHTOFOLDER(Templates\Templates\3CB);
        logo = "logo_small_3cb_ca.paa"; // that probably won't work
        class AI
        {
            class ADA {
                flagTexture = "uk3cb_factions\addons\uk3cb_factions_adc\flag\adc_flag_co.paa";
            };
            class ANA {
                flagTexture = "uk3cb_factions\addons\uk3cb_factions_ana\flag\afg_13_flag_co.paa";
            };
            class CW_SOV {
                flagTexture = "uk3cb_factions\addons\uk3cb_factions_cw_sov\flag\cw_sov_army_flag_co.paa";
            };
            class CW_US {
                flagTexture = "a3\data_f\flags\flag_us_co.paa";
            };
            class HIDF {
                flagTexture = "a3\data_f_exp\flags\flag_tanoa_co.paa";
            };
            class MDF {
                flagTexture = "uk3cb_factions\addons\uk3cb_factions_mdf\flag\mal_flag_co.paa";
            };
            class TKA_East {
                flagTexture = "UK3CB_Factions\addons\UK3CB_Factions_TKA\Flag\tka_flag_co.paa";
            };
            class TKA_Mix {
                flagTexture = "UK3CB_Factions\addons\UK3CB_Factions_TKA\Flag\tka_flag_co.paa";
            };
            class TKA_West {
                flagTexture = "UK3CB_Factions\addons\UK3CB_Factions_TKA\Flag\tka_flag_co.paa";
            };
            class AAF {
                displayName = "3CB AAF";
                flagTexture = "a3\data_f\flags\flag_aaf_co.paa";
            };
        };

        class Reb
        {
            class CNM {
                flagTexture = "\UK3CB_Factions\addons\UK3CB_Factions_CCM\Flag\ccm_i_flag_co.paa";
            };
            class TKM {
                flagTexture = "uk3cb_factions\addons\uk3cb_factions_tkm\flag\tkm_b_flag_co.paa";
            };
        };

        class Civ
        {
            flagTexture = "a3\data_f\flags\flag_fia_co.paa";
            class CHC {
                displayName = "Chernarussian Civilians";
            };
            class TKC {
                displayName = "Takistani Civilians";
            };
        };

        class worldDefaults
        {
            class cam_lao_nam
            {
                Occ = "CW_US";
                Inv = "CW_SOV";
            };
            class kunduz
            {
                Occ = "ANA";
                Inv = "TKA_East";
                Reb = "TKM";
                Civ = "TKC"
            };
            class tem_anizay : kunduz {};
            class altis
            {
                Occ = "AAF";
                Inv = "ADA";
            };
            class takistan
            {
                Occ = "TKA_West";
                Inv = "TKA_East";
                Reb = "TKM";
                Civ = "TKC"
            };
            class tanoa
            {
                Occ = "HIDF";
                Inv = "CW_SOV";
            };
            class malden
            {
                Occ = "MDF";
                Inv = "ANA";
            };
            class Default
            {
                Reb = "CNM";
                Civ = "CHC";
            };
        };

        Nodes[] = {"3CBFactions_Logistics_Nodes.sqf"};
    };

    class BAF
    {
        variantOf = "3CB";
        priorityOcc = 5;
        priorityInv = 5;
        priorityReb = 5;
        priorityCiv = 5;

        requiredAddons[] = {
            "UK3CB_BAF_Weapons"
            ,"UK3CB_BAF_Vehicles"
            ,"UK3CB_BAF_Units_Common"
            ,"UK3CB_BAF_Equipment"
        };
        path = QPATHTOFOLDER(Templates\Templates\3CB);
        logo = "logo_small_3cb_ca.paa"; // that probably won't work

        class AI
        {
            class BAF {
                class camo
                {
                    arctic = "Arctic";
                    arid = "Arid";
                    tropical = "Tropical";
                    Default = "Temperate";
                };
                flagTexture = "\A3\Data_F\Flags\flag_uk_co.paa";
            };
        };

        class worldDefaults
        {
            class Default {
                Occ = "BAF";
            };
        };

        Nodes[] = {"3CBBAF_Logistics_Nodes.sqf"};
    };
    class CUP
    {
        priorityOcc = 6;
        priorityInv = 6;
        priorityReb = 6;
        priorityCiv = 6;

        requiredAddons[] = {"CUP_Creatures_People_Civil_Russia", "CUP_BaseConfigs", "CUP_AirVehicles_Core"};        // units, weapons, vehicles
        path = QPATHTOFOLDER(Templates\Templates\CUP);
        logo = "\CUP\Creatures\People\CUP_Creatures_People_Core\ui\logo_cup_ca_small.paa";

        class AI
        {
            class ACR
			{
                displayName = "ACR CUP";
				class camo {
                    arid = "Arid";
                    Default = "Temperate";
				};
                flagTexture = "cup\baseconfigs\cup_baseconfigs\data\flags\flag_cz_co.paa";
			};
			class AFRF
			{
                displayName = "AFRF CUP";
				class camo {
                    arctic = "Arctic";
                    arid = "Arid";
                    Default = "Temperate";
				};
                flagTexture = "\CUP\BaseConfigs\CUP_BaseConfigs\data\Flags\flag_rus_co.paa";
			};
			class BAF
			{
                displayName = "BAF CUP";
				class camo {
                    arid = "Arid";
                    Default = "Temperate";
				};
                flagTexture = "\A3\Data_F\Flags\flag_uk_co.paa";
			};
			class CDF
			{
                displayName = "CDF CUP";
				class camo {
                    arctic = "Arctic";
					Default = "Temperate";
				};
                flagTexture = "cup\baseconfigs\cup_baseconfigs\data\flags\flag_cdf_co.paa";
			};
			class RACS
			{
                displayName = "RACS CUP";
				class camo {
                    arid = "Arid";
					Default = "Tropical";
				};
                flagTexture = "\CUP\BaseConfigs\CUP_BaseConfigs\data\Flags\flag_racs_co.paa";
			};
			class SLA
			{
                displayName = "SLA CUP";
				class camo {
					Default = "Temperate";
				};
                flagTexture = "\CUP\BaseConfigs\CUP_BaseConfigs\data\Flags\flag_sla_co.paa";
			};
			class TKA
			{
                displayName = "TKA CUP";
				class camo {
					Default = "Arid";
				};
                flagTexture = "\CUP\BaseConfigs\CUP_BaseConfigs\data\Flags\flag_tka_co.paa";
			};
			class US_Army
			{
				displayName = "USAF CUP";
				class camo {
                    arid = "Arid"
                    Default = "Temperate";
				};
                flagTexture = "a3\data_f\flags\flag_us_co.paa";
			};
			class US_Marine
			{
				displayName = "USMC CUP";
				class camo {
                    arid = "Arid"
                    Default = "Temperate";
				};
                flagTexture = "a3\data_f\flags\flag_us_co.paa";
			};
            class ION
			{
				displayName = "ION CUP";
				class camo {
                    arctic = "Arctic";
                    Default = "Arid";
				};
                flagTexture = "\A3\Data_F\Flags\flag_ion_CO.paa";
			};
        };

        class Reb {
            flagTexture = "cup\baseconfigs\cup_baseconfigs\data\flags\flag_napa_co.paa";
        };
    

        class Civ {
            flagTexture = "a3\data_f\flags\flag_fia_co.paa";
        };

        class worldDefaults
        {
            class enoch
            {
                Occ = "ACR";
                Inv = "AFRF";
            };
            class chernarus_summer
            {
                Occ = "CDF";
                Inv = "AFRF";
            };
            class vt7
            {
                Occ = "ACR";
                Inv = "BAF";
            };
            class chernarus_winter
            {
                Occ = "CDF";
                Inv = "AFRF";
            };
            class takistan
            {
                Occ = "TKA";
                Inv = "US_Army";
            };
            class kunduz : takistan {};
            class sara
            {
                Occ = "RACS";
                Inv = "SLA";
            };
            class tanoa
            {
                Occ = "RACS";
                Inv = "US_Marine";
            };
            class malden
            {
                Occ = "ION";
                Inv = "US_Marine";
            };
            class Default
            {
                Occ = "ACR";
                Inv = "ION";
            };
        };


        Nodes[] = {"CUP_Logistics_Nodes.sqf"};
    };
};