#define	PRIMARYWEAPONINDEX	0
#define	SECONDARYWEAPONINDEX	1
#define	HANDGUNWEAPONINDEX	2
#define	UNIFORMINDEX	3
#define	VESTINDEX	4
#define	BACKPACKINDEX	5
#define	HEADGEARINDEX	6
#define	FACEWEARINDEX	7
#define	BINOCULARSINDEX	8
#define	ASSIGNEDITEMSINDEX	9

params ["_selectedTab", "_item"];

private _centerObject = missionNamespace getVariable ["A3A_arsenalCenterObject", player];

private _config = configFile >> "CfgVehicles";

if (_centerObject isKindOf "CaManBase") then {
    private _unitLoadData = getUnitLoadout _centerObject;

    // actually data broken into the arrays
    private _primaryWeaponArray = _unitLoadData # PRIMARYWEAPONINDEX;
    private _secondaryWeaponArray = _unitLoadData # SECONDARYWEAPONINDEX;
    private _handgunWeaponArray = _unitLoadData # HANDGUNWEAPONINDEX;
    private _uniformArray = _unitLoadData # UNIFORMINDEX;
    private _vestArray = _unitLoadData # VESTINDEX;
    private _backpackArray = _unitLoadData # BACKPACKINDEX;
    private _headgear = _unitLoadData # HEADGEARINDEX;
    private _facewear = _unitLoadData # FACEWEARINDEX;
    private _binocularsArray = _unitLoadData # BINOCULARSINDEX;
    private _assignedItems = _unitLoadData # ASSIGNEDITEMSINDEX;

    switch(_selectedTab) do 
    {
        case ("Rifle"): 
        {
            _config = configFile >> "CfgWeapons";
            _centerObject removeWeapon (primaryWeapon _centerObject);
            _centerObject addWeapon _item;
            _centerObject selectweapon (primaryWeapon _centerObject);
        };
    
        case ("Launcher"): {
            _config = configFile >> "CfgWeapons";
            _centerObject removeWeapon (secondaryWeapon _centerObject);
            _centerObject addWeapon _item;
            _centerObject selectweapon (secondaryWeapon _centerObject);
        };
    
        case ("Handgun"): {
            _config = configFile >> "CfgWeapons";
            _centerObject removeWeapon (handgunWeapon _centerObject);
            _centerObject addWeapon _item;
            _centerObject selectweapon (handgunWeapon _centerObject);
        };
    
        case ("Uniform"): {
            // TODO: Uniform will need to try to carry over what was in them
            _config = configFile >> "CfgWeapons";
            removeUniform _centerObject;
            _centerObject forceAddUniform _item;
        };
    
        case ("Vest"): {
            // TODO: Vests will need to try to carry over what was in them
            _config = configFile >> "CfgWeapons";
            removeVest _centerObject;
            _centerObject addVest _item;
        };
    
        case ("Backpack"): {
            // TODO: Backpack will need to try to carry over what was in them
            removeBackpack _centerObject;
            // edge case maybe? A backpack might already be on the player, therefor the backpack will be placed next to them. (Probably not as we take away the backpack)
            _centerObject addBackpack _item;
            // remove items in the backpack
            clearAllItemsFromBackpack _centerObject;
        };
    
        case ("Headgear"): {
            _config = configFile >> "CfgWeapons";
            removeHeadgear _centerObject;
            _centerObject addHeadgear _item;
        };
    
        case ("Facewear"): {
            _config = configFile >> "CfgGlasses";
            removeGoggles _centerObject;
            _centerObject addGoggles _item;
        };
    
        case ("NVG"): {
            _centerObject unlinkItem (_assignedItems#5);
            _centerObject linkItem _item;
        };
    
        case ("Binocular"): {
            _centerObject removeWeapon (_binocularsArray#0);
            _centerObject addWeapon _item;
        };
    
        case ("Map"): {
            _config = configFile >> "CfgWeapons";
            _centerObject unlinkItem (_assignedItems#0);
            _centerObject linkItem _item;
        };
    
        case ("Terminal"): {
            _centerObject unlinkItem (_assignedItems#1);
            _centerObject linkItem _item;
        };
    
        case ("Communication"): {
            _centerObject unlinkItem (_assignedItems#2);
            _centerObject linkItem _item;
        };
    
        case ("Navigation"): {
            _config = configFile >> "CfgWeapons";
            _centerObject unlinkItem (_assignedItems#3);
            _centerObject linkItem _item;
        };
    
        case ("Watch"): {
            _config = configFile >> "CfgWeapons";
            _centerObject unlinkItem (_assignedItems#4);
            _centerObject linkItem _item;
        };
    };
};