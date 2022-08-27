// note use of preInit & postInit will run for EVERY mission, use sparingly or with non a3a mission aborts in place, example check if the class (missionConfigFile >> "A3A") exists
class CfgFunctions
{
    class A3A
    {
        class FunctionsTemplates {
            file = QPATHTOFOLDER(functions\Templates);
            class aceModCompat {};
            class compatibilityLoadFaction {};
            class compileGroups {};
            class compileMissionAssets {};
            class getLoadout {};
            class loadFaction {};
            class ifaModCompat {};
            class loadAddon {};
            class rhsModCompat {};
        };

        class InitTemplates {
            file = QPATHTOFOLDER(functions\init);
            class detector {};
            class selector {};
        };

        class ItemSets {
            file = QPATHTOFOLDER(functions\Templates\Itemsets);
            class itemset_medicalSupplies {};
            class itemset_miscEssentials {};
        };

        class Loadouts {
            file = QPATHTOFOLDER(functions\Templates\Loadouts);
            class loadout_setBackpack {};
            class loadout_addEquipment {};
            class loadout_setHelmet {};
            class loadout_setFacewear {};
            class loadout_addItems {};
            class loadout_additionalMuzzleMags {};
            class loadout_setUniform {};
            class loadout_setVest {};
            class loadout_setWeapon {};
            class loadout_builder {};
            class loadout_createBase {};
            class loadout_defaultWeaponMag {};
            class loadout_itemLoad {};
        };

        class TemplateVerification {
            file = QPATHTOFOLDER(functions\Templates\Verification);
            class TV_verifyLoadout {};
            class TV_verifyLoadoutsData {};
            class TV_verifyAssets {};
        };
    };
};
