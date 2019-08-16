if (worldName == "Malden") then
    {
    diag_log format ["%1: [Antistasi] | INFO | initZones | Setting Spawn Points for %2.",servertime,worldname];
    airportsX = ["airport","airport_1"];//airports
    spawnPoints = ["spawnPoint","spawnPoint_1","spawnPoint_2"];
    resourcesX = ["resource","resource_1","resource_2","resource_3","resource_4","resource_5"];//economic resources
    factories = ["factory","factory_1","factory_2"];//factories
    outposts = ["outpost","outpost_1","outpost_2","outpost_3","outpost_4","outpost_5","outpost_6","outpost_7","outpost_8","outpost_9","outpost_10","outpost_11","outpost_12","outpost_13"];//any small zone with mil buildings
    seaports = ["seaport","seaport_1","seaport_2","seaport_3","seaport_4","seaport_5","seaport_6","seaport_7"];//seaports, adding a lot will affect economics, 5 is ok
    controlsX = ["control","control_1","control_2","control_3","control_4","control_5","control_6","control_7","control_8","control_9","control_10","control_11","control_12","control_13","control_14","control_15","control_16"];//use this for points where you want a roadblock (logic/strategic points, such as crossroads, airport or bases entrances etc..) game will add some more automatically
    seaMarkers = ["seaPatrol","seaPatrol_1","seaPatrol_2","seaPatrol_3","seaPatrol_4","seaPatrol_5","seaPatrol_6","seaPatrol_7","seaPatrol_8","seaPatrol_9","seaPatrol_10","seaPatrol_11","seaPatrol_12","seaPatrol_13"];
    seaSpawn = ["seaSpawn","seaSpawn_1","seaSpawn_2","seaSpawn_3","seaSpawn_4","seaSpawn_5","seaSpawn_6","seaSpawn_7","seaSpawn_8","seaSpawn_9","seaSpawn_10"];
    seaAttackSpawn = ["seaAttackSpawn","seaAttackSpawn_1","seaAttackSpawn_2","seaAttackSpawn_3","seaAttackSpawn_4","seaAttackSpawn_5","seaAttackSpawn_6","seaAttackSpawn_7"];
    }