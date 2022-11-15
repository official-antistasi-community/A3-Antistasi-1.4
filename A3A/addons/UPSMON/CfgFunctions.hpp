class CfgFunctions {
	class UPSMON {
		class AMBUSH {
			file = QPATHTOFOLDER(Functions\AMBUSH);
			class FindAmbushPos {};
			class getAmbushpos {};
			class SetAmbush {};
		};

		class ARTILLERY {
			file = QPATHTOFOLDER(Functions\ARTILLERY);
			class ArtiChk {};
			class artillery_add {};
			class artilleryBatteryout {};
			class artillerydofire {};
			class artillerysetBattery {};
			class Flaretime {};
			class FO {};
			class GetArtiTarget {};
			class GetDefaultmun {};
			class getmuninfos {};
			class getmuninfosbackpack {};
			class selectartillery {};
			class Splashzone {};
		};

		class COMMON {
			file = QPATHTOFOLDER(Functions\COMMON);
			class closedoor {};
			class markerAlpha {};
		};

		class buildings {
			file = QPATHTOFOLDER(Functions\COMMON\buildings);
			class checkdoorposition {};
			class Checkfreebldpos {};
			class Checkfreebldpos2 {};
			class checkwindowposition {};
			class filterbuilding {};
			class gethighestbldpos {};
			class GetNearestBuilding {};
			class GetNearestBuildings {};
			class Inbuilding {};
			class Isroof {};
			class SortOutBldpos {};
			class SortOutBldpos2 {};
			class UnitWatchDir {};
			class WillSee {};
		};

		class Core {
			file = QPATHTOFOLDER(Functions\COMMON\Core);
			class AddtoArray {};
			class arrayShufflePlus {};
			class CanSee {};
			class checkbackpack {};
			class createmarker {};
			class createsign {};
			class deleteDead {};
			class DeleteWP {};
			class distancePosSqr {};
			class DoaddWP {};
			class DocreateWP {};
			class getArg {};
			class GetCOS {};
			class getDirPos {};
			class getminesclass {};
			class Getnearestplayer {};
			class GetOut {};
			class GetPos2D {};
			class GetSIN {};
			class Getunitsincargo {};
			class Haslos {};
			class LOS {};
			class Nighttime {};
			class Nowp {};
			class overwatch {};
			class randomPos {};
			class Replace {};
			class rotpoint {};
			class setArg {};
			class SN_EHFIREDNEAR {};
			class SN_EHHIT {};
			class SN_EHKILLED {};
			class SN_EHKILLEDCIV {};
			class spawnmines {};
			class stayInside {};
			class StrIndex {};
			class StrInStr {};
			class StrLen {};
			class StrToArray {};
			class TRACK {};
			class TRACK2 {};
		};

		class Cover {
			file = QPATHTOFOLDER(Functions\COMMON\Cover);
			class filter {};
			class find_cover {};
			class move_to_cover {};
		};

		class Group {
			file = QPATHTOFOLDER(Functions\COMMON\Group);
			class analysegrp {};
			class Cangrpmaneuver {};
			class ChangeFormation {};
			class checkallied {};
			class checkmunition {};
			class checksizetargetgrp {};
			class composeteam {};
			class getleader {};
			class getNearestSoldier {};
			class GetStaticTeam {};
			class getunits {};
			class GothitParam {};
			class grptype {};
			class Isgrpstuck {};
			class IsRetreating {};
			class IsSurrending {};
			class SetLeaderGrp {};
			class Supressfire {};
			class supstatestatus {};
		};

		class MP {
			file = QPATHTOFOLDER(Functions\COMMON\MP);
			class setVehicleInit {};
			class setVehicleVarName {};
		};

		class Params {
			file = QPATHTOFOLDER(Functions\COMMON\Params);
			class BacktoNormal {};
			class GetGroupbehaviour {};
			class GetGroupformation {};
			class GetGroupspeed {};
			class GetParams {};
			class GetRespawndelay {};
			class GetRespawnpos {};
			class GetRespawntime {};
			class NOSMOKE {};
			class SetClones {};
			class SetEventhandlers {};
			class SetMarkerArea {};
			class SetRenfParam {};
			class Settemplate {};
		};

		class target {
			file = QPATHTOFOLDER(Functions\COMMON\target);
			class Checkratio {};
			class ClassifyEnies {};
			class Eniesnear {};
			class findnearestenemy {};
			class Shareinfos {};
			class TargetAcquisition {};
			class TargetAcquisitionCiv {};
		};

		class terrain {
			file = QPATHTOFOLDER(Functions\COMMON\terrain);
			class sample_terrain {};
			class TerraCognita {};
		};

		class unit {
			file = QPATHTOFOLDER(Functions\COMMON\unit);
			class addequipment {};
			class cancelstop {};
			class CreateSmokeCover {};
			class deadbodies {};
			class DeployStatic {};
			class Disableunitloop {};
			class DoFireFlare {};
			class doGetOut {};
			class domove {};
			class DoRearm {};
			class DoSmokeScreen {};
			class doStop {};
			class DoSurrender {};
			class dowatch {};
			class FireFlare {};
			class FireGun {};
			class firing {};
			class getequipment {};
			class Getmemberstype {};
			class movetoDriver {};
			class movetogunner {};
			class Packbag {};
			class PutMine {};
			class PutSatchel {};
			class Rearm {};
			class SetMinefield {};
			class SetSatchel {};
			class surrended {};
			class throw_grenade {};
			class throw_stone {};
			class Unpackbag {};
			class Watchbino {};
		};
		
		class vehicles {
			file = QPATHTOFOLDER(Functions\COMMON\vehicles);
			class Allowgetin {};
			class assignasgunner {};
			class assignasrole {};
			class avoidDissembark {};
			class checkleaveVehicle {};
			class Checkvehiclesstatus {};
			class EjectUnits {};
			class Emptyturret {};
			class commonTurrets {};
			class Gunnercrew {};
			class unitsInCargo {};
			class GetIn_NearestVehicles {};
			class GetNearestStatics {};
			class GetNearestVehicles {};
			class Gunnercontrol {};
			class selectvehicles {};
			class UnitsGetIn {};
			class UnitsGetOut {};
		};

		class FORTIFY {
			file = QPATHTOFOLDER(Functions\FORTIFY);
			class Fortify {};
			class moveBuildings {};
			class moveNearestBuildings {};
			class movetoBuilding {};
			class patrolBuilding {};
			class SpawninBuildings {};
			class unitdefend {};
		};
		class POS {
			file = QPATHTOFOLDER(Functions\POS);
			class findclosestposition {};
			class getmarkercorners {};
			class getmarkershape {};
			class getpos {};
			class getposfromcircle {};
			class getposfromellipse {};
			class getposfromrectangle {};
			class getposfromsquare {};
			class isblacklisted {};
			class isincircle {};
			class isinellipse {};
			class isinrectangle {};
			class issameposition {};
			class rotateposition {};
			class getpos {};
			class getposmarker {};
			class pos {};
		};
		class GROUP {
			file = QPATHTOFOLDER(Functions\GROUP);
			class CreateGroup {};
		};

		class INIT {
			file = QPATHTOFOLDER(Functions\INIT);
			class Init_UPSMON {};
			class UPSMON {};
		};

		class LOOP {
			file = QPATHTOFOLDER(Functions\LOOP);
			class MAINLOOP {};
			class MAINLOOPCiv {};
		};

		class MODULES {
			file = QPATHTOFOLDER(Functions\MODULES);
			class CLONES {};
			class ModifyUcthis {};
			class RESPAWN {};
			class spawn {};
		};

		class UPSMON_ASSAULT {
			file = QPATHTOFOLDER(Functions\UPSMON_ASSAULT);
			class AssltBld {};
			class Assltposition {};
			class DOASSAULT {};
			class PLANASSLT {};
		};

		class UPSMON_DEFEND {
			file = QPATHTOFOLDER(Functions\UPSMON_DEFEND);
			class DODEFEND {};
			class SrchGuardPos {};
		};

		class UPSMON_FLANK {
			file = QPATHTOFOLDER(Functions\UPSMON_FLANK);
			class DOFLANK {};
			class PLANFLANK {};
			class SrchFlankPos {};
			class SrchFlankPosforboat {};
		};

		class UPSMON_PATROL {
			file = QPATHTOFOLDER(Functions\UPSMON_PATROL);
			class DOPATROL {};
			class SrchPtrlPos {};
		};

		class UPSMON_PATROLSRCH {
			file = QPATHTOFOLDER(Functions\UPSMON_PATROLSRCH);
			class DOPATROLSRCH {};
			class GETINPATROLSRCH {};
			class SrchPtrlFlankPos {};
		};
		
		class UPSMON_REINFORCEMENT {
			file = QPATHTOFOLDER(Functions\UPSMON_REINFORCEMENT);
			class CallRenf {};
			class GetReinfPos {};
			class ReinfChk {};
		};

		class UPSMON_RELAX {
			file = QPATHTOFOLDER(Functions\UPSMON_RELAX);
			class Civaction {};
			class DORELAX {};
		};

		class UPSMON_RETREAT {
			file = QPATHTOFOLDER(Functions\UPSMON_RETREAT);
			class DORETREAT {};
			class SrchRetreatPos {};
		};

		class UPSMON_SUPPLY {
			file = QPATHTOFOLDER(Functions\UPSMON_SUPPLY);
			class GetSupply {};
			class GetSupplyPos {};
		};

		class UPSMON_Transport {
			file = QPATHTOFOLDER(Functions\UPSMON_Transport);
			class CheckTransport {};
			class CheckTransported {};
			class Disembarkment {};
			class dodisembark {};
			class DOfindCombatvehicle {};
			class Dofindstatic {};
			class DOfindvehicle {};
			class dohelidisembark {};
			class doparadrop {};
			class Embarkment {};
			class getinassignedveh {};
			class GetTransport {};
			class KeepAltitude {};
			class Returnbase {};
			class SrchTrpPos {};
		};
	};
};
