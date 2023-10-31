    class CW_Base
    {
        requiredAddons[] = {"3AS_Characters", "442_equipment", "SWLB_clones", "JLTS_core", "CWDependencies"};
        basepath = QPATHTOFOLDER(Templates\Templates\CW);
        logo = "\LS_statics_props\flags\data\flag_republic.paa";
        priority = 100;
    };

    class CW_REP : CW_Base
    {
        side = "Occ";
        flagTexture = "\LS_statics_props\flags\data\flag_republic.paa";
        name = "Republic";
        file = "CW_AI_REP";
    };

    class CW_CIS : CW_Base
    {
        side = "Inv";
        flagTexture = "\LS_statics_props\flags\data\flag_cis.paa";
        name = "CIS";
        file = "CW_AI_CIS";
    };

    class CW_REP_WBK : CW_Base
    {
        requiredAddons[] = {"3AS_Characters", "442_equipment", "SWLB_clones", "JLTS_core", "CWDependencies", "WBK_Lightsabers"};
        side = "Occ";
        flagTexture = "\LS_statics_props\flags\data\flag_republic.paa";
        name = "Republic (WBK)";
        file = "CW_AI_REP_WBK";
    };

    class CW_CIS_WBK : CW_Base
    {
        requiredAddons[] = {"3AS_Characters", "442_equipment", "SWLB_clones", "JLTS_core", "CWDependencies", "WBK_DifferentRobotics_1"};
        side = "Inv";
        flagTexture = "\LS_statics_props\flags\data\flag_cis.paa";
        name = "CIS (WBK)";
        file = "CW_AI_CIS_WBK";
    };
    
    class CW_MAN : CW_Base
    {
        side = "Reb";
        flagTexture = "\LS_statics_props\flags\data\flag_mandalorian.paa";
        name = "Mandalorians";
        file = "CW_Reb_MAND";
        description = "This faction is comprised of mandalorian remnants. People who used to be affiliated with the old clans, but since went underground. They start with basically nothing. A pistol, their helmets, and the clothes on their backs.";
    };
	
    class CW_RIV_DET : CW_Base
    {
        side = "Riv";
        flagTexture = "\LS_statics_props\flags\data\flag_mandalorian.paa";
        name = "CW Deathwatch";
        file = "CW_Riv_DET";
        description = "This faction is comprised of mandalorian deathwatch. People who opposed the peaceful way of mandalorian life, and all the different clans. They are already well established.";
    };
	
    class EMP_Base
    {
        requiredAddons[] = {"3AS_Characters", "442_equipment", "SWLB_clones", "JLTS_core", "CWDependencies", "JMSLLTE_empire_mod"};
        basepath = QPATHTOFOLDER(Templates\Templates\CW);
        logo = QPATHTOFOLDER(Templates\Templates\CW\flag_Empire.paa);
        priority = 100;
    };

    class EMP_EMP : EMP_Base
    {
        side = "Occ";
        flagTexture = QPATHTOFOLDER(Templates\Templates\CW\flag_Empire.paa);
        name = "Empire";
        file = "EMP_AI_EMP";
    };
	
    class EMP_EMP_WBK : EMP_Base
    {
        requiredAddons[] = {"3AS_Characters", "442_equipment", "SWLB_clones", "JLTS_core", "CWDependencies", "JMSLLTE_empire_mod", "WBK_Lightsabers"};
        side = "Occ";
        flagTexture = QPATHTOFOLDER(Templates\Templates\CW\flag_Empire.paa);
        name = "Empire (WBK)";
        file = "EMP_AI_EMP_WBK";
    };
	
    class EMP_RIV_GP : EMP_Base
    {
        side = "Riv";
		flagTexture = QPATHTOFOLDER(Templates\Templates\CW\flag_partisans.paa);
        name = "EMP Partisans";
        file = "EMP_Riv_GP";
        description = "Saw Gerrera's Partisans are an extremely militant, anti-imperial group, willing to use any and all tactics against their enemies.";
    };
	
    class EMP_Civ : EMP_Base
    {
        side = "Civ";
        flagTexture = QPATHTOFOLDER(Templates\Templates\CW\flag_Empire.paa);
        name = "EMP Civ";
        file = "EMP_Civ";
    };