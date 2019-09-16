if (!isServer) exitwith {};

_cas = _this select 0;
_object = _this select 1;

switch (_cas) do {
		case 0: {
		// composition pour fabrique IED
		
			_objects = [[_object,"TOP"],"DemoCharge_Remote_Ammo",1,[(random 0.2)+0.2,(random 0.2)-0.1,0],(random 20)-10] call BIS_fnc_spawnObjects;
			_objects = [[_object,"TOP"],"DemoCharge_Remote_Ammo",1,[(random 0.2)-0.4,(random 0.2)-0.2,0],random 60] call BIS_fnc_spawnObjects;
			_objects = [[_object,"TOP"],"Land_DuctTape_F",1,[-0.4,(random 0.2)+0.3,0],(random 20)-20] call BIS_fnc_spawnObjects;
			_objects = [[_object,"TOP"],"Land_File1_F",1,[-0.4,-0.5,0],90] call BIS_fnc_spawnObjects;
			_objects = [[_object,"TOP"],"Land_Can_V3_F",1,[-0.4,-0.6,0],90] call BIS_fnc_spawnObjects;
			_objects = [[_object,"TOP"],"Land_Screwdriver_V2_F",1,[-0.3,-0.5,0],random 90] call BIS_fnc_spawnObjects;
			_objects = [[_object,"TOP"],"Land_MobilePhone_old_F",1,[-0.4,-0.3,0],60] call BIS_fnc_spawnObjects;
			_objects = [[_object,"TOP"],"Land_MultiMeter_F",1,[-0.2,+0.5,0],random 180] call BIS_fnc_spawnObjects;
		};
		
		case 1: {
		// Composition pour QG insurgé
			_file = selectRandom ["Land_File1_F","Land_FilePhotos_F","Land_File2_F"];
			_pen = selectRandom ["Land_PenRed_F","Land_PenBlack_F"];
			
			_objects = [[_object,"TOP"],"Land_Map_altis_F",1,[0,0,0],(getdir _object)+ 180] call BIS_fnc_spawnObjects;
			_objects = [[_object,"TOP"],"Land_PortableLongRangeRadio_F",1,[-0.4,(random 0.2)+0.3,0],(random 20)-20] call BIS_fnc_spawnObjects;
			_objects = [[_object,"TOP"],"Land_BottlePlastic_V1_F",1,[-0.4,-0.2,0],0] call BIS_fnc_spawnObjects;
			_objects = [[_object,"TOP"],_file,1,[-0.4,-0.6,0],90] call BIS_fnc_spawnObjects;
			_objects = [[_object,"TOP"],_pen,1,[-0.3,-0.5,0],random 90] call BIS_fnc_spawnObjects;
		
		};
		
		case 2: {
		// Composition table argent
		
			_ordi = selectRandom ["Land_Laptop_unfolded_F","Land_Laptop_F"];
			_file = selectRandom ["Land_File1_F","Land_FilePhotos_F","Land_File2_F"];
			_pen = selectRandom ["Land_PenRed_F","Land_PenBlack_F"];
			_can = selectRandom ["Land_Can_V2_F","Land_Can_V3_F","Land_Can_Rusty_F","Land_Can_V1_F"];
			
			_objects = [[_object,"TOP"],_ordi,1,[0,0,0],(getdir _object) +270] call BIS_fnc_spawnObjects;
			_objects = [[_object,"TOP"],"Land_MobilePhone_smart_F",1,[-0.4,(random 0.2)+0.3,-0.4],(random 20)-20] call BIS_fnc_spawnObjects;
			_objects = [[_object,"TOP"],_can,1,[0.2,-0.4,-0.4],0] call BIS_fnc_spawnObjects;
			_objects = [[_object,"TOP"],"Land_Money_F",1,[0.4,0.5,-0.1],0] call BIS_fnc_spawnObjects;
			_objects = [[_object,"TOP"],_file,1,[-0.4,-0.6,0],90] call BIS_fnc_spawnObjects;
			_objects = [[_object,"TOP"],_pen,1,[-0.3,-0.5,0],random 90] call BIS_fnc_spawnObjects;
		};
		
		case 3: {
		// Composition table d'operation
			_object1 = selectRandom ["Land_Bandage_F","Land_BloodBag_F","Land_Antibiotic_F","Land_Bandage_F","Land_Bandage_F","Land_PainKillers_F"];
			_object2 = selectRandom ["Land_Bandage_F","Land_BloodBag_F","Land_Antibiotic_F","Land_Bandage_F","Land_Bandage_F","Land_PainKillers_F"];
			_object3 = selectRandom ["Land_Bandage_F","Land_BloodBag_F","Land_Antibiotic_F","Land_Bandage_F","Land_Bandage_F","Land_PainKillers_F"];
			
			_objects = [[_object,"TOP"],"Land_Defibrillator_F",1,[0,random -0.2,0],(getdir _object)+ 180] call BIS_fnc_spawnObjects;
			_objects = [[_object,"TOP"],"Land_Bandage_F",1,[-0.4,(random 0.2)+0.3,0],(random 20)-20] call BIS_fnc_spawnObjects;
			_objects = [[_object,"TOP"],_object1,1,[-0.4,-0.1,0],random 90] call BIS_fnc_spawnObjects;
			_objects = [[_object,"TOP"],_object2,1,[-0.2,-0.1,0],random 180] call BIS_fnc_spawnObjects;
			_objects = [[_object,"TOP"],"Land_Antibiotic_F",1,[-0.4,-0.5,0],90] call BIS_fnc_spawnObjects;
			_objects = [[_object,"TOP"],"Land_BloodBag_F",1,[-0.3,0,0],random 90] call BIS_fnc_spawnObjects;
			_objects = [[_object,"TOP"],_object3,1,[0.2,0.1,0],random 90] call BIS_fnc_spawnObjects;
			_objects = [[_object,"TOP"],_object1,1,[0.4,0.3,0],random 180] call BIS_fnc_spawnObjects;
			_objects = [[_object,"TOP"],_object2,1,[0.3,-0.4,0],random 180] call BIS_fnc_spawnObjects;
		};	

		case 4: {
		// Composition atelier réparation
			_objects = [[_object,"TOP"],"Land_CanisterOil_F",1,[-0.5,-0.1,0],random 180] call BIS_fnc_spawnObjects;
			_objects = [[_object,"TOP"],"Land_MultiMeter_F",1,[0.2,0.2,0],(random 20)-20] call BIS_fnc_spawnObjects;
			_objects = [[_object,"TOP"],"Land_Pliers_F",1,[0.1,0.1,0],0] call BIS_fnc_spawnObjects;
		};
		
		case 5: {
		// compostion pour etagère ied
			_obj1 = "Land_FMradio_F" createVehicle [0,0,0];
			_obj1 setdir ((getdir _object) + random 30);
			_obj1 attachTo [_object,[0,0,0.54]];
			_obj2 = "Land_HandyCam_F" createVehicle [0,0,0];
			_obj2 setdir random 180;
			_obj2 attachTo [_object,[0.1,0.3,0.15]];
			_obj4 = "Land_ButaneCanister_F" createVehicle [0,0,0];
			_obj4 attachTo [_object,[-0.2,0.3,0.2]];
			_obj3 = "Land_PortableLongRangeRadio_F" createVehicle [0,0,0];
			_obj3 attachTo [_object,[-0.2,-0.2,0.15]];
		};
		
		case 6: {
		// Composition dépot munition
		
			_weapon = selectRandom ["arifle_TRG21_F","arifle_TRG20_F","arifle_TRG21_GL_F","arifle_TRG20_ACO_Flash_F","launch_B_Titan_short_F"];
			_weaponspawn = createvehicle ["groundWeaponHolder", getposATL _object, [], 0, "can_collide"]; 
			_weaponspawn addweaponcargo [_weapon,1]; 
			_weaponspawn setVectorDirAndUp [[0,0,1],[0,0,0]];
			_tablePosition = getPosATL _object; 
			_tableMaxWorldBounds = _object modelToWorld (boundingBox _object select 1);
			_tablePosition set [2, _tableMaxWorldBounds select 2]; 
			_weaponspawn setPosATL _tablePosition;
			
			_objects = [[_object,"TOP"],"Land_Magazine_rifle_F",1,[-0.3,0.1,0],90] call BIS_fnc_spawnObjects;
			_objects = [[_object,"TOP"],"Land_Magazine_rifle_F",1,[-0.4,(random 0.2)+0.3,0],(random 20)-20] call BIS_fnc_spawnObjects;
			_objects = [[_object,"TOP"],"Land_Magazine_rifle_F",1,[-0.4,-0.1,0],random 90] call BIS_fnc_spawnObjects;
		};
		
		case 5: {
		// compostion pour tentes
			_obj1 = "Land_Ammobox_rounds_F" createVehicle [0,0,0];
			_obj1 setdir ((getdir _object) + random 30);
			_obj1 attachTo [_object,[0,0,0.54]];
		};
};
 
 //[0,0,-0.25],