class CfgPatches 
{
    class ADDON {
        name = COMPONENT_NAME;
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = 
		{
			"A3_Characters_F",
			"A3_Data_F",
			"A3_Weapons_F"
		};
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
        units[] = {};
        weapons[] = {};
    };
};