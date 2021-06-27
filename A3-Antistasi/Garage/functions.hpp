class HR_GRG
{
//private functions
    class Core
    {
        file = "Garage\Core";
        class addUser {};
        class broadcast {};
        class confirm {};
        class confirmPlacement {};
        class declairSources {};
        class execForGarageUsers {};
        class genVehUID {};
        class getCatIndex {};
        class onLoad {};
        class onUnload {};
        class reciveBroadcast {};
        class releaseAllVehicles {};
        class reloadCategory {};
        class reloadPreview {};
        class removeFromPool {};
        class removeUser {};
        class requestSelectionChange {};
        class requestVehicle {};
        class selectionChange {};
        class switchCategory {};
        class toggleConfirmBttn {};
        class toggleLock {};
        class updateCamPos {};
        class validateGarage {};
    };
    class Extras
    {
        file = "Garage\Extras";
        class findMount {};
        class isAmmoSource {};
        class isFuelSource {};
        class isRepairSource {};
        class reloadExtras {};
        class reloadMounts {};
        class requestMount {};
        class switchExtrasMenu {};
        class switchTexture {};
        class toggleAnim {};
    };
    class Pylons
    {
        file = "Garage\Pylons";
        class getPylonTurret {};
        class pylonsChanged {};
        class pylonsPresetChanged {};
        class pylonsTurretToggle {};
        class pylonToggleMirror {};
        class reloadPylons {};
        class updatePylons {};
    };
    class StatePreservation
    {
        file = "Garage\StatePreservation";
        class getAmmoData {};
        class getDamage {};
        class getFuel {};
        class getState {};
        class prepPylons {};
        class setAmmoData {};
        class setDamage {};
        class setFuel {};
        class setState {};
    };

//public functions
    class PublicFunctions
    {
        file = "Garage";
        class addVehiclesByClass {};
        class addVehicle {};
        class callbackHandler {};
        class getSaveData {};
        class initGarage {};
        class initServer {
            preInit = 1;
        };
        class loadSaveData {};
    };
};
