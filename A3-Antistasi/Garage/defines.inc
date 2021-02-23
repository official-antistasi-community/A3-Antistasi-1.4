//-- Other Includes --\\
#include "cfgMacros.hpp"

//-- display --\\
#define IDD_Garage 17001

//-- Category --\\
#define IDC_CatList 170010
#define IDC_CatCar 1700100
#define IDC_CatArmored 1700101
#define IDC_CatAir 1700102
#define IDC_CatBoat 1700103
#define IDC_CatStatic 1700104
#define CatEnabled [0.00 * safezoneW + safezoneX, 0.03 * safezoneH + safezoneY, 0.18 * safezoneW, 0.92 * safezoneH]


//-- extra --\\
#define IDC_ExtraList 170015
#define IDC_ExtraMounts 1700150
#define IDC_ExtraTexture 1700151
#define IDC_ExtraAnim 1700152
#define IDC_ExtraPylons 1700153
#define IDC_PylonsFirstIDC 1715300
#define ExtraEnabled [0.82 * safezoneW + safezoneX, 0.03 * safezoneH + safezoneY, 0.18 * safezoneW, 0.59 * safezoneH]
#define checkboxTextures [tolower gettext (configfile >> "RscCheckBox" >> "textureUnchecked"),tolower gettext (configfile >> "RscCheckBox" >> "textureChecked")]

//-- General --\\
#define IDC_Cancel 170011
#define IDC_tLock 170012
#define IDC_Confirm 170013
#define IDC_InfoPanel 170014
#define IDC_CatText 170016
#define IDC_ExtrasText 170017
#define IDC_KeyBindHint 170018
#define InfoEnable [0.82 * safezoneW + safezoneX, 0.62 * safezoneH + safezoneY, 0.18 * safezoneW, 0.38 * safezoneH]
#define ctrlDisabled [-1 * safezoneW + safezoneX, -1 * safezoneH + safezoneY, 0, 0]

//icons
#define CheckOutIcon "\a3\ui_f\data\Map\Diary\Icons\diaryLocateTask_ca.paa"
#define LockIcon "\a3\ui_f\data\GUI\Rsc\RscDisplayMain\infoDLCs_ca.paa"
#define TexturesIcon "\a3\ui_f\data\GUI\Rsc\RscDisplayGarage\textureSources_ca.paa"
#define AnimationsIcon "\a3\ui_f\data\GUI\Rsc\RscDisplayArcadeMap\icon_debug_ca.paa"
#define PylonsIcon "\a3\ui_f\data\GUI\Cfg\Hints\warhead_types_ca.paa"

#define CarIcon "\a3\ui_f\data\GUI\Rsc\RscDisplayGarage\car_ca.paa"
#define ArmoredIcon "\a3\ui_f\data\GUI\Rsc\RscDisplayGarage\tank_ca.paa"
#define AirIcon "\a3\ui_f\data\GUI\Rsc\RscDisplayGarage\helicopter_ca.paa"
#define BoatIcon "\a3\ui_f\data\GUI\Rsc\RscDisplayGarage\naval_ca.paa"
#define StaticIcon "\a3\ui_f\data\GUI\Rsc\RscDisplayGarage\static_ca.paa"

#define DriverIcon "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa"
#define GunnerIcon "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_gunner_ca.paa"
#define CommanderIcon "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_commander_ca.paa"
#define CargoIcon "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa"

#define CrateIcon "\a3\ui_f\data\Map\VehicleIcons\iconCrateWpns_ca.paa"
#define VehCargoIcon "\a3\ui_f\data\IGUI\Cfg\VehicleToggles\VehicleCargoIconOn2_ca.paa"
#define SpeedIcon "\a3\ui_f\data\GUI\Rsc\RscDisplayOptionsVideo\icon_performance.paa"
#define EngineIcon "\a3\ui_f\data\IGUI\Cfg\Actions\engine_on_ca.paa"
#define MassIcon "\a3\ui_f\data\GUI\Cfg\Cursors\raise_gs.paa"

#define TutorialIcon "\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\unknown_ca.paa"
#define cameraIcon "\a3\ui_f\data\GUI\Cfg\KeyframeAnimation\IconCamera_CA.paa"
#define moveIcon "\a3\ui_f\data\GUI\Cfg\Cursors\move_gs.paa"
#define zoomIcon "\a3\ui_f\data\IGUI\Cfg\Actions\autohover_ca.paa"

//Debug

#define LogDebug(Message) diag_log (str serverTime + " | " + HR_GRG_Prefix + " | Garage | Log | " + Message)
#define LogDebug_1(Message, A) diag_log (str serverTime + " | " + HR_GRG_Prefix + " | Garage | Log | " + format [Message,A])
#define LogDebug_2(Message, A,B) diag_log (str serverTime + " | " + HR_GRG_Prefix + " | Garage | Log | " + format [Message,A,B])
#define LogDebug_3(Message, A,B,C) diag_log (str serverTime + " | " + HR_GRG_Prefix + " | Garage | Log | " + format [Message,A,B,C])
#define LogDebug_4(Message, A,B,C,D) diag_log (str serverTime + " | " + HR_GRG_Prefix + " | Garage | Log | " + format [Message,A,B,C,D])
#define LogDebug_5(Message, A,B,C,D,E) diag_log (str serverTime + " | " + HR_GRG_Prefix + " | Garage | Log | " + format [Message,A,B,C,D,E])
#define LogDebug_6(Message, A,B,C,D,E,F) diag_log (str serverTime + " | " + HR_GRG_Prefix + " | Garage | Log | " + format [Message,A,B,C,D,E,F])
#define LogDebug_7(Message, A,B,C,D,E,F,G) diag_log (str serverTime + " | " + HR_GRG_Prefix + " | Garage | Log | " + format [Message,A,B,C,D,E,F,G])
#define LogDebug_8(Message, A,B,C,D,E,F,G,H) diag_log (str serverTime + " | " + HR_GRG_Prefix + " | Garage | Log | " + format [Message,A,B,C,D,E,F,G,H])

#ifdef Debug
    #define Trace(Message) diag_log ( str serverTime + " | " + HR_GRG_Prefix + " | Garage | Trace | " + Message)
    #define Trace_1(Message, A) diag_log (str serverTime + " | " + HR_GRG_Prefix + " | Garage | Trace | " + format [Message,A])
    #define Trace_2(Message, A,B) diag_log (str serverTime + " | " + HR_GRG_Prefix + " | Garage | Trace | " + format [Message,A,B])
    #define Trace_3(Message, A,B,C) diag_log (str serverTime + " | " + HR_GRG_Prefix + " | Garage | Trace | " + format [Message,A,B,C])
    #define Trace_4(Message, A,B,C,D) diag_log (str serverTime + " | " + HR_GRG_Prefix + " | Garage | Trace | " + format [Message,A,B,C,D])
    #define Trace_5(Message, A,B,C,D,E) diag_log (str serverTime + " | " + HR_GRG_Prefix + " | Garage | Trace | " + format [Message,A,B,C,D,E])
    #define Trace_6(Message, A,B,C,D,E,F) diag_log (str serverTime + " | " + HR_GRG_Prefix + " | Garage | Trace | " + format [Message,A,B,C,D,E,F])
    #define Trace_7(Message, A,B,C,D,E,F,G) diag_log (str serverTime + " | " + HR_GRG_Prefix + " | Garage | Trace | " + format [Message,A,B,C,D,E,F,G])
    #define Trace_8(Message, A,B,C,D,E,F,G,H) diag_log (str serverTime + " | " + HR_GRG_Prefix + " | Garage | Trace | " + format [Message,A,B,C,D,E,F,G,H])
#else
    #define Trace(Message)
    #define Trace_1(Message, A)
    #define Trace_2(Message, A,B)
    #define Trace_3(Message, A,B,C)
    #define Trace_4(Message, A,B,C,D)
    #define Trace_5(Message, A,B,C,D,E)
    #define Trace_6(Message, A,B,C,D,E,F)
    #define Trace_7(Message, A,B,C,D,E,F,G)
    #define Trace_8(Message, A,B,C,D,E,F,G,H)
#endif
