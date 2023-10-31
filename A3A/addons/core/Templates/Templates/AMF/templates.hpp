    class AMF_Base
    {
        requiredAddons[] = {"AMF_FAMAS", "r3f_armes"};
        basepath = QPATHTOFOLDER(Templates\Templates\AMF);
        logo = QPATHTOFOLDER(Pictures\antistasi_ultimate_logo.paa);
        priority = 80;
    };

    class AMF_Army : AMF_Base
    {
        side = "Occ";
        flagTexture = QPATHTOFOLDER(Templates\Templates\AMF\images\flag_france_co.paa);
        name = "French Army";
        file = "AMF_AI_Army";
    };
    class AMF_Army_Tan : AMF_Army
    {
        name = "French Army (Desert)";
        file = "AMF_AI_Army_Tan";
        climate[] = {"arid"};
    };