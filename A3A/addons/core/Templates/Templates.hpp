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
            };

            class LDF
            {
                class camo
                {
                    Default = "Enoch";
                };
            };

            class NATO
            {
                class camo
                {
                    tropical = "Tropical";
                    temperate = "Temperate";
                    Default = "Arid";
                };
            };

            class AAF
            {
                class camo
                {
                    Default = "Arid";
                };
            };

        };

        class Reb
        {
            class FIA
            {
                class camo
                {
                    temperate = "Enoch";
                    Default = "Arid";
                };
            };

            class SDK
            {
                class camo
                {
                    Default = "Tanoa";
                };
            };
        };

        class Civ {}; //leave empty for a single template for this modset, file name would follow: {path}\{Modset}_{Type}.sqf

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

        class AI
        {
            class MACV {};
            class PAVN {};
        };

        class Reb
        {
            class POF {};
        };

        class Civ {};

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

        class AI
        {
            class AFRF
            {
                class camo
                {
                    temperate = "Temperate";
                    Default = "Arid";
                };
            };

            class CDF
            {
                class camo
                {
                    Default = "Temperate";
                };
            };

            class USAF_Army
            {
                displayName = "USAF";
                class camo
                {
                    temperate = "Temperate";
                    Default = "Arid";
                };
            };
            class USAF_Marines
            {
                displayName = "US Marines";
                class camo
                {
                    temperate = "Temperate";
                    Default = "Arid";
                };
            };
        };

        class Reb
        {
            class NAPA
            {
                class camo
                {
                    temperate = "Temperate";
                    Default = "Arid";
                };
            };
        };

        class Civ {};

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

        class AI
        {
            class ADA {};
            class ANA {};
            class CW_SOV {};
            class CW_US {};
            class HIDF {};
            class MDF {};
            class TKA_East {};
            class TKA_Mix {};
            class TKA_West {};
            class AAD {};
            class AAF {
                displayName = "3CB AAF";
            };
        };

        class Reb
        {
            class CNM
            {
                class camo
                {
                    Default = "Temperate";
                };
            };
            class TKM
            {
                class camo
                {
                    Default = "Arid";
                };
            };
        };

        class Civ
        {
            class camo //reserved classname will treate it like camo class in faction rather than faction class
            {
                temperate = "Temperate";
                Default = "Arid";
            };
        };

        class worldDefaults
        {
            class enoch
            {
                Occ = "USAF_Marines";
                Inv = "AFRF";
                Reb = "CNM";
            };
            class chernarus_summer
            {
                Occ = "USAF_Marines";
                Inv = "AFRF";
                Reb = "CNM";
            };
            class vt7
            {
                Occ = "USAF_Marines";
                Inv = "AFRF";
                Reb = "CNM";
            };
            class tembelan
            {
                Occ = "USAF_Marines";
                Inv = "AFRF";
                Reb = "CNM";
            };
            class chernarus_winter
            {
                Occ = "USAF_Marines"; //3cb factions depends on rhs and we nativly support this rhs template so this is safe
                Inv = "AFRF";
                Reb = "CNM";
            };
            class cam_lao_nam
            {
                Occ = "CW_US";
                Inv = "CW_SOV";
                Reb = "CNM";
            };
            class kunduz
            {
                Occ = "ANA";
                Inv = "TKA_East";
                Reb = "TKM";
            };
            class altis
            {
                Occ = "AAF";
                Inv = "TKA_East";
                Reb = "TKM";
            };
            class tanoa
            {
                Occ = "HIDF";
                Inv = "CW_SOV";
                Reb = "CNM";
            };
            class malden
            {
                Occ = "MDF";
                Inv = "TKA_East";
                Reb = "TKM";
            };
            class Default
            {
                Occ = "TKA_West";
                Inv = "TKA_East";
                Reb = "TKM";
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

        class AI
        {
            class BAF {
                class camo
                {
                    arctic = "Arctic";
                    temperate = "Temperate";
                    tropical = "Tropical";
                    Default = "Arid";
                };
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

        requiredAddons[] = {"CUP_BaseConfigs"};
        path = QPATHTOFOLDER(Templates\Templates\CUP);

        class AI
        {
            class ACR
			{
                displayName = "ACR CUP";
				class camo {
                    temperate = "Temperate";
                    Default = "Arid";
				};
			};
			class AFRF
			{
                displayName = "AFRF CUP";
				class camo {
                    arctic = "Arctic";
                    temperate = "Temperate";
                    Default = "Arid";
				};
			};
			class BAF
			{
                displayName = "BAF CUP";
				class camo {
                    temperate = "Temperate";
                    Default = "Arid";
				};
			};
			class CDF
			{
                displayName = "CDF CUP";
				class camo {
                    arctic = "Arctic";
					Default = "Temperate";
				};
			};
			class RACS
			{
                displayName = "RACS CUP";
				class camo {
					Default = "Arid";
				};
			};
			class SLA
			{
                displayName = "SLA CUP";
				class camo {
					Default = "Temperate";
				};
			};
			class TKA
			{
                displayName = "TKA CUP";
				class camo {
					Default = "Arid";
				};
			};
			class US_Army
			{
				displayName = "USAF CUP";
				class camo {
                    temperate = "Temperate";
                    Default = "Arid";
				};
			};
			class US_Marine
			{
				displayName = "USMC CUP";
				class camo {
                    temperate = "Temperate";
                    Default = "Arid";
				};
			};
        };

        class Reb
        {
            class NPC
            {
                displayName = "NPC CUP";
                class camo
                {
                    Default = "Temperate";
                };
            };
			class TKL
            {
                displayName = "TKL CUP";
                class camo
                {
                    Default = "Arid";
                };
            };
        };

        class Civ {};

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
                Inv = "AFRF";
            };
            class chernarus_winter : chernarus_summer {};
            class takistan
            {
                Occ = "TKA";
                Inv = "AFRF";
                Reb = "TKL";
            };
            class kunduz : takistan {};

            class sara
            {
                Occ = "RACS";
                Inv = "SLA";
            };
            class Default
            {
                Occ = "US_Army";
                Inv = "AFRF";
                Reb = "NPC";
            };
        };


        Nodes[] = {"CUP_Logistics_Nodes.sqf"};
    };
};