class CfgFunctions {
	class UPSMON {
		class AMBUSH {
			file = QPATHTOFOLDER(Functions\AMBUSH);
			class fn_FindAmbushPos {};
			class fn_getAmbushpos {};
			class fn_SetAmbush {};
		};

		class ARTILLERY {
			file = QPATHTOFOLDER(Functions\ARTILLERY);
			class fn_ArtiChk {};
			class fn_artillery_add {};
			class fn_artilleryBatteryout {};
			class fn_artillerydofire {};
			class fn_artillerysetBattery {};
			class fn_Flaretime {};
			class fn_FO {};
			class fn_GetArtiTarget {};
			class fn_GetDefaultmun {};
			class fn_getmuninfos {};
			class fn_getmuninfosbackpack {};
			class fn_selectartillery {};
			class fn_Splashzone {};
		};

		class COMMON {
			file = QPATHTOFOLDER(Functions\COMMON);
			class fn_closedoor {};
			class markerAlpha {};
		};

		class buildings {
			file = QPATHTOFOLDER(Functions\COMMON\buildings);
			class fn_checkdoorposition {};
			class fn_Checkfreebldpos {};
			class fn_Checkfreebldpos2 {};
			class fn_checkwindowposition {};
			class fn_filterbuilding {};
			class fn_gethighestbldpos {};
			class fn_GetNearestBuilding {};
			class fn_GetNearestBuildings {};
			class fn_Inbuilding {};
			class fn_Isroof {};
			class fn_SortOutBldpos {};
			class fn_SortOutBldpos2 {};
			class fn_UnitWatchDir {};
			class fn_WillSee {};
		};

		class Core {
			file = QPATHTOFOLDER(Functions\COMMON\Core);
			class fn_AddtoArray {};
			class fn_arrayShufflePlus {};
			class fn_CanSee {};
			class fn_checkbackpack {};
			class fn_createmarker {};
			class fn_createsign {};
			class fn_deleteDead {};
			class fn_DeleteWP {};
			class fn_distancePosSqr {};
			class fn_DoaddWP {};
			class fn_DocreateWP {};
			class fn_getArg {};
			class fn_GetCOS {};
			class fn_getDirPos {};
			class fn_getminesclass {};
			class fn_Getnearestplayer {};
			class fn_GetOut {};
			class fn_GetPos2D {};
			class fn_GetSIN {};
			class fn_Getunitsincargo {};
			class fn_Haslos {};
			class fn_LOS {};
			class fn_Nighttime {};
			class fn_Nowp {};
			class fn_overwatch {};
			class fn_randomPos {};
			class fn_Replace {};
			class fn_rotpoint {};
			class fn_setArg {};
			class fn_SN_EHFIREDNEAR {};
			class fn_SN_EHHIT {};
			class fn_SN_EHKILLED {};
			class fn_SN_EHKILLEDCIV {};
			class fn_spawnmines {};
			class fn_stayInside {};
			class fn_StrIndex {};
			class fn_StrInStr {};
			class fn_StrLen {};
			class fn_StrToArray {};
			class fn_TRACK {};
			class fn_TRACK2 {};
		};

		class Cover {
			file = QPATHTOFOLDER(Functions\COMMON\Cover);
			class fn_fnc_filter {};
			class fn_fnc_find_cover {};
			class fn_fnc_move_to_cover {};
		};

		class Group {
			file = QPATHTOFOLDER(Functions\COMMON\Group);
			class fn_analysegrp {};
			class fn_Cangrpmaneuver {};
			class fn_ChangeFormation {};
			class fn_checkallied {};
			class fn_checkmunition {};
			class fn_checksizetargetgrp {};
			class fn_composeteam {};
			class fn_getleader {};
			class fn_getNearestSoldier {};
			class fn_GetStaticTeam {};
			class fn_getunits {};
			class fn_GothitParam {};
			class fn_grptype {};
			class fn_Isgrpstuck {};
			class fn_IsRetreating {};
			class fn_IsSurrending {};
			class fn_SetLeaderGrp {};
			class fn_Supressfire {};
			class fn_supstatestatus {};
		};

		class MP {
			file = QPATHTOFOLDER(Functions\COMMON\MP);
			class fn_fnc_setVehicleInit {};
			class fn_fnc_setVehicleVarName {};
		};

		class Params {
			file = QPATHTOFOLDER(Functions\COMMON\Params);
			class fn_BacktoNormal {};
			class fn_GetGroupbehaviour {};
			class fn_GetGroupformation {};
			class fn_GetGroupspeed {};
			class fn_GetParams {};
			class fn_GetRespawndelay {};
			class fn_GetRespawnpos {};
			class fn_GetRespawntime {};
			class fn_NOSMOKE {};
			class fn_SetClones {};
			class fn_SetEventhandlers {};
			class fn_SetMarkerArea {};
			class fn_SetRenfParam {};
			class fn_Settemplate {};
		};

		class target {
			file = QPATHTOFOLDER(Functions\COMMON\target);
			class fn_Checkratio {};
			class fn_ClassifyEnies {};
			class fn_Eniesnear {};
			class fn_findnearestenemy {};
			class fn_Shareinfos {};
			class fn_TargetAcquisition {};
			class fn_TargetAcquisitionCiv {};
		};

		class terrain {
			file = QPATHTOFOLDER(Functions\COMMON\terrain);
			class fn_sample_terrain {};
			class fn_TerraCognita {};
		};

		class unit {
			file = QPATHTOFOLDER(Functions\COMMON\unit);
			class fn_addequipment {};
			class fn_cancelstop {};
			class fn_CreateSmokeCover {};
			class fn_deadbodies {};
			class fn_DeployStatic {};
			class fn_Disableunitloop {};
			class fn_DoFireFlare {};
			class fn_doGetOut {};
			class fn_domove {};
			class fn_DoRearm {};
			class fn_DoSmokeScreen {};
			class fn_doStop {};
			class fn_DoSurrender {};
			class fn_dowatch {};
			class fn_FireFlare {};
			class fn_FireGun {};
			class fn_firing {};
			class fn_getequipment {};
			class fn_Getmemberstype {};
			class fn_movetoDriver {};
			class fn_movetogunner {};
			class fn_Packbag {};
			class fn_PutMine {};
			class fn_PutSatchel {};
			class fn_Rearm {};
			class fn_SetMinefield {};
			class fn_SetSatchel {};
			class fn_surrended {};
			class fn_throw_grenade {};
			class fn_throw_stone {};
			class fn_Unpackbag {};
			class fn_Watchbino {};
		};
		
		class vehicles {
			file = QPATHTOFOLDER(Functions\COMMON\vehicles);
			class fn_Allowgetin {};
			class fn_assignasgunner {};
			class fn_assignasrole {};
			class fn_avoidDissembark {};
			class fn_checkleaveVehicle {};
			class fn_Checkvehiclesstatus {};
			class fn_EjectUnits {};
			class fn_Emptyturret {};
			class fn_fnc_commonTurrets {};
			class fn_Fn_Gunnercrew {};
			class fn_FN_unitsInCargo {};
			class fn_GetIn_NearestVehicles {};
			class fn_GetNearestStatics {};
			class fn_GetNearestVehicles {};
			class fn_Gunnercontrol {};
			class fn_selectvehicles {};
			class fn_UnitsGetIn {};
			class fn_UnitsGetOut {};
		};

		class FORTIFY {
			file = QPATHTOFOLDER(Functions\FORTIFY);
			class fn_Fortify {};
			class fn_moveBuildings {};
			class fn_moveNearestBuildings {};
			class fn_movetoBuilding {};
			class fn_patrolBuilding {};
			class fn_SpawninBuildings {};
			class fn_unitdefend {};
		};
		class POS {
			file = QPATHTOFOLDER(Functions\POS);
			class fn_findclosestposition {};
			class fn_getmarkercorners {};
			class fn_getmarkershape {};
			class fn_getpos {};
			class fn_getposfromcircle {};
			class fn_getposfromellipse {};
			class fn_getposfromrectangle {};
			class fn_getposfromsquare {};
			class fn_isblacklisted {};
			class fn_isincircle {};
			class fn_isinellipse {};
			class fn_isinrectangle {};
			class fn_issameposition {};
			class fn_rotateposition {};
			class fn_getpos {};
			class fn_getposmarker {};
			class fn_pos {};
		};
		class GROUP {
			file = QPATHTOFOLDER(Functions\GROUP);
			class fn_CreateGroup {};
		};

		class INIT {
			file = QPATHTOFOLDER(Functions\INIT);
			class Init_UPSMON {};
			class UPSMON {};
		};

		class LOOP {
			file = QPATHTOFOLDER(Functions\LOOP);
			class fn_MAINLOOP {};
			class fn_MAINLOOPCiv {};
		};

		class MODULES {
			file = QPATHTOFOLDER(Functions\MODULES);
			class fn_CLONES {};
			class fn_ModifyUcthis {};
			class fn_RESPAWN {};
			class fn_spawn {};
		};

		class UPSMON_ASSAULT {
			file = QPATHTOFOLDER(Functions\UPSMON_ASSAULT);
			class fn_AssltBld {};
			class fn_Assltposition {};
			class fn_DOASSAULT {};
			class fn_PLANASSLT {};
		};

		class UPSMON_DEFEND {
			file = QPATHTOFOLDER(Functions\UPSMON_DEFEND);
			class fn_DODEFEND {};
			class fn_SrchGuardPos {};
		};

		class UPSMON_FLANK {
			file = QPATHTOFOLDER(Functions\UPSMON_FLANK);
			class fn_DOFLANK {};
			class fn_PLANFLANK {};
			class fn_SrchFlankPos {};
			class fn_SrchFlankPosforboat {};
		};

		class UPSMON_PATROL {
			file = QPATHTOFOLDER(Functions\UPSMON_PATROL);
			class fn_DOPATROL {};
			class fn_SrchPtrlPos {};
		};

		class UPSMON_PATROLSRCH {
			file = QPATHTOFOLDER(Functions\UPSMON_PATROLSRCH);
			class fn_DOPATROLSRCH {};
			class fn_GETINPATROLSRCH {};
			class fn_SrchPtrlFlankPos {};
		};
		
		class UPSMON_REINFORCEMENT {
			file = QPATHTOFOLDER(Functions\UPSMON_REINFORCEMENT);
			class fn_CallRenf {};
			class fn_GetReinfPos {};
			class fn_ReinfChk {};
		};

		class UPSMON_RELAX {
			file = QPATHTOFOLDER(Functions\UPSMON_RELAX);
			class fn_Civaction {};
			class fn_DORELAX {};
		};

		class UPSMON_RETREAT {
			file = QPATHTOFOLDER(Functions\UPSMON_RETREAT);
			class fn_DORETREAT {};
			class fn_SrchRetreatPos {};
		};

		class UPSMON_SUPPLY {
			file = QPATHTOFOLDER(Functions\UPSMON_SUPPLY);
			class fn_GetSupply {};
			class fn_GetSupplyPos {};
		};

		class UPSMON_Transport {
			file = QPATHTOFOLDER(Functions\UPSMON_Transport);
			class fn_CheckTransport {};
			class fn_CheckTransported {};
			class fn_Disembarkment {};
			class fn_dodisembark {};
			class fn_DOfindCombatvehicle {};
			class fn_Dofindstatic {};
			class fn_DOfindvehicle {};
			class fn_dohelidisembark {};
			class fn_doparadrop {};
			class fn_Embarkment {};
			class fn_getinassignedveh {};
			class fn_GetTransport {};
			class fn_KeepAltitude {};
			class fn_Returnbase {};
			class fn_SrchTrpPos {};
		};
	};
};
