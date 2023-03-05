#define ITEM_XX(a,b) class _xx_##a {name = a; count = b;}

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