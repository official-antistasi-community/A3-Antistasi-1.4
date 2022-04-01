class VCOM
{
	tag = "VCM";
	
	class FSM
	{
		file = QPATHTOFOLDER(vcomai\FSMS);
		
		// group spawn VCM_fnc_SQUADBEH
		class SQUADBEH 
		{
			ext = ".fsm";
		};
		
		// [] spawn VCM_fnc_AIDRIVEBEHAVIOR
		class AIDRIVEBEHAVIOR
		{
			ext = ".fsm";
		};		
		
		// [] spawn VCM_fnc_PLAYERSQUAD
		class PLAYERSQUAD
		{
			ext = ".fsm";
		};		
		// [] spawn VCM_fnc_ForceMoveFSM;
		class ForceMoveFSM
		{
			ext = ".fsm";
		};
	};
	
	class Functions 
	{
		file = QPATHTOFOLDER(vcomai\Functions\VCM_Functions);
		
		//[] spawn VCM_fnc_VcomInit;
		class VcomInit {};
		
		//[] spawn VCM_fnc_AfterInit;
		class AfterInit {};

		// [unitToRearm, rearmLocation] spawn VCM_fnc_ActRearm
		class ActRearm {};
		
		// [unit, source, damage, instigator] call VCM_fnc_AIHIT;
		class AIHIT {};
		
		// [group] call VCM_fnc_ArmStatics;
		class ArmStatics {};
		
		// [callGroup, enemyGroup] call VCM_fnc_ArtyCall;
		class ArtyCall {};
		
		// group call VCM_fnc_ArtyManage;
		class ArtyManage {};
		
		// [entity, unit] call VCM_fnc_BoxNrst;
		class BoxNrst {};
		
		// unit call VCM_fnc_CheckArty;
		class CheckArty {};
		
		// [string] call VCM_fnc_Classname;
		class Classname {};
		
		// [group, enemy] call VCM_fnc_ClearBuilding;
		class ClearBuilding {};
		
		// unit call VCM_fnc_ClstEmy;
		class ClstEmy {};
		
		// [list, object, order, script] call VCM_fnc_ClstObj;
		class ClstObj {};
		
		// [unit, killer] call VCM_fnc_ClstWarn;
		class ClstWarn {};
		
		// [group, searchDistance] call VCM_fnc_EmptyStatic;
		class EmptyStatic {};
		
		// unit call VCM_fnc_EnemyArray;
		class EnemyArray {};
		
		// [groupLeader] call VCM_fnc_FindCover;
		class FindCover {};
		
		// [groupLeader] spawn VCM_fnc_FlankMove;
		class FlankMove {};
		
		// [groupLeader] call VCM_fnc_ForceMove;
		class ForceMove {};
		
		// unit call VCM_fnc_FriendlyArray;
		class FriendlyArray {};
		
		// unit call VCM_fnc_FrmChnge;
		class FrmChnge {};
		
		// group spawn VCM_fnc_Garrison;
		class Garrison {};
		
		// group call VCM_fnc_GarrisonLight;
		class GarrisonLight {};
		
		// unit call VCM_fnc_HasMine;
		class HasMine {};
		
		// unit call VCM_fnc_HealSelf;
		class HealSelf {};
		
		// [unit, weapon, muzzle, mode, ammo, magazine, bullet, gunner] call VCM_fnc_HearingAids;
		class HearingAids {};
		
		// [object, searchRadius, precision, sortingOrder] call VCM_fnc_Heights;
		class Heights {};
		
		// [] call VCM_fnc_IRCHECK;
		class IRCHECK {};
		
		// group call VCM_fnc_KitChk;
		class KitChk {};
		
		// [array, unitToReveal, revealAmount] call VCM_fnc_KnowAbout;
		class KnowAbout {};
		
		// group call VCM_fnc_MedicalHandler
		class MedicalHandler {};
		
		//[medic, injuredUnit] spawn VCM_fnc_MedicHeal;
		class MedicHeal {};

		// [gunner, backpackClassname, staticWeapon] call VCM_fnc_PackStatic;
		class PackStatic {};
		
		// group call VCM_fnc_RearmSelf;
		class RearmSelf {};
		
		// group call VCM_fnc_RMedics;
		class RMedics {};
		
		// group call VCM_fnc_RStatics;
		class RStatics {};

		// group call VCM_fnc_SquadExc;
		class SquadExc {};
		
		// group call VCM_fnc_WyptChk;
		class WyptChk {};	
		
		//group call VCM_fnc_VehicleCommandeer;
		class vehiclecommandeer {};
		
		//group call VCM_fnc_VehicleCheck;
		class VehicleCheck {};

		//group call VCM_fnc_VehicleMove;
		class VehicleMove {};	

		//group call VCM_fnc_IsTransport;
		class IsTransport {};

		//[_pos,_dist,_params] call VCM_fnc_isFlatEmpty;
		class isFlatEmpty {};	

		//[] call VCM_fnc_CBASettings;
		class CBASettings {};
		
		//[] call VCM_fnc_SniperList
		class SniperList {};
		
		//[] spawn VCM_fnc_SniperEngage;
		class SniperEngage;
		
		//[] spawn VCM_fnc_RangeEngage;
		class RangeEngage;

		//[] call VCM_fnc_ClstKnwnEnmy;
		class ClstKnwnEnmy;

		// unit call VCM_fnc_IsDriver;
		class IsDriver {};			

		//unit call VCM_fnc_VehicleDetection;
		class VehicleDetection {};
		
		//[unit,4] call VCM_fnc_MovePrediction;
		class MovePrediction {};
		
		//[] call VCM_fnc_UpdateDrivers;
		class UpdateDrivers {};

		//[] call VCM_fnc_IdleAnimations;
		class IdleAnimations {};
		
		//[] call VCM_fnc_CoverDetect;
		class CoverDetect {};
		
		//[] call VCM_fnc_CoverControl;
		class CoverControl {};
				
		//[] call VCM_fnc_Scheduler;
		class Scheduler {};
		
		//[AIArray] call VCM_fnc_ResetAnimation;
		class ResetAnimation {};
		
		//[AI,TRUE] call VCM_fnc_ForceGrenadeFire; //0 = Unit to throw the grenade 1=true, throw grenade, false, throw smoke 
		class ForceGrenadeFire {};
		
		//[Unit,"Text"] call VCM_fnc_DebugText;
		class DebugText {};
		
		//[squadleader] call VCM_fnc_AISpeed;
		class AISpeed {};
				
		//[_StaticList] call VCM_fnc_StaticCheck.sqf;
		class StaticCheck {};
		
		//[] spawn VCM_fnc_MonitorDist;
		class MonitorDist {};
				
		//[] spawn VCM_fnc_3DPathDebug;
		class 3DPathDebug {};
		
		//[] spawn VCM_fnc_UseEM;
		class UseEM {};
		
		//[] spawn VCM_fnc_BabeOver;
		class BabeOver {};
		
		//[] spawn VCM_fnc_UseEMExec;
		class UseEMExec {};
		
		//[] spawn VCM_fnc_AISuppressed;
		class AISuppressed {};
		
		//[] call VCM_fnc_WeaponDefine;
		class WeaponDefine {postInit = 1;};

		//[] call VCM_fnc_SideIsEnemy;
		class SideIsEnemy {};
	};		

};