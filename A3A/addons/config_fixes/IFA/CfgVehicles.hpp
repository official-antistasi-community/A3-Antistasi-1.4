//IFA - CfgVehicles.hpp

class CfgVehicles 
{
	class LIB_StaticCannon_base;

	//Fake OQF 17 pounder for UK forces
	class LIB_Pak40_base;
	class LIB_Pak40 : LIB_Pak40_base {
		class Turrets;
	};
	class LIB_Pak40_g : LIB_Pak40{
		class Turrets : Turrets{
			class CommanderOptics;
			class MainTurret;
		};
	};
	class a3a_lib_oqf17pdr_fake{
		displayName = "OQF 17-Pounder";
		class Turrets : Turrets{
			class MainTurret : MainTurret{
				magazines[] = {"LIB_30x_76L55_APMk3_AP","LIB_14x_76L55_APDSMk1_APCR","LIB_60x_76L55_M42_HE"};
				weapons[] = {"LIB_QF17_L55"};
			};
		};
	};

	//Fake 40mm Bofors AA for US/UK forces
	class LIB_61k_base : LIB_StaticCannon_base {
		class Turrets;
	};
	class LIB_61k : LIB_61k_base{
		class Turrets : Turrets{
			class CommanderOptics;
			class MainTurret;
		};
	};
	class a3a_lib_bofors_fake : LIB_61k{
		displayName = "Bofors 40mm L/60";
		class Turrets : Turrets{
			class MainTurret : MainTurret{
				magazines[] = {"LIB_4x_40mm_Bofors_AA","LIB_4x_40mm_Bofors_AA","LIB_4x_40mm_Bofors_AA","LIB_4x_40mm_Bofors_AA","LIB_4x_40mm_Bofors_AA","LIB_4x_40mm_Bofors_AA","LIB_4x_40mm_Bofors_AA","LIB_4x_40mm_Bofors_AA","LIB_4x_40mm_Bofors_AA","LIB_4x_40mm_Bofors_AA","LIB_4x_40mm_Bofors_AP","LIB_4x_40mm_Bofors_AP","LIB_4x_40mm_Bofors_AP","LIB_4x_40mm_Bofors_AP","LIB_4x_40mm_Bofors_AP","LIB_4x_40mm_Bofors_AP","LIB_4x_40mm_Bofors_AP","LIB_4x_40mm_Bofors_AP","LIB_4x_40mm_Bofors_AP","LIB_4x_40mm_Bofors_AP","LIB_4x_40mm_Bofors_AA","LIB_4x_40mm_Bofors_AA","LIB_4x_40mm_Bofors_AA","LIB_4x_40mm_Bofors_AA","LIB_4x_40mm_Bofors_AA","LIB_4x_40mm_Bofors_AA","LIB_4x_40mm_Bofors_AA","LIB_4x_40mm_Bofors_AA","LIB_4x_40mm_Bofors_AA","LIB_4x_40mm_Bofors_AA","LIB_4x_40mm_Bofors_AP","LIB_4x_40mm_Bofors_AP","LIB_4x_40mm_Bofors_AP","LIB_4x_40mm_Bofors_AP","LIB_4x_40mm_Bofors_AP","LIB_4x_40mm_Bofors_AP","LIB_4x_40mm_Bofors_AP","LIB_4x_40mm_Bofors_AP","LIB_4x_40mm_Bofors_AP","LIB_4x_40mm_Bofors_AP","LIB_4x_40mm_Bofors_AA","LIB_4x_40mm_Bofors_AA","LIB_4x_40mm_Bofors_AA","LIB_4x_40mm_Bofors_AA","LIB_4x_40mm_Bofors_AA","LIB_4x_40mm_Bofors_AA","LIB_4x_40mm_Bofors_AA","LIB_4x_40mm_Bofors_AA","LIB_4x_40mm_Bofors_AA","LIB_4x_40mm_Bofors_AA","LIB_4x_40mm_Bofors_AP","LIB_4x_40mm_Bofors_AP","LIB_4x_40mm_Bofors_AP","LIB_4x_40mm_Bofors_AP","LIB_4x_40mm_Bofors_AP","LIB_4x_40mm_Bofors_AP","LIB_4x_40mm_Bofors_AP","LIB_4x_40mm_Bofors_AP","LIB_4x_40mm_Bofors_AP","LIB_4x_40mm_Bofors_AP","LIB_4x_40mm_Bofors_AA","LIB_4x_40mm_Bofors_AA","LIB_4x_40mm_Bofors_AA","LIB_4x_40mm_Bofors_AA","LIB_4x_40mm_Bofors_AA","LIB_4x_40mm_Bofors_AA","LIB_4x_40mm_Bofors_AA","LIB_4x_40mm_Bofors_AA","LIB_4x_40mm_Bofors_AA","LIB_4x_40mm_Bofors_AA","LIB_4x_40mm_Bofors_AP","LIB_4x_40mm_Bofors_AP","LIB_4x_40mm_Bofors_AP","LIB_4x_40mm_Bofors_AP","LIB_4x_40mm_Bofors_AP","LIB_4x_40mm_Bofors_AP","LIB_4x_40mm_Bofors_AP","LIB_4x_40mm_Bofors_AP","LIB_4x_40mm_Bofors_AP","LIB_4x_40mm_Bofors_AP"};
				weapons[] = {"LIB_Bofors_Mk6"};
			};
		};
	};
	//Fake 6pdr/57mm AT gun for US/UK forces
	class LIB_Zis3_base : LIB_StaticCannon_base {
		class Turrets;
	};
	class LIB_Zis3 : LIB_Zis3_base{
		class Turrets : Turrets{
			class CommanderOptics;
			class MainTurret;
		};
	};
	class a3a_lib_57mmM1_fake : LIB_Zis3{
		displayName = "57mm Gun M1";
		class Turrets : Turrets{
			class  : MainTurret{
				magazines[] = {"LIB_22x_6pdr_mk7_AP","LIB_12x_6pdr_Mk1T_APCR","LIB_21x_6pdr_mk10T_HE"};
				weapons[] = {"LIB_OQF_57"};
			};
		};
	};
	class LIB_US_Willys_MB_M1919;
	class LIB_PzKpfwIV_H_base;
	class LIB_PzKpfwIV_H : LIB_PzKpfwIV_H_base{
		class AnimationSources;
	};
	class a3a_lib_PzKpfwIV_base : LIB_PzKpfwIV_H{
		class AnimationSources : AnimationSources{
			class Hide_Shields_Hull;
			class Hide_Shields_Turret;
		};
	};
	class a3a_lib_PzKpfwIV_noShield : a3a_lib_PzKpfwIV_base{
		class AnimationSources : AnimationSources{
			class Hide_Shields_Hull : Hide_Shields_Hull{
				initPhase = 1;
			};
			class Hide_Shields_Turret : Hide_Shields_Hull{
				initPhase = 1;
			};
		};
	};
	class LIB_FlaK_36;
	class LIB_Zis6_Parm;
	class a3a_lib_Zis6_BOX : LIB_Zis6_Parm {
		displayName = "ZIS-5V (Box)";
		transportRepair = 0;
		typicalCargo[] = {"LIB_FFI_LAT_Soldier"};
		faction = "LIB_FFI";
		side = 2;
	};
};