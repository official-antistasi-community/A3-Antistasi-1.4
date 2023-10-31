    //***************************** Unsung *****************************

    class UNS_Base
    {
        requiredAddons[] = {"uns_weap_w"};
        basepath = QPATHTOFOLDER(Templates\Templates\UNS);
        logo = "\uns_main\data\unsung_logo.paa";
        priority = 70;
        equipFlags[] = {"lowTech"};
    };

    class UNS_US : UNS_Base
    {
        side = "Inv";
        flagTexture = "a3\data_f\flags\flag_us_co.paa";
        name = "Unsung US";
        file = "UNS_AI_US";
    };

    class UNS_PAVN : UNS_Base
    {
        side = "Occ";
        flagTexture = "\uns_flags\flag_pavn_co.paa";
        name = "Unsung PAVN";
        file = "UNS_AI_PAVN";
    };

    class UNS_VC : UNS_Base
    {
        side = "Reb";
        flagTexture = "\uns_flags\flag_vc_co.paa";
        name = "Unsung VC";
        file = "UNS_Reb_VC";
    };

    class UNS_Civ : UNS_Base
    {
        side = "Civ";
        flagTexture = "a3\data_f\flags\flag_fia_co.paa";
        name = "Unsung civs";
        file = "UNS_Civ";
    };
	
	class UNS_RIV_SVR : UNS_Base
    {
        side = "Riv";
        flagTexture = "\uns_flags\flag_pavn_co.paa";
        name = "SV Resistance";
        file = "UNS_Riv_SVR";
    };