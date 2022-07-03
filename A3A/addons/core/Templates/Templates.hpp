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
                    arid = "Arid";
                    Default = "Temperate"; //default is the fallback if the climate is not in this class
                };
            };

            class CSAT_Apex {};

            class CSAT_Enoch {};

            class LDF {};

            class NATO
            {
                class camo
                {
                    arid = "Arid";
                    tropical = "Tropical";
                    Default = "Temperate";
                };
            };

            class NATO_Apex {};

            class AAF {};

        };

        class Reb
        {
            class FIA {};

            class SDK {};
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
                Occ = "NATO_Apex";
                Inv = "CSAT_Apex";
                Reb = "SDK";
            };

            class enoch: Default
            {
                Occ = "LDF";
                Inv = "CSAT_Enoch";
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
                    arid = "Arid";
                    Default = "Temperate";
                };
            };

            class CDF {};

            class USAF_Army
            {
                displayName = "USAF";
                class camo
                {
                    arid = "Arid";
                    arctic = "Arctic";
                    Default = "Temperate";
                };
            };
            class USAF_Marines
            {
                displayName = "US Marines";
                class camo
                {
                    arid = "Arid";
                    Default = "Temperate";
                };
            };
        };

        class Reb
        {
            class NAPA {};
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
            class KRG {};
            class AAF {
                displayName = "3CB AAF";
            };
            class LDF {
                displayname = "3CB LDF"
            };
        };

        class Reb
        {
            class CNM {};
            class TKM {};
        };

        class Civ
        {
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
            class enoch
            {
                Occ = "LDF";
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

        class AI
        {
            class ACR
			{
                displayName = "ACR CUP";
				class camo {
                    arid = "Arid";
                    Default = "Temperate";
				};
			};
			class AFRF
			{
                displayName = "AFRF CUP";
				class camo {
                    arctic = "Arctic";
                    arid = "Arid";
                    Default = "Temperate";
				};
			};
			class BAF
			{
                displayName = "BAF CUP";
				class camo {
                    arid = "Arid";
                    Default = "Temperate";
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
                    arid = "Arid";
					Default = "Tropical";
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
                    arid = "Arid"
                    Default = "Temperate";
				};
			};
			class US_Marine
			{
				displayName = "USMC CUP";
				class camo {
                    arid = "Arid"
                    Default = "Temperate";
				};
			};
            class ION
			{
				displayName = "ION CUP";
				class camo {
                    arctic = "Arctic";
                    Default = "Arid";
				};
			};
        };

        class Reb {};
    

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