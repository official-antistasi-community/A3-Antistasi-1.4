    class TFC_Base
    {
        requiredAddons[] = {"TFC_Core_Data", "TFC_CA_Characters", "TFC_SF_Characters", "tfc_rcaf_cc130j"};
        basepath = QPATHTOFOLDER(Templates\Templates\TFC);
        logo = QPATHTOFOLDER(Pictures\antistasi_ultimate_logo.paa);
        priority = 80;
    };

    class TFC_Army : TFC_Base
    {
        side = "Occ";
        flagTexture = QPATHTOFOLDER(Templates\Templates\TFC\images\flag_canada_co.paa);
        name = "Canadian Army";
        file = "TFC_AI_CA_Army_Temperate";
        description = "The Canadian Army with some assets provided by NATO, in a woodland theme.";
    };
    class TFC_Army_Arid : TFC_Army
    {
        name = "Canadian Army (Desert)";
        file = "TFC_AI_CA_Army_Arid";
        climate[] = {"arid"};
        description = "The Canadian Army with some assets provided by NATO, in a desert theme.";
    };