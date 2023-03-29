class CfgFunctions {
    class A3A {
        class Artillery {
            file = QPATHTOFOLDER(functions\Artillery);
            class artilleryAdd {};
            class artilleryDangerClose {};
            class artilleryFireMission {};
            class artilleryGetBattery {};
            class artilleryGetRounds {};
        };

        class Civilian {
            file = QPATHTOFOLDER(functions\Civilian);
            class civilianFiredNearEH {};
            class civilianInitEH {};
            class createAmbientCiv {};
            class createAmbientCivTraffic {};
            class createCivilianTracks {};
            class createMusicSource {};
            class createRoomLight {};
            class getDayState {};
        };

        class Patcom {
            file = QPATHTOFOLDER(functions\Patcom);
            class clearVehicleCargo {};
            class debugText3D {};
            class debug3DPath {};
            class getSafePos {};
            class patrolAILoad {};
            class patrolAnimation {};
            class patrolArea {};
            class patrolArmStatics {};
            class patrolArmVehicle {};
            class patrolAttack {};
            class patrolBuildingEnterable {};
            class patrolCivilianCommander {};
            class patrolClosestKnownEnemy {};
            class patrolClosestObject {};
            class patrolCommander {};
            class patrolCreateWaypoint {};
            class patrolDefend {};
            class patrolEnterableBuildings {};
            class patrolGroupGarrison {};
            class patrolGroupVariables {};
            class patrolHandleFormation {};
            class patrolHealSelf {};
            class patrolInit {};
            class patrolLoop {};
            class patrolSearchBuilding {};
            class patrolSetCombatModes {};
            class patrolSetParams {};
            class patrolSideIsEnemy {};
            class patrolSuppressionEH {};
            class patrolUnitHitEH {};
            class patrolWater {};
        };
    };
};
