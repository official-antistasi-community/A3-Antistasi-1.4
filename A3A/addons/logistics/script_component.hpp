#define COMPONENT logistics
#include "\x\A3A\addons\core\Includes\script_mod.hpp"

//get and format model path to class friendly name for lookup
#define modelOfClass(class) (((getText (configFile/"CfgVehicles"/class/"model")) splitString "\.") joinString "_")

#define TYPE_MORTAR 1
#define TYPE_MG 2
#define TYPE_AT 3
#define TYPE_AA 4

//Basic Variantes
#define BL_MG __EVAL(2)
#define BL_AT __EVAL(4)
#define BL_AA __EVAL(8)
#define BL_MORTAR __EVAL(1)

// Variants with 2 Blacklisted weapon types
#define BL_MORTAR_MG __EVAL(1+2)
#define BL_MORTAR_AT __EVAL(1+4)
#define BL_MORTAR_AA __EVAL(1+8)
#define BL_MG_AT __EVAL(2+4)
#define BL_MG_AA __EVAL(2+8)
#define BL_AT_AA __EVAL(4+8)

// Variants with 3 Blacklisted Weapon Types
#define BL_MORTAR_MG_AT __EVAL(1+2+4)
#define BL_MORTAR_MG_AA __EVAL(1+2+8)
#define BL_MORTAR_AT_AA __EVAL(1+4+8)
#define BL_MG_AT_AA __EVAL(2+4+8)

// Variants with 4 Blacklisted Weapon Types
#define BL_MORTAR_MG_AT_AA __EVAL(1+2+4+8)