    class BWA3_Base
    {
        requiredAddons[] = {"bwa3_common"};
        basepath = QPATHTOFOLDER(Templates\Templates\BWA3);
        logo = QPATHTOFOLDER(Templates\Templates\BWA3\bwa3_logo.paa);
        priority = 65;
    };

    class BWA3_BW_Arid : BWA3_Base
    {
        side = "Occ";
        flagTexture = "bwa3_common\data\bwa3_flag_germany_co.paa";
        name = "BWA3 BW Arid";
        file = "BWA3_AI_BW_Arid";
        climate[] = {"arid"};
    };
    class BWA3_BW_Temperate : BWA3_BW_Arid
    {
        name = "BWA3 BW Temperate";
        file = "BWA3_AI_BW_Temperate";
        climate[] = {"temperate","tropical","arctic"};
    };