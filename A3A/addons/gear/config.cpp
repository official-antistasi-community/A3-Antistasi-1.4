#include "script_component.hpp"
#define ITEM_XX(a,b) class _xx_##a {name = a; count = b;}

class CfgPatches 
{
    class ADDON {
        name = COMPONENT_NAME;
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = 
		{
			"A3_Characters_F",
			"A3_Data_F",
			"A3_Weapons_F"
		};
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
        units[] = {};
        weapons[] = {};
    };
};

class CfgWeapons
{
	class InventoryItem_Base_F;
	class ItemCore;
	class HeadgearItem: InventoryItem_Base_F{};
	class HelmetBase: ItemCore
	{
		class ItemInfo: HeadgearItem{};
	};
	
	class H_Beret_blk: HelmetBase
	{
		class ItemInfo: ItemInfo{};
	};

	class H_Beret_02: H_Beret_blk
	{
		class ItemInfo: ItemInfo{};
	};

	class a3a_g_beret_01: H_Beret_02
	{
		author=AUTHOR;
		scope = 2;
		ScopeArsenal = 2;
		ScopeCurator = 0;
		displayName=$STR_A3A_G_BERET_01_DN;
		picture=QPATHTOFOLDER(headgear\a3a_g_beret_01_ca.paa);
		hiddenSelectionsTextures[]={QPATHTOFOLDER(headgear\a3a_g_beret_01.paa)};
		hiddenSelectionsMaterials[]={QPATHTOFOLDER(headgear\a3a_g_beret_colonel.rvmat)};
	};

	class a3a_g_beret_02: H_Beret_02
	{
		author=AUTHOR;
		scope = 2;
		ScopeArsenal = 2;
		ScopeCurator = 0;
		displayName=$STR_A3A_G_BERET_02_DN;
		picture=QPATHTOFOLDER(headgear\a3a_g_beret_02_ca.paa);
		hiddenSelectionsTextures[]={QPATHTOFOLDER(headgear\a3a_g_beret_02.paa)};
		hiddenSelectionsMaterials[]={QPATHTOFOLDER(headgear\a3a_g_beret_colonel.rvmat)};
	};

	class a3a_g_beret_03: H_Beret_02
	{
		author=AUTHOR;
		scope = 2;
		ScopeArsenal = 2;
		ScopeCurator = 0;
		displayName=$STR_A3A_G_BERET_03_DN;
		picture=QPATHTOFOLDER(headgear\a3a_g_beret_03_ca.paa);
		hiddenSelectionsTextures[]={QPATHTOFOLDER(headgear\a3a_g_beret_03.paa)};
		hiddenSelectionsMaterials[]={QPATHTOFOLDER(headgear\a3a_g_beret_colonel.rvmat)};
	};

	class a3a_g_beret_04: H_Beret_02
	{
		author=AUTHOR;
		scope = 2;
		ScopeArsenal = 2;
		ScopeCurator = 0;
		displayName=$STR_A3A_G_BERET_04_DN;
		picture=QPATHTOFOLDER(headgear\a3a_g_beret_04_ca.paa);
		hiddenSelectionsTextures[]={QPATHTOFOLDER(headgear\a3a_g_beret_04.paa)};
		hiddenSelectionsMaterials[]={QPATHTOFOLDER(headgear\a3a_g_beret_colonel.rvmat)};
	};
};

class CfgVehicles
{
	class Headgear_Base_F;
	class a3a_g_headgear_base: Headgear_Base_F
	{
		author=AUTHOR;
		scope = 0;
		ScopeArsenal = 0;
		ScopeCurator = 0;
		vehicleClass = "ItemsHeadgear"; //ItemsHeadgear
		displayName=$STR_A3A_G_HEADGEAR_BASE_DN;
		model = "\A3\Weapons_F\DummyCap.p3d";		// Omit this, if the headgear is a helmet.
        class TransportItems
        {
            ITEM_XX(a3a_g_headgear_base,1);
        };
	};
	
class a3a_g_beret_01: a3a_g_headgear_base
    {
		scope = 2;
		ScopeArsenal = 0;
		ScopeCurator = 2;
        displayName=$STR_A3A_G_BERET_01_DN;
        class TransportItems
        {
            ITEM_XX(a3a_g_beret_01,1);
        };
    };

    class a3a_g_beret_02: a3a_g_headgear_base
    {
		scope = 2;
		ScopeArsenal = 0;
		ScopeCurator = 2;
        displayName=$STR_A3A_G_BERET_02_DN;
        class TransportItems
        {
            ITEM_XX(a3a_g_beret_02,1);
        };
    };

    class a3a_g_beret_03: a3a_g_headgear_base
    {
		scope = 2;
		ScopeArsenal = 0;
		ScopeCurator = 2;
        displayName=$STR_A3A_G_BERET_03_DN;
        class TransportItems
        {
            ITEM_XX(a3a_g_beret_03,1);
        };
    };

    class a3a_g_beret_04: a3a_g_headgear_base
    {
		scope = 2;
		ScopeArsenal = 0;
		ScopeCurator = 2;
        displayName=$STR_A3A_G_BERET_04_DN;
        class TransportItems
        {
            ITEM_XX(a3a_g_beret_04,1);
        };
    };
};
