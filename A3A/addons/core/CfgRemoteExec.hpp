class CfgRemoteExec {
    // List of Functions allowed to be sent from client via remoteExec
    class Functions {
        mode = 2;           // 0: Completely blocked,   1: Blocked by default,      2: Allow All
        jip = 1;            // 0: No JIP,               1: JIP Allowed
        allowedTargets = 0; // 0: All machines,         1: Only to other clients,   2: Only to server
		
		class vcm_serverask { allowedTargets = 0;jip = 1; };
		class VCM_PublicScript { allowedTargets = 0;jip = 1; };
		class SpawnScript { allowedTargets = 0;jip = 1; };
		class enableSimulationGlobal { allowedTargets = 0;jip = 1; };
		class VCM_fnc_KnowAbout { allowedTargets = 0;jip = 1; };	
    };
};