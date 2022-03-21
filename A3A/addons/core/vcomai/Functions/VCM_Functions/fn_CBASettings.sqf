	/*
	sleep 5;
	waitUntil 
	{
		//CBA CHECK
		if (isClass(configFile >> "CfgPatches" >> "cba_main")) then {CBAACT = true;} else {CBAACT = false;};
		sleep 1;
		!(isNil "CBAACT")
	};
	waituntil
	{
		time > 1
	};
	*/
	
	//CBA CHECK
	if (isClass(configFile >> "CfgPatches" >> "cba_main")) then {CBAACT = true;} else {CBAACT = false;};	
	if (CBAACT) then
	{
		Vcm_ConfigVersion="3.4.1 CBA Settings";

		
		[
			"VCM_ActivateAI", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			"Vcom Active", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			true, // data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
				params ["_value"];
				VCM_ActivateAI = _value;
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;
		
			//VCM_USECBASETTINGS = true; If CBA is enabled on the host, use the CBA default settings. If false, use the filepatching settings instead.
		[
			"VCM_USECBASETTINGS", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			"Use CBA-Vcom Settings?", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			true, // data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
				params ["_value"];
				VCM_USECBASETTINGS = _value;
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;	
		
		[
			"VCM_DebugOld", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			"Old Debug Code Variable - Placeholder.", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			false,// data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{  
				params ["_value"];
				VCM_DebugOld = _value;
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;

		[
			"VCM_DebugFSM", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			"Enable FSM Debug Code", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			false,// data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{  
				params ["_value"];
				VCM_DebugFSM = _value;
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;
	
		[
			"VCM_DebugAIPathing", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			"Enable AI Pathing Debug", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			false,// data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{  
				params ["_value"];
				VCM_DebugAIPathing = _value;
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;
	
		[
			"VCM_DebugSuppression", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			"Enable AI Suppression Debug", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			false,// data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{  
				params ["_value"];
				VCM_DebugSuppression = _value;
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;	

		[
			"VCM_DebugCombatMove", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			"Enable AI Combat Movement Debug", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			false,// data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{  
				params ["_value"];
				VCM_DebugCombatMove = _value;
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;	

		[
			"VCM_SIDEENABLED", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"LIST", // setting type
			"Sides impacted by Vcom.", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[[[west,east,Resistance],[west,east],[west],[east],[Resistance],[Resistance,west],[Resistance,east]],[["West, East, Resistance"],["West, East"],["West"],["East"],["Resistance"],["Resistance, West"],["Resistance, East"]],0], // data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{  
				params ["_value"];
				VCM_SIDEENABLED = _this;
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;
		
		[
			"VCM_ARTYENABLE", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			"Enable AI use of Artillery", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			true, // data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{  
				params ["_value"];
				VCM_ARTYENABLE = _value;
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;
		
		[
			"VCM_ARTYSIDES", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"LIST", // setting type
			"Sides that will use VCOM Artillery", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[[[west,east,Resistance],[west,east],[west],[east],[Resistance],[Resistance,west],[Resistance,east]],[["West, East, Resistance"],["West, East"],["West"],["East"],["Resistance"],["Resistance, West"],["Resistance, East"]],0], // data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{  
				params ["_value"];
				VCM_ARTYSIDES = _this;
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;
		
		[
			"VCM_CARGOCHNG", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			"Vcom handling of disembark/embarking for AI?", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			true,// data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{  
				params ["_value"];
				VCM_CARGOCHNG = _value;
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;
		
		[
			"VCM_TURRETUNLOAD", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			"Disembark from turret positions?", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			true,// data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{  
				params ["_value"];
				VCM_TURRETUNLOAD = _value;
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;
		
		
		[
			"VCM_DISEMBARKRANGE", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"SLIDER", // setting type
			"Distance AI disembark from the enemy?", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[50,1000,200,0], // data for this setting: [min, max, default, number of shown trailing decimals]
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{  
				params ["_value"];
				VCM_DISEMBARKRANGE = _value;
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;
		
		
		[
			"VCM_AISkills_General_EM", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			"AI will use Enhanced Movement", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			true,// data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{  
				params ["_value"];
				Vcm_AI_EM = _value;
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;	
		
		[
			"VCM_AISkills_General_EM_CHN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"SLIDER", // setting type
			"Chance AI use EM - checks every 0.5 secs", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[0,100,10,0], // data for this setting: [min, max, default, number of shown trailing decimals]
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{  
				params ["_value"];
				Vcm_AI_EM_CHN = _value;
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;		
	
		[
			"VCM_AISkills_General_EM_CLDWN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"SLIDER", // setting type
			"Cool down on Enhanced Movement - in secs", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[0,1000,10,0], // data for this setting: [min, max, default, number of shown trailing decimals]
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{  
				params ["_value"];
				VCM_AI_EM_CLDWN = _value;
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;
		
		[
			"VCM_StealVeh", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			"AI steal empty/unlocked vehicles?", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			true,// data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{  
				params ["_value"];
				VCM_StealVeh = _value;
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;
		
		[
			"VCM_ClassSteal", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			"Class restriction for stealing vehicles", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			true,// data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{  
				params ["_value"];
				VCM_ClassSteal = _value;
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;
		
		[
			"VCM_ForceSpeed", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			"Enforce AI Speed 'FULL'?", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			true,// data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{  
				params ["_value"];
				VCM_FullSpeed = _value;
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;
		
		[
			"VCM_ADVANCEDMOVEMENT", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			"AI generate new waypoints to flank.", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			true,// data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{  
				params ["_value"];
				VCM_ADVANCEDMOVEMENT = _value;
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;
		
		[
			"Vcm_IdleAnimationsEnabled", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			"AI use additional idle animations", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			true,// data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{  
				params ["_value"];
				Vcm_IdleAnimationsEnabled = _value;
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;		
	
		[
			"Vcm_IdleAnimationChnc", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"SLIDER", // setting type
			"Chance an AI will play an idle animation.	", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[0,100,2,0], // data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{  
				params ["_value"];
				Vcm_IdleAnimationChnc = _value;
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;	

		
		[
			"VCM_FRMCHANGE", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			"AI change formations based on location.", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			true,// data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{  
				params ["_value"];
				VCM_FRMCHANGE = _value;
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;
		
		[
			"VCM_SKILLCHANGE", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			"AI impacted by Vcom skill settings.", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			true,// data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{  
				params ["_value"];
				VCM_SKILLCHANGE = _value;
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;
		
		[
			"VCM_AIDISTANCEVEHPATH", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"SLIDER", // setting type
			"Distance AI will steal vehicles from.", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[0,1000,100,0], // data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{  
				params ["_value"];
				VCM_AIDISTANCEVEHPATH = _value;
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;
		
		[
			"VCM_RAGDOLL", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			"AI Ragdoll when hit?", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			true,// data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{  
				params ["_value"];
				VCM_RAGDOLL = _value;
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;
		
		[
			"VCM_RAGDOLLCHC", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"SLIDER", // setting type
			"Chance for AI to ragdoll when hit.", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[0,100,100,0], // data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{  
				params ["_value"];
				VCM_RAGDOLLCHC = _value;
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;
		
		
		[
			"VCM_HEARINGDISTANCE", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"SLIDER", // setting type
			"Distance AI can hear gunfire.", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[0,10000,1200,0], // data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{  
				params ["_value"];
				VCM_HEARINGDISTANCE = _value;
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;
		
		[
			"VCM_WARNDIST", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"SLIDER", // setting type
			"Distance AI will call for reinforcements from.", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[0,10000,1000,0], // data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{  
				params ["_value"];
				VCM_WARNDIST = _value;
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;
		
		[
			"VCM_WARNDELAY", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"SLIDER", // setting type
			"Time (seconds) AI wait before support called.", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[0,10000,30,0], // data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{  
				params ["_value"];
				VCM_WARNDELAY = _value;
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;
		
		[
			"VCM_STATICARMT", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"SLIDER", // setting type
			"Time (seconds) AI stay on unarmed Static Weapons", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[0,10000,300,0], // data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{  
				params ["_value"];
				VCM_STATICARMT = _value;
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;
		
		
		[
			"VCM_MINECHANCE", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"SLIDER", // setting type
			"Chance for AI to place a mine, once in combat.", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[0,100,75,0], // data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{  
				params ["_value"];
				VCM_MINECHANCE = _value;
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;
		
		[
			"VCM_ARTYDELAY", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"SLIDER", // setting type
			"Delay before artillery requests. SIDE BASED.", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[0,5000,30,0], // data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{  
				params ["_value"];
				VCM_ARTYDELAY = _value;
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;
		
		
		[
			"VCM_AIMagLimit", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"SLIDER", // setting type
			"Mag count AI begin to look for additional mags.", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[2,10,5,0], // data for this setting: [min, max, default, number of shown trailing decimals]
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{  
				params ["_value"];
				VCM_AIMagLimit = _value;
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;
		
		[
			"VCM_AISNIPERS", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			"Special marksman/sniper AI", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			true,// data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{  
				params ["_value"];
				VCM_AISNIPERS = _value;
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;
		/*
		[
			"VCM_AISUPPRESS", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			"AI attempt to suppress enemies more, and at a further range.", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			true,// data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{  
				params ["_value"];
				VCM_AISUPPRESS = _value;
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;
		*/
		[
			"VCM_ADVANCEDMOVEMENT", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			"AI generate new waypoints to flank.", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			true,// data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{  
				params ["_value"];
				VCM_ADVANCEDMOVEMENT = _value;
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;
		
		[
			"Vcm_DrivingActivated", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			"Experimental Improvements to AI driving.", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			false,// data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{  
				params ["_value"];
				Vcm_DrivingActivated = _value;
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;
		
		/*
		[
			"Vcm_PlayerAISkills", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			"Player AI recieve unique skill settings", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			true,// data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{  
				params ["_value"];
				Vcm_PlayerAISkills = _value;
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;
		*/
		
		[
			"Vcm_SmokeGrenadeChance", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"SLIDER", // setting type
			"Chance AI throw smoke", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[0,100,10,2], // data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
				params ["_value"];
				Vcm_SmokeChance = _value;
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;		
		
		[
			"Vcm_GrenadeChance", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"SLIDER", // setting type
			"Chance AI throw grenades", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[0,100,10,2], // data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
				params ["_value"];
				Vcm_GrenadeChance = _value;
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;			
	

		[
			"Vcm_AISkills_General_GrenadeCoolDown", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"SLIDER", // setting type
			"Grenade Cooldown", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM AI General Skill", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[0,1000,60,2], // data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
				params ["_value"];
				Vcm_GrenadeCoolDown = _value;
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;		

		[
			"Vcm_AISkills_General_SmokeCoolDown", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"SLIDER", // setting type
			"Smoke Grenade Cooldown", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM AI General Skill", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[0,1000,60,2], // data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
				params ["_value"];
				Vcm_SmokeCooldown = _value;
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;	

		[
			"Vcm_RadioChatter", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			"Disable AI Radio Chatter", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			false,// data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
				params ["_value"];
				Vcm_DisableAIRadio = _value;
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;

		[
			"Vcm_StaticWeapons", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			"Disable Static Weapon Use", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			false,// data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
				params ["_value"];
				Vcm_UseStaticWeapons = _value;
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;
		
		//SKILL SETTINGS
		[
			"Vcm_AISkills_SideSpecific", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			"AI skill settings are side specific", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM SETTINGS", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			false,// data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{  
				params ["_value"];
				VCM_SIDESPECIFICSKILL = _value;
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;
	
		//WEST SIDE SKILLS
		//WEST SIDE SKILLS
		//WEST SIDE SKILLS
		//WEST SIDE SKILLS
		//West side skill VCM_AIDIFWEST = [['aimingAccuracy',0.25],['aimingShake',0.15],['aimingSpeed',0.35],['commanding',0.85],['courage',0.5],['general',1],['reloadSpeed',1],['spotDistance',0.85],['spotTime',0.85]];
		[
			"Vcm_AISkills_West_AimingAccuracy", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"SLIDER", // setting type
			"West aiming accuracy", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM AI West Skill", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[0,1,0.25,2], // data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
				params ["_value"];
				VCM_AIDIFWEST set [0,['aimingAccuracy',_value]];
				publicVariable "VCM_AIDIFWEST";
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;			
		[
			"Vcm_AISkills_West_aimingShake", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"SLIDER", // setting type
			"West aiming shake", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM AI West Skill", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[0,1,0.15,2], // data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
				params ["_value"];
				VCM_AIDIFWEST set [1,['aimingShake',_value]];
				publicVariable "VCM_AIDIFWEST";
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;	
		[
			"Vcm_AISkills_West_aimingSpeed", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"SLIDER", // setting type
			"West aiming speed", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM AI West Skill", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[0,1,0.15,2], // data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
				params ["_value"];
				VCM_AIDIFWEST set [2,['aimingSpeed',_value]];
				publicVariable "VCM_AIDIFWEST";
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;	
		[
			"Vcm_AISkills_West_commanding", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"SLIDER", // setting type
			"West commanding", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM AI West Skill", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[0,1,0.85,2], // data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
				params ["_value"];
				VCM_AIDIFWEST set [3,['commanding',_value]];
				publicVariable "VCM_AIDIFWEST";
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;	
		[
			"Vcm_AISkills_West_courage", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"SLIDER", // setting type
			"West courage", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM AI West Skill", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[0,1,0.5,2], // data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
				params ["_value"];
				VCM_AIDIFWEST set [4,['courage',_value]];
				publicVariable "VCM_AIDIFWEST";
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;	
		[
			"Vcm_AISkills_West_general", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"SLIDER", // setting type
			"West general", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM AI West Skill", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[0,1,0.5,2], // data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
				params ["_value"];
				VCM_AIDIFWEST set [5,['general',_value]];
				publicVariable "VCM_AIDIFWEST";
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;	
		[
			"Vcm_AISkills_West_reloadSpeed", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"SLIDER", // setting type
			"West reloadSpeed", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM AI West Skill", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[0,1,1,2], // data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
				params ["_value"];
				VCM_AIDIFWEST set [6,['reloadSpeed',_value]];
				publicVariable "VCM_AIDIFWEST";
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;	
		[
			"Vcm_AISkills_West_spotDistance", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"SLIDER", // setting type
			"West spotDistance", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM AI West Skill", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[0,1,0.85,2], // data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
				params ["_value"];
				VCM_AIDIFWEST set [7,['spotDistance',_value]];
				publicVariable "VCM_AIDIFWEST";
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;	
		[
			"Vcm_AISkills_West_spotTime", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"SLIDER", // setting type
			"West spotTime", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM AI West Skill", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[0,1,0.85,2], // data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
				params ["_value"];
				VCM_AIDIFWEST set [8,['spotTime',_value]];
				publicVariable "VCM_AIDIFWEST";
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;	
		
	
	
		//EAST SIDE SKILLS
		//EAST SIDE SKILLS
		//EAST SIDE SKILLS
		//EAST SIDE SKILLS
		//EAST side skill VCM_AIDIFWEST = [['aimingAccuracy',0.25],['aimingShake',0.15],['aimingSpeed',0.35],['commanding',0.85],['courage',0.5],['general',1],['reloadSpeed',1],['spotDistance',0.85],['spotTime',0.85]];
		[
			"Vcm_AISkills_East_AimingAccuracy", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"SLIDER", // setting type
			"East aiming accuracy", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM AI East Skill", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[0,1,0.25,2], // data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
				params ["_value"];
				VCM_AIDIFEast set [0,['aimingAccuracy',_value]];
				publicVariable "VCM_AIDIFEast";
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;			
		[
			"Vcm_AISkills_East_aimingShake", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"SLIDER", // setting type
			"East aiming shake", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM AI East Skill", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[0,1,0.15,2], // data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
				params ["_value"];
				VCM_AIDIFEast set [1,['aimingShake',_value]];
				publicVariable "VCM_AIDIFEast";
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;	
		[
			"Vcm_AISkills_East_aimingSpeed", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"SLIDER", // setting type
			"East aiming speed", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM AI East Skill", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[0,1,0.15,2], // data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
				params ["_value"];
				VCM_AIDIFEast set [2,['aimingSpeed',_value]];
				publicVariable "VCM_AIDIFEast";
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;	
		[
			"Vcm_AISkills_East_commanding", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"SLIDER", // setting type
			"East commanding", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM AI East Skill", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[0,1,0.85,2], // data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
				params ["_value"];
				VCM_AIDIFEast set [3,['commanding',_value]];
				publicVariable "VCM_AIDIFEast";
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;	
		[
			"Vcm_AISkills_East_courage", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"SLIDER", // setting type
			"East courage", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM AI East Skill", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[0,1,0.5,2], // data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
				params ["_value"];
				VCM_AIDIFEast set [4,['courage',_value]];
				publicVariable "VCM_AIDIFEast";
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;	
		[
			"Vcm_AISkills_East_general", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"SLIDER", // setting type
			"East general", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM AI East Skill", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[0,1,0.5,2], // data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
				params ["_value"];
				VCM_AIDIFEast set [5,['general',_value]];
				publicVariable "VCM_AIDIFEast";
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;	
		[
			"Vcm_AISkills_East_reloadSpeed", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"SLIDER", // setting type
			"East reloadSpeed", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM AI East Skill", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[0,1,1,2], // data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
				params ["_value"];
				VCM_AIDIFEast set [6,['reloadSpeed',_value]];
				publicVariable "VCM_AIDIFEast";
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;	
		[
			"Vcm_AISkills_East_spotDistance", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"SLIDER", // setting type
			"East spotDistance", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM AI East Skill", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[0,1,0.85,2], // data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
				params ["_value"];
				VCM_AIDIFEast set [7,['spotDistance',_value]];
				publicVariable "VCM_AIDIFEast";
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;	
		[
			"Vcm_AISkills_East_spotTime", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"SLIDER", // setting type
			"East spotTime", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM AI East Skill", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[0,1,0.85,2], // data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
				params ["_value"];
				VCM_AIDIFEast set [8,['spotTime',_value]];
				publicVariable "VCM_AIDIFEast";
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;	
			
	
	
		//Resistance SIDE SKILLS
		//Resistance SIDE SKILLS
		//Resistance SIDE SKILLS
		//Resistance SIDE SKILLS
		//Resistance side skill VCM_AIDIFWEST = [['aimingAccuracy',0.25],['aimingShake',0.15],['aimingSpeed',0.35],['commanding',0.85],['courage',0.5],['general',1],['reloadSpeed',1],['spotDistance',0.85],['spotTime',0.85]];
		[
			"Vcm_AISkills_Resistance_AimingAccuracy", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"SLIDER", // setting type
			"Resistance aiming accuracy", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM AI Resistance Skill", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[0,1,0.25,2], // data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
				params ["_value"];
				VCM_AIDIFResistance set [0,['aimingAccuracy',_value]];
				publicVariable "VCM_AIDIFResistance";
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;			
		[
			"Vcm_AISkills_Resistance_aimingShake", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"SLIDER", // setting type
			"Resistance aiming shake", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM AI Resistance Skill", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[0,1,0.15,2], // data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
				params ["_value"];
				VCM_AIDIFResistance set [1,['aimingShake',_value]];
				publicVariable "VCM_AIDIFResistance";
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;	
		[
			"Vcm_AISkills_Resistance_aimingSpeed", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"SLIDER", // setting type
			"Resistance aiming speed", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM AI Resistance Skill", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[0,1,0.15,2], // data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
				params ["_value"];
				VCM_AIDIFResistance set [2,['aimingSpeed',_value]];
				publicVariable "VCM_AIDIFResistance";
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;	
		[
			"Vcm_AISkills_Resistance_commanding", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"SLIDER", // setting type
			"Resistance commanding", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM AI Resistance Skill", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[0,1,0.85,2], // data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
				params ["_value"];
				VCM_AIDIFResistance set [3,['commanding',_value]];
				publicVariable "VCM_AIDIFResistance";
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;	
		[
			"Vcm_AISkills_Resistance_courage", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"SLIDER", // setting type
			"Resistance courage", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM AI Resistance Skill", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[0,1,0.5,2], // data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
				params ["_value"];
				VCM_AIDIFResistance set [4,['courage',_value]];
				publicVariable "VCM_AIDIFResistance";
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;	
		[
			"Vcm_AISkills_Resistance_general", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"SLIDER", // setting type
			"Resistance general", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM AI Resistance Skill", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[0,1,0.5,2], // data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
				params ["_value"];
				VCM_AIDIFResistance set [5,['general',_value]];
				publicVariable "VCM_AIDIFResistance";
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;	
		[
			"Vcm_AISkills_Resistance_reloadSpeed", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"SLIDER", // setting type
			"Resistance reloadSpeed", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM AI Resistance Skill", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[0,1,1,2], // data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
				params ["_value"];
				VCM_AIDIFResistance set [6,['reloadSpeed',_value]];
				publicVariable "VCM_AIDIFResistance";
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;	
		[
			"Vcm_AISkills_Resistance_spotDistance", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"SLIDER", // setting type
			"Resistance spotDistance", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM AI Resistance Skill", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[0,1,0.85,2], // data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
				params ["_value"];
				VCM_AIDIFResistance set [7,['spotDistance',_value]];
				publicVariable "VCM_AIDIFResistance";
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;	
		[
			"Vcm_AISkills_Resistance_spotTime", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"SLIDER", // setting type
			"Resistance spotTime", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM AI Resistance Skill", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[0,1,0.85,2], // data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
				params ["_value"];
				VCM_AIDIFResistance set [8,['spotTime',_value]];
				publicVariable "VCM_AIDIFResistance";
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;	
	
	
		//General skills
		//General skills
		//General skills
		//General skills
		//VCM_AIDIFA = [['aimingAccuracy',0.25],['aimingShake',0.15],['aimingSpeed',0.35],['commanding',0.85],['courage',0.5],['general',1],['reloadSpeed',1],['spotDistance',0.85],['spotTime',0.85]];
		[
			"Vcm_AISkills_General_AimingAccuracy", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"SLIDER", // setting type
			"General aiming accuracy", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM AI General Skill", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[0,1,0.25,2], // data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
				params ["_value"];
				VCM_AIDIFA set [0,['aimingAccuracy',_value]];
				publicVariable "VCM_AIDIFA";
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;			
		[
			"Vcm_AISkills_General_aimingShake", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"SLIDER", // setting type
			"General aiming shake", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM AI General Skill", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[0,1,0.15,2], // data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
				params ["_value"];
				VCM_AIDIFA set [1,['aimingShake',_value]];
				publicVariable "VCM_AIDIFA";
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;	
		[
			"Vcm_AISkills_General_aimingSpeed", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"SLIDER", // setting type
			"General aiming speed", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM AI General Skill", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[0,1,0.35,2], // data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
				params ["_value"];
				VCM_AIDIFA set [2,['aimingSpeed',_value]];
				publicVariable "VCM_AIDIFA";
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;	
		[
			"Vcm_AISkills_General_commanding", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"SLIDER", // setting type
			"General commanding", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM AI General Skill", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[0,1,0.85,2], // data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
				params ["_value"];
				VCM_AIDIFA set [3,['commanding',_value]];
				publicVariable "VCM_AIDIFA";
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;	
		[
			"Vcm_AISkills_General_courage", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"SLIDER", // setting type
			"General courage", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM AI General Skill", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[0,1,0.5,2], // data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
				params ["_value"];
				VCM_AIDIFA set [4,['courage',_value]];
				publicVariable "VCM_AIDIFA";
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;	
		[
			"Vcm_AISkills_General_general", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"SLIDER", // setting type
			"General general", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM AI General Skill", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[0,1,0.5,2], // data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
				params ["_value"];
				VCM_AIDIFA set [5,['general',_value]];
				publicVariable "VCM_AIDIFA";
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;	
		[
			"Vcm_AISkills_General_reloadSpeed", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"SLIDER", // setting type
			"General reloadSpeed", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM AI General Skill", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[0,1,1,2], // data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
				params ["_value"];
				VCM_AIDIFA set [6,['reloadSpeed',_value]];
				publicVariable "VCM_AIDIFA";
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;	
		[
			"Vcm_AISkills_General_spotDistance", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"SLIDER", // setting type
			"General spotDistance", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM AI General Skill", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[0,1,0.85,2], // data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
				params ["_value"];
				VCM_AIDIFA set [7,['spotDistance',_value]];
				publicVariable "VCM_AIDIFA";
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;	
		[
			"Vcm_AISkills_General_spotTime", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"SLIDER", // setting type
			"General spotTime", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"VCOM AI General Skill", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[0,1,0.85,2], // data for this setting:
			true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
				params ["_value"];
				VCM_AIDIFA set [8,['spotTime',_value]];
				publicVariable "VCM_AIDIFA";
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;
		

	
	
	
	};
	
	diag_log "VCOM: Finished loading CBA settings";
	
	
	