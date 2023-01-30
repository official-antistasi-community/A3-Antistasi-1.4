#include "script_component.hpp"

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
		scope = 2; ScopeArsenal = 2; ScopeCurator = 0;
		_generalMacro="a3a_g_beret_01";
		displayName=$STR_A3A_G_BERET_01_DN;
		picture=QPATHTOFOLDER(headgear\a3a_g_beret_01_ca.paa);
		hiddenSelectionsTextures[]=	{QPATHTOFOLDER(headgear\a3a_g_beret_01.paa)};
		hiddenSelectionsMaterials[]={QPATHTOFOLDER(headgear\a3a_g_beret_colonel.rvmat)};
	};

	class a3a_g_beret_02: H_Beret_02
	{
		author=AUTHOR;
		scope = 2; ScopeArsenal = 2; ScopeCurator = 0;
		_generalMacro="a3a_g_beret_02";
		displayName=$STR_A3A_G_BERET_02_DN;
		picture=QPATHTOFOLDER(headgear\a3a_g_beret_02_ca.paa);
		hiddenSelectionsTextures[]={QPATHTOFOLDER(headgear\a3a_g_beret_02.paa)};
		hiddenSelectionsMaterials[]={QPATHTOFOLDER(headgear\a3a_g_beret_colonel.rvmat)};
	};

	class a3a_g_beret_03: H_Beret_02
	{
		author=AUTHOR;
		scope = 2; ScopeArsenal = 2; ScopeCurator = 0;
		_generalMacro="a3a_g_beret_03";
		displayName=$STR_A3A_G_BERET_03_DN;
		picture=QPATHTOFOLDER(headgear\a3a_g_beret_03_ca.paa);
		hiddenSelectionsTextures[]={QPATHTOFOLDER(headgear\a3a_g_beret_03.paa)};
		hiddenSelectionsMaterials[]={QPATHTOFOLDER(headgear\a3a_g_beret_colonel.rvmat)};
	};

	class a3a_g_beret_04: H_Beret_02
	{
		author=AUTHOR;
		scope = 2; ScopeArsenal = 2; ScopeCurator = 0;
		_generalMacro="a3a_g_beret_04";
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
		scope = 0; ScopeArsenal = 0; ScopeCurator = 0;
		vehicleClass = "ItemsHeadgear"; //ItemsHeadgear
		displayName=$STR_A3A_G_HEADGEAR_BASE_DN;
		model = "\A3\Weapons_F\DummyCap.p3d";		// Omit this, if the headgear is a helmet.
		class TransportItems
		{
			class a3a_g_headgear_base
			{
				name = a3a_g_headgear_base;
				count = 1;
			};
		};
	};
	
	class a3a_g_beret_01: a3a_g_headgear_base
	{
		author=AUTHOR;
		scope = 2; ScopeArsenal = 0; ScopeCurator = 2;
		vehicleClass = "ItemsHeadgear"; //ItemsHeadgear
		displayName=$STR_A3A_G_BERET_01_DN;
		model = "\A3\Weapons_F\DummyCap.p3d";		// Omit this, if the headgear is a helmet.
		class TransportItems
		{
			class a3a_g_beret_01
			{
				name = a3a_g_beret_01;
				count = 1;
			};
		};
	};

	class a3a_g_beret_02: a3a_g_headgear_base
	{
		author=AUTHOR;
		scope = 2; ScopeArsenal = 0; ScopeCurator = 2;
		vehicleClass = "ItemsHeadgear"; //ItemsHeadgear
		displayName=$STR_A3A_G_BERET_02_DN;
		model = "\A3\Weapons_F\DummyCap.p3d";		// Omit this, if the headgear is a helmet.
		class TransportItems
		{
			class a3a_g_beret_02
			{
				name = a3a_g_beret_02;
				count = 1;
			};
		};
	};

	class a3a_g_beret_03: a3a_g_headgear_base
	{
		author=AUTHOR;
		scope = 2; ScopeArsenal = 0; ScopeCurator = 2;
		vehicleClass = "ItemsHeadgear"; //ItemsHeadgear
		displayName=$STR_A3A_G_BERET_03_DN;
		model = "\A3\Weapons_F\DummyCap.p3d";		// Omit this, if the headgear is a helmet.
		class TransportItems
		{
			class a3a_g_beret_03
			{
				name = a3a_g_beret_03;
				count = 1;
			};
		};
	};

	class a3a_g_beret_04: a3a_g_headgear_base
	{
		author=AUTHOR;
		scope = 2; ScopeArsenal = 0; ScopeCurator = 2;
		vehicleClass = "ItemsHeadgear"; //ItemsHeadgear
		displayName=$STR_A3A_G_BERET_04_DN;
		model = "\A3\Weapons_F\DummyCap.p3d";		// Omit this, if the headgear is a helmet.
		class TransportItems
		{
			class a3a_g_beret_04
			{
				name = a3a_g_beret_04;
				count = 1;
			};
		};
	};

};

class A3A {
    //#include "gear.hpp"

#if __A3_DEBUG__
    #include "CfgFunctions.hpp"
#endif
};
#if __A3_DEBUG__
#else
    #include "CfgFunctions.hpp"
#endif
