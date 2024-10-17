#include "..\..\..\script_component.hpp"

class CfgPatches {
    class PATCHNAME(AirLoadout_CWR) {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"cwr3_core"};
        skipWhenMissingDependencies = 1;
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    };
};

class A3A {
    class Loadouts
    {
        class CASPlane
        {
            class baseCAS;
            class cwr3_o_su17m4 : baseCAS {
                loadout[] = {"CUP_PylonPod_16Rnd_S5_plane_M","CUP_PylonPod_16Rnd_S5_plane_M","CUP_PylonPod_1Rnd_FAB250_plane_M","CUP_PylonPod_1Rnd_FAB250_plane_M","PylonMissile_Missile_AGM_KH25_x1","PylonMissile_Missile_AGM_KH25_x1","CUP_PylonPod_250Rnd_TE2_Green_Tracer_GSh23_23mm_APHE_M"};
                mainGun[] = {"CUP_PylonPod_250Rnd_TE2_Green_Tracer_GSh23_23mm_APHE_M"};
                rocketLauncher[] = {"CUP_PylonPod_16Rnd_S5_plane_M"};
                missileLauncher[] = {"PylonMissile_Missile_AGM_KH25_x1"};
            };

            class cwr3_o_mig27 : baseCAS {
                loadout[] = {"PylonRack_20Rnd_Rocket_03_HE_F","PylonRack_20Rnd_Rocket_03_HE_F","CUP_PylonPod_1Rnd_Kh29_M","CUP_PylonPod_1Rnd_Kh29_M",""};
                mainGun[] = {"cwr3_vacannon_gsh306"};
                rocketLauncher[] = {"CUP_PylonPod_32Rnd_S5_plane_M"};
                missileLauncher[] = {"PylonRack_1Rnd_Missile_AGM_01_F"};
            };

             class cwr3_b_a10 : baseCAS {
                loadout[] = {"PylonRack_7Rnd_Rocket_04_HE_F","","PylonRack_7Rnd_Rocket_04_HE_F","PylonRack_7Rnd_Rocket_04_HE_F","PylonRack_3Rnd_Missile_AGM_02_F","","PylonRack_3Rnd_Missile_AGM_02_F","PylonRack_7Rnd_Rocket_04_HE_F","PylonRack_7Rnd_Rocket_04_HE_F","","PylonRack_7Rnd_Rocket_04_HE_F"};
                mainGun[] = {"CUP_Vacannon_GAU8_veh"};
                rocketLauncher[] = {"PylonRack_7Rnd_Rocket_04_HE_F"};
                missileLauncher[] = {"PylonRack_3Rnd_Missile_AGM_02_F"};
            };

             class cwr3_b_f4e : baseCAS {
                loadout[] = {"CUP_PylonPod_19Rnd_CRV7_KEP_plane_M","","CUP_PylonPod_1Rnd_AGM65_Maverick_M","","CUP_PylonPod_1Rnd_AGM65_Maverick_M","","CUP_PylonPod_19Rnd_CRV7_KEP_plane_M"};
                mainGun[] = {"cwr3_vacannon_m61a1"};
                rocketLauncher[] = {"CUP_PylonPod_19Rnd_CRV7_KEP_plane_M"};
                missileLauncher[] = {"CUP_PylonPod_1Rnd_AGM65_Maverick_M"};
            };
        };
        class CAPPlane
        {
            class baseCAP;
            class cwr3_b_f16c : baseCAP {
                loadout[] = {"","CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M",""};
            };

            class cwr3_b_f4e : baseCAP {
                loadout[] = {"","CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M",""};
            };

            class cwr3_o_mig23 : baseCAP {
                loadout[] = {"PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R77_x1"};
            };
        };
    };
};
