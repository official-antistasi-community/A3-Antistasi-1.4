respawn = "BASE";
respawnDelay = 15;
respawnVehicleDelay = 120;
respawnDialog = 1;
aiKills = 0;
disabledAI=1;
Saving = 0;
showCompass=1;
showRadio=1;
showGPS=1;
showMap=1;
showBinocular=1;
showNotepad=1;
showWatch=1;
debriefing=1;

//showGroupIndicator = 1;

class Header
{
	gameType = COOP;
	minplayers=1;
	maxplayers=61;
};

class CfgTaskEnhancements
{
    enable       = 1;            //0: disable new task features (default), 1: enable new task features & add new task markers and task widgets into the map
    3d           = 1;            //0: do not use new 3D markers (default), 1: replace task waypoints with new 3D markers
    3dDrawDist   = 3500;        //3d marker draw distance (default: 2000)
    share        = 1;            //0: do not count assigned players (default), 1: count how many players have the task assigned
    propagate    = 1;            //0: do not propagate (default), 1: propagate shared tasks to subordinates
};

//If we have CBA for TFAR, then load the mission's settings.
cba_settings_hasSettingsFile = 1;