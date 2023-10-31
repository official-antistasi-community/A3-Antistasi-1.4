    class RACS_Base
    {
        requiredAddons[] = {"PRACS_Core", "PRACS_SLA_Core"};
        basepath = QPATHTOFOLDER(Templates\Templates\RACS);
        logo = "\PRACS_Core\Flags\KingdomofSahrani_co_mrk.paa";
        priority = 80;
    };

    class RACS_Army : RACS_Base
    {
        side = "Occ";
        flagTexture = "\PRACS_Core\Flags\KingdomofSahrani_co_mrk.paa"; //Templates\Templates\RACS\flag_sahrani_co.paa
        name = "Sahrani Royal Army Corps";
        file = "RACS_AI_Army_New";
    };

    class RACS_SLA : RACS_Base
    {
        side = "Inv";
        flagTexture = "\PRACS_SLA_Core\Flags\flag_north_co_mrk.paa"; //Templates\Templates\RACS\flag_sahrani_co.paa
        name = "Sahrani Liberation Army";
        file = "RACS_AI_SLA_New";
    };

    class RACS_QB : RACS_Army
    {
        side = "Riv";
        flagTexture = "\PRACS_Core\Flags\KingdomofSahrani_co_mrk.paa";
        name = "Sahrani Queens Battalion";
        file = "RACS_Riv_QB";
        description = "Ruled by Isabella Ximénez, this faction are the remnants of the old RACS.";
    };