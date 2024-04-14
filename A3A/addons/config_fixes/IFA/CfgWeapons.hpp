//IFA - CfgWeapons.hpp

//Fun weapons for finding in lootcrates or on SF
class CfgWeapons 
{
    class LIB_RIFLE;
    class LIB_M1_Carbine : LIB_RIFLE {
        class Short;
    };
    class LIB_SVT_40 : LIB_RIFLE {
        class Short;
    };
    class LIB_PISTOL;
    class LIB_M1896 : LIB_PISTOL{
        class Single;
    };
    class a3a_lib_M712 : LIB_M1896{
        displayName = "M712 Mauser";
        descriptionShort = "9x19mm machine pistol";
        recoil = "recoil_pistol_4five";
        recoilProne = "recoil_pistol_4five";
        changeFiremodeSound[] = {"A3\sounds_f\weapons\closure\firemode_changer_2.wss",0.1778,1,5};
        class Full : Single{
            aiDispersionCoefX = 2;
            aiDispersionCoefY = 3;
            displayName = "Full";
            autoFire = 1;
            textureType = "fullAuto";
            reloadTime = 0.066;
            maxRange = 25;
            maxRangeProbab = 0.05;
            midRange = 12.5;
            midRangeProbab = 0.5;
            minRange = 0;
            minRangeProbab = 1.0;
            showToPlayer = 1;
        };
        modes[] = {"Single", "Full"};
    };
    class a3a_lib_AVT_40 : LIB_SVT_40 {
        displayName = "AVT-40";
        descriptionShort = "AVT-40 Automatic rifle";
        changeFiremodeSound[] = {"A3\sounds_f\weapons\closure\firemode_changer_2.wss",0.1778,1,5};
        class Full : Short{
            aiDispersionCoefX = 2;
            aiDispersionCoefY = 3;
            displayName = "Full";
            autoFire = 1;
            textureType = "fullAuto";
            reloadTime = 0.08;
            maxRangeProbab = 0.05;
            midRangeProbab = 0.2;
            minRangeProbab = 0.7;
            minRange = 0;
            showToPlayer = 1;
        };
        modes[] = {"Single","Full","Far","Medium","Short"};
    };
    class a3a_lib_M2_Carbine : LIB_M1_Carbine{
        displayName = "M2 Carbine";
        descriptionShort = "M2 Carbine .30 Automatic rifle";
        changeFiremodeSound[] = {"A3\sounds_f\weapons\closure\firemode_changer_2.wss",0.1778,1,5};
        class Full : Short{
            aiDispersionCoefX = 2;
            aiDispersionCoefY = 3;
            displayName = "Full";
            autoFire = 1;
            textureType = "fullAuto";
            reloadTime = 0.08;
            maxRangeProbab = 0.05;
            midRangeProbab = 0.2;
            minRangeProbab = 0.7;
            minRange = 0;
            showToPlayer = 1;
        };
        modes[] = {"Single","Full","Far","Medium","Short"};
    };
};