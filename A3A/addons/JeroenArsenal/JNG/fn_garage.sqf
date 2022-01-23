#include "defineCommon.inc"


disableserialization;

_mode = [_this,0,"Open",[displaynull,""]] call bis_fnc_param;
_this = [_this,1,[]] call bis_fnc_param;
if!(_mode in ["draw3D","addVehicle"])then{diag_log ("jng call "+_mode);};

switch _mode do {

	///////////////////////////////////////////////////////////////////////////////////////////
	case "draw3D": {
		_display = uiNamespace getVariable "arsanalDisplay";
		_cam = (uinamespace getvariable ["BIS_fnc_arsenal_cam",objnull]);
		_center = (missionnamespace getvariable ["JNG_CENTER",objnull]);
		_target = (missionnamespace getvariable ["BIS_fnc_arsenal_target",objnull]);

		_camPos = (uinamespace getvariable ["BIS_fnc_arsenal_campos",objnull]);

		_dis = _camPos select 0;
		_dirH = _camPos select 1;
		_dirV = _camPos select 2;

		[_target,[_dirH + 180,-_dirV,0]] call bis_fnc_setobjectrotation;
		_target attachto [_center,_camPos select 3,""]; //--- Reattach for smooth movement

		_cam setpos (_target modeltoworld [0,-_dis,0]);
		_cam setvectordirandup [vectordir _target,vectorup _target];




		{
			_ctrl = _x;
			_offset = _ctrl getVariable ["location",[0,0,0]];

			if (_offset distance [0,0,0] > 0) then {
				_pos = _center modeltoworldvisual _offset;
				_uiPos = worldtoscreen _pos;
				if (count _uiPos > 0) then {
					{
						_ctrlPos = ctrlposition _ctrl;
						_ctrlPos set [0,(_uiPos select 0) - (_ctrlPos select 2) * 0.5];
						_ctrlPos set [1,(_uiPos select 1) - (_ctrlPos select 3) * 0.5];
						_ctrl ctrlsetposition _ctrlPos;
						_ctrl ctrlcommit 0;

					} foreach [IDC_RSCDISPLAYARSENAL_ICON,IDC_RSCDISPLAYARSENAL_ICONBACKGROUND];
				};
			};
		} foreach (missionnamespace getvariable ["JNG_garage_icons",[]]);
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "MouseZChanged": {

		_cam = (uinamespace getvariable ["BIS_fnc_arsenal_cam",objnull]);
		_center = (missionnamespace getvariable ["JNG_CENTER",objnull]);
		_target = (missionnamespace getvariable ["BIS_fnc_arsenal_target",objnull]);
		_camPos = (uinamespace getvariable ["BIS_fnc_arsenal_campos",objnull]); //[5,-180.171,31.4394,[-0.151687,-0.000455028,0.169312]]

		_disMax = ((boundingboxreal _center select 0) vectordistance (boundingboxreal _center select 1)) * 1.5;
		_disMin = _disMax * 0.15;
		_z = _this select 1;
		_dis = _camPos select 0;
		_dis = _dis - (_z / 10);
		_dis = _dis max _disMin min _disMax;
		_camPos set [0,_dis];
	};

	/////////////////////////////////////////////////////////////////////////////////////////// Externaly called
	case "CustomInit":{
		_display = _this select 0;

		["CustomEvents",[_display]] call  jn_fnc_garage;
		["CustomLayout",[_display]] call  jn_fnc_garage;
		["CreateListsLeft",[_display]] call  jn_fnc_garage;


		_message = cursorObject call jn_fnc_garage_canGarageVehicle;
		if(_message isEqualTo "")then{
			//looking at a vehicle that can be stored
			missionnamespace setvariable ["JNG_CENTER",cursorObject];
		}else{
			//not looking at vehicle open garage normaly
			missionnamespace setvariable ["JNG_CENTER",player];
		};

		missionnamespace setvariable ["JNG_garage_icons",[]];

		//["TabSelectLeft",[_display,0],true] call jn_fnc_garage;

		["showMessage",[_display,"Jeroen (Not) Limited Garage"]] call jn_fnc_arsenal;

		//how current resources
		//["ShowStats",[_display]] call jn_fnc_garage;
		//["jn_fnc_garage"] call bis_fnc_endLoadingScreen;
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "CustomEvents":{
		_display = _this select 0;

		with (uinamespace) do {

				//Keys
			_display displayRemoveAllEventHandlers "keydown";
			_display displayAddEventHandler ["keydown",{['KeyDown',_this] call jn_fnc_garage;}];

			//custom draw function to remove icons on player
			removeMissionEventHandler ["draw3D",BIS_fnc_arsenal_draw3D];
			BIS_fnc_arsenal_draw3D = addMissionEventHandler ["draw3D",{
					["draw3D",[]] call jn_fnc_garage;
			}];

			//custom scroll zoom
			_ctrlMouseArea = _display displayctrl IDC_RSCDISPLAYARSENAL_MOUSEAREA;
			_ctrlMouseArea ctrlRemoveAllEventHandlers "mousezchanged";
			_ctrlMouseArea ctrladdeventhandler ["mousezchanged",{["MouseZChanged",[ctrlparent (_this select 0), (_this select 1)]] call jn_fnc_garage;}];

			//disable annoying deselecting of tabs when you misclick
			_ctrlMouseArea ctrlRemoveEventHandler ["mousebuttonclick",0];

			//
			_ctrlButtonClose = _display displayctrl (getnumber (configfile >> "RscDisplayArsenal" >> "Controls" >> "ControlBar" >> "controls" >> "ButtonClose" >> "idc"));
			_ctrlButtonClose ctrlRemoveAllEventHandlers "buttonclick";
			_ctrlButtonClose ctrlSetText "Close";// "Get vehicle"
			_ctrlButtonClose ctrladdeventhandler ["buttonclick",{["buttonGetVehicle",[ctrlparent (_this select 0)]] call jn_fnc_garage;}];

			//lock button
			_ctrlButtonLock = _display displayctrl IDC_RSCDISPLAYARSENAL_CONTROLSBAR_BUTTONINTERFACE;
			_ctrlButtonLock ctrlEnable false;
			_ctrlButtonLock ctrlRemoveAllEventHandlers "buttonclick";
			_ctrlButtonLock ctrladdeventhandler ["buttonclick",{["lockButton",[ctrlparent (_this select 0)]] call jn_fnc_garage;}];
			_ctrlButtonLock ctrlSetText "(Un)Lock";
			_ctrlButtonLock ctrlSetTooltip "(Un)Lock vehicle so others can use it";

			//disable
			_ctrlButtonExport = _display displayctrl IDC_RSCDISPLAYARSENAL_CONTROLSBAR_BUTTONEXPORT;
			_ctrlButtonExport ctrlRemoveAllEventHandlers "buttonclick";
			_ctrlButtonExport ctrlSetText "TODO";
			_ctrlButtonExport ctrlEnable false;

			//disable
			_ctrlButtonImport = _display displayctrl IDC_RSCDISPLAYARSENAL_CONTROLSBAR_BUTTONIMPORT;
			_ctrlButtonImport ctrlRemoveAllEventHandlers "buttonclick";
			_ctrlButtonImport ctrlSetText "TODO";
			_ctrlButtonImport ctrlEnable false;

			//disable
			_ctrlButtonRandom = _display displayctrl IDC_RSCDISPLAYARSENAL_CONTROLSBAR_BUTTONRANDOM;
			_ctrlButtonRandom ctrlRemoveAllEventHandlers "buttonclick";
			_ctrlButtonRandom ctrlSetText "TODO";
			_ctrlButtonRandom ctrlEnable false;

			//disable
			_ctrlButtonSave = _display displayctrl IDC_RSCDISPLAYARSENAL_CONTROLSBAR_BUTTONSAVE;
			_ctrlButtonSave ctrlRemoveAllEventHandlers "buttonclick";
			_ctrlButtonSave ctrlSetText "TODO";
			_ctrlButtonSave ctrlEnable false;

			//disable
			_ctrlButtonLoad = _display displayctrl IDC_RSCDISPLAYARSENAL_CONTROLSBAR_BUTTONLOAD;
			_ctrlButtonLoad ctrlRemoveAllEventHandlers "buttonclick";
			_ctrlButtonLoad ctrlSetText "TODO";
			_ctrlButtonLoad ctrlEnable false;

			//custom button for add subtrack items in lists
			_ctrlArrowLeft = _display displayctrl IDC_RSCDISPLAYARSENAL_ARROWLEFT;
			_ctrlArrowLeft ctrlRemoveAllEventHandlers "buttonclick";
			_ctrlArrowLeft ctrladdeventhandler ["buttonclick",{["buttonCargo",[ctrlparent (_this select 0),-1]] call jn_fnc_garage;}];

			_ctrlArrowRight = _display displayctrl IDC_RSCDISPLAYARSENAL_ARROWRIGHT;
			_ctrlArrowRight ctrlRemoveAllEventHandlers "buttonclick";
			_ctrlArrowRight ctrladdeventhandler ["buttonclick",{["buttonCargo",[ctrlparent (_this select 0),+1]] call jn_fnc_garage;}];

			//custom event for turret selection in rearm tab
			_ctrlSort = _display displayctrl(IDC_RSCDISPLAYARSENAL_SORT + IDC_JNG_TAB_REARM_SORT);
			_ctrlSort ctrladdeventhandler ["lbselchanged",{["SelectRearmList",[ctrlparent (_this select 0)]] call jn_fnc_garage;}];

			{
				_idc = _x;

				_ctrlIcon = _display displayctrl (IDC_RSCDISPLAYARSENAL_ICON + _idc);
				_ctrlTab = _display displayctrl (IDC_RSCDISPLAYARSENAL_TAB + _idc);
				{
					_x ctrlRemoveAllEventHandlers "buttonclick";
					if (_idc in [IDCS_LEFT]) then {
						_x ctrladdeventhandler ["buttonclick",format ["['TabSelectLeft',[ctrlparent (_this select 0),%1],true] call jn_fnc_garage;",_idc]];
					} else {
						_x ctrladdeventhandler ["buttonclick",format ["['TabSelectRight',[ctrlparent (_this select 0),%1],true] call jn_fnc_garage;",_idc]];
					};
				} foreach [_ctrlIcon,_ctrlTab];

				_ctrlList = _display displayctrl (IDC_RSCDISPLAYARSENAL_LIST + _idc);
				_ctrlList ctrlRemoveAllEventHandlers "LBSelChanged";
				_ctrlList ctrlAddEventHandler ["MouseButtonUp",	{uiNamespace setvariable ['jng_userInput',true];}];
				_ctrlList ctrlAddEventHandler ["LBSelChanged",	format ["
					if(uiNamespace getvariable ['jng_userInput',false])then{
						['SelectItem',[ctrlparent (_this select 0),(_this select 0),%1]] call jn_fnc_garage;
						uiNamespace setvariable ['jng_userInput',false];
					};
				",_idc]];

				//sort

			} foreach IDCS;


		};
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "CustomLayout":{
		_display = _this select 0;

		//disable unwanted icons on left
		for "_x" from 0 to IDC_RSCDISPLAYARSENAL_TAB_WATCH step 1 do {
			_index = _x;
			{
				_ctrlTab = _display displayctrl(_index + _x);
				_ctrlTab ctrlShow false;
				_ctrlTab ctrlEnable false;
				//_ctrlTab ctrlRemoveAllEventHandlers "buttonclick";
				_ctrlTab ctrlCommit 0;
			} forEach [IDC_RSCDISPLAYARSENAL_ICON,IDC_RSCDISPLAYARSENAL_ICONBACKGROUND,IDC_RSCDISPLAYARSENAL_TAB];
		};

		//move list up because we removed the sort
		_ctrlSort = _display displayctrl(IDC_RSCDISPLAYARSENAL_SORT + IDC_JNG_TAB_REARM_SORT);// [1.18712,-0.389091,0.45,0.04]
		_ctrlList = _display displayctrl(IDC_RSCDISPLAYARSENAL_LIST + IDC_JNG_TAB_REARM);//  [1.18712,-0.389091,0.45,0.6]
		_posSort = ctrlPosition _ctrlSort;
		_posList = ctrlPosition _ctrlList;
		{
			private _ctrlList = _display displayctrl(IDC_RSCDISPLAYARSENAL_LIST + _x);
			_ctrlList ctrlSetPosition _posList;
		} forEach [IDCS_RIGHT];
		//move list down a bit so new sort box fits
		_posList set [1,(_posSort select 1) + (_posSort select 3)];
		_ctrlList ctrlSetPosition _posList;


		//replace icons in left tab copy from garage
		{
			_index = _foreachindex;
			_indexMoveTo = _foreachindex*2;
			_ctrlTab = _display displayctrl(IDC_RSCDISPLAYARSENAL_TAB + _index);
			_ctrlTabMoveTo = _display displayctrl(IDC_RSCDISPLAYARSENAL_TAB + _indexMoveTo);

			//move icons
			_ctrlTab ctrlSetPosition (ctrlPosition _ctrlTabMoveTo);

			//show icons
			_ctrlTab ctrlEnable true;
			_ctrlTab ctrlShow true;
			_ctrlTab ctrlSetScale 2;
			_ctrlTab ctrlSetText gettext(configfile >> "RscDisplayGarage" >> "Controls" >> _x >> "text");
			_ctrlTab ctrlSetTooltip gettext(configfile >> "RscDisplayGarage" >> "Controls" >> _x >> "tooltip");

			_ctrlTab ctrlCommit 0;

			//move list to the right to not clip with bigger icons
			_ctrlList = _display displayctrl(IDC_RSCDISPLAYARSENAL_LIST + _index);
			_pos = (ctrlPosition _ctrlList);
			_pos set [0, (safezoneX + (1 + 1.5 * 2) *(((safezoneW / safezoneH) min 1.2) / 40))];
			_ctrlList ctrlsetPosition _pos;
			_ctrlList ctrlCommit 0;

		} forEach ["TabCar","TabTank","TabHelicopter","TabPlane","TabNaval","TabStatic"];


		//calculate offset
		_ctrlTab = _display displayctrl(IDC_RSCDISPLAYARSENAL_TAB + IDC_RSCDISPLAYARSENAL_TAB_ITEMOPTIC);
		_location1 = ctrlPosition _ctrlTab;
		_ctrlTab = _display displayctrl(IDC_RSCDISPLAYARSENAL_TAB + IDC_RSCDISPLAYARSENAL_TAB_ITEMACC);
		_location2 = ctrlPosition _ctrlTab;
		_offset = ((_location2 select 1) - (_location1 select 1));

		{
			_index = _x select 0;
			_icon = _x select 1;
			_toolTip = _x select 2;

			_ctrlTab = _display displayctrl(IDC_RSCDISPLAYARSENAL_TAB + _index);
			_ctrlTab ctrlshow false;
			_ctrlTab ctrlEnable false;
			_ctrlTab ctrlSetText _icon;
			_ctrlTab ctrlSetTooltip _toolTip;
			_ctrlTab ctrlSetPosition _location1;
			_location1 set [1, (_location1 select 1)+_offset];
		} forEach [
			[IDC_JNG_TAB_REARM,"\A3\ui_f\data\IGUI\Cfg\Actions\reload_ca.paa","Rearm"],
			[IDC_JNG_TAB_REPAIR,"\A3\ui_f\data\IGUI\Cfg\Actions\repair_ca.paa","Repairing"],

			[IDC_JNG_TAB_REFUEL,"\A3\ui_f\data\IGUI\Cfg\Actions\refuel_ca.paa","Refueling"],
			[IDC_JNG_TAB_TEXTURE,"\A3\ui_f\data\GUI\Rsc\RscDisplayGarage\textureSources_ca.paa","Camo"],
			[IDC_JNG_TAB_COMPONENT,"\A3\ui_f\data\GUI\Rsc\RscDisplayGarage\animationSources_ca.paa","Parts"],
			[IDC_JNG_TAB_PYLON,"\A3\ui_f\data\IGUI\Cfg\Actions\reammo_ca.paa","Pylon loadout"]
		];

		_ctrlFrameLeft = _display displayctrl IDC_RSCDISPLAYARSENAL_FRAMELEFT;
		_pos = (ctrlPosition _ctrlFrameLeft);
		_pos set [0, (safezoneX + (1 + 1.5 * 2) *(((safezoneW / safezoneH) min 1.2) / 40))];
		_ctrlFrameLeft ctrlsetPosition _pos;
		_ctrlFrameLeft ctrlCommit 0;

		_idcSort = [];
		{
			_idcSort pushback (IDC_RSCDISPLAYARSENAL_SORT + _x);
		} forEach [IDCS_LEFT];

		{
			_ctrl = _display displayctrl _x;
			_pos = (ctrlPosition _ctrl);
			_pos set [0, (safezoneX + (1 + 1.5 * 2) *(((safezoneW / safezoneH) min 1.2) / 40))];
			_ctrl ctrlsetPosition _pos;
			_ctrl ctrlCommit 0;
		} foreach (
			[
				IDC_RSCDISPLAYARSENAL_LINETABLEFT,
				IDC_RSCDISPLAYARSENAL_FRAMELEFT,
				IDC_RSCDISPLAYARSENAL_BACKGROUNDLEFT
			] +	_idcSort
		);
	};

	/////////////////////////////////////////////////////////////////////////////////////////// Externaly called
	case "Open":{
		jng_vehicleList = _this select 0;
        jng_ammoList = _this select 1;
		private _object = missionnamespace getVariable ["jng_object",objNull];
		["Open",[nil,_object,player,false]] call bis_fnc_arsenal;
	};






	///////////////////////////////////////////////////////////////////////////////////////////
	case "CreateListsLeft":{
		_display =  _this select 0;

		//loop all vehicle types
		{
			_vehicleList = _x;
			_index = _foreachindex;
			_ctrlList = _display displayctrl (IDC_RSCDISPLAYARSENAL_LIST + _index);
			lbclear _ctrlList;

			//Fill it
			{
				_data = _x;
				["addVehicle",[_data,_index]] call jn_fnc_garage;
			} forEach _vehicleList;

			//Sort
			lbSort _ctrlList;

			//Deselect
			_ctrlList lbSetCurSel -1;

		} forEach jng_vehicleList;
	};

	/////////////////////////////////////////////////////////////////////////////////////////// GLOBAL
	case "addVehicle":{
		_data =  _this select 0;
		_index = _this select 1;

		_display =  uiNamespace getVariable ["arsanalDisplay","No display"];

		if (typeName _display == "STRING") exitWith {};
		if(str _display isEqualTo "No display")exitWith{};

		SPLIT_SAVE
		_ctrlList = _display displayctrl (IDC_RSCDISPLAYARSENAL_LIST + _index);

		//add
		_lbAdd = _ctrlList lbadd _name;
		_ctrlList lbsetdata [_lbAdd, str _data];
		_ctrlList lbsetpicture [_lbAdd,gettext (configfile >> "cfgvehicles" >> _type >> "picture")];
		_ctrlList lbSetTooltip [_lbAdd,"test"];

		//setcolor if vehicle is locked
		["UpdateItemColor",[_display,_index,_lbAdd]] call jn_fnc_garage;
	};

	/////////////////////////////////////////////////////////////////////////////////////////// GLOBAL
	case "updateVehicle":{
		_dataNew =  _this select 0;
		_index = _this select 1;
		_display =  uiNamespace getVariable ["arsanalDisplay","No display"];
		if (typeName _display == "STRING") exitWith {};
		if(str _display isEqualTo "No display")exitWith{};

		_data = _dataNew;
		SPLIT_SAVE
		_name2 = _name;

		private _ctrlList = _display displayCtrl (IDC_RSCDISPLAYARSENAL_LIST + _index);
		for "_l" from 0 to (lbsize _ctrlList - 1) do {
			private _datastr = _ctrlList lbdata _l;
			DECOMPILE_DATA
			SPLIT_SAVE
			if(_name isEqualTo _name2)exitWith{
				_ctrlList lbsetdata [_l,str _dataNew];
				["UpdateItemColor",[_display,_index,_l]] call jn_fnc_garage;
			};
		};
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "UpdateItemColor":{
		params["_display","_index","_l"];
		private _ctrlList = _display displayCtrl (IDC_RSCDISPLAYARSENAL_LIST + _index);
		private _dataStr = _ctrlList lbdata _l;

		DECOMPILE_DATA
		SPLIT_SAVE
		diag_log ["_beingChanged",_beingChanged];
		diag_log ["_locked",_locked];

		if(!isMultiplayer)exitWith{};
		if(_beingChanged isEqualTo "" || _beingChanged isEqualTo (name player))then{

			if(_locked isEqualTo (getPlayerUID player))then{
				_ctrlList lbSetTooltip [_l,"Selected"];
				_ctrlList lbSetColor [_l,[0,1,0,1]];//green
				_ctrlList lbSetSelectColor [_l,[0,1,0,1]];
			}else{
				if(_locked isEqualTo "")then{
					_ctrlList lbSetTooltip [_l,"Select"];
					_ctrlList lbSetColor [_l,[1,1,1,1]];//white
					_ctrlList lbSetSelectColor [_l,[1,1,1,1]];
				}else{
					_ctrlList lbSetTooltip [_l,"Locked by "+_lockedName];
					_ctrlList lbSetColor [_l,[1,0,0,1]];//red
					_ctrlList lbSetSelectColor [_l,[0,1,0,1]];
				};
			};
		}else{
			_ctrlList lbSetTooltip [_l,"Is selected by "+ _beingChanged];
			_ctrlList lbSetColor [_l,[1,1,1,0.25]];//grey
			_ctrlList lbSetSelectColor [_l,[1,1,1,0.25]];
		};
	};

	/////////////////////////////////////////////////////////////////////////////////////////// GLOBAL
	case "updateVehicleSingleData":{
		_nameUpdate = _this select 0;
		_index = _this select 1;

		_beingChangedUpdate = _this select 2;
		_lockedUpdate = _this select 3;
		_lockedNameUpdate = _this select 4;
		_display =  uiNamespace getVariable ["arsanalDisplay","No display"];

		if (typeName _display == "STRING") exitWith {};
		if(str _display isEqualTo "No display")exitWith{};

		_ctrlList = _display displayctrl (IDC_RSCDISPLAYARSENAL_LIST + _index);

		_rowSize = (lbsize _ctrlList - 1);
		for "_l" from 0 to _rowSize do {
			_dataStr = _ctrlList lbdata _l;
			DECOMPILE_DATA
			SPLIT_SAVE

			if(_name isEqualTo _nameUpdate)exitWith{
				//update
				if!(isnil "_beingChangedUpdate")then{_beingChanged = _beingChangedUpdate;};
				if!(isnil "_lockedUpdate")then{_locked = _lockedUpdate;};
				if!(isnil "_lockedNameUpdate")then{_lockedName = _lockedNameUpdate;};

				//save
				COMPILE_SAVE
				_ctrlList lbsetdata [_l,_datastr];

				//change color
				["UpdateItemColor",[_display,_index,_l]] call jn_fnc_garage;
			};

		};
	};

	/////////////////////////////////////////////////////////////////////////////////////////// GLOBAL
	case "removeVehicle":{
		_nameRemove = _this select 0;
		_index = _this select 1;

		_display =  uiNamespace getVariable ["arsanalDisplay","No display"];

		if (typeName _display == "STRING") exitWith {};
		if(str _display isEqualTo "No display")exitWith{};

		_ctrlList = _display displayctrl (IDC_RSCDISPLAYARSENAL_LIST + _index);

		_rowSize = (lbsize _ctrlList - 1);
		for "_l" from 0 to _rowSize do {
			_dataStr = _ctrlList lbdata _l;
			DECOMPILE_DATA
			SPLIT_SAVE

			if(_name isEqualTo _nameRemove)exitWith{
				_ctrlList lbdelete _l;
			};

		};
	};

	/////////////////////////////////////////////////////////////////////////////////////////// EVENT
	case "SelectItem":{
		private _display = _this select 0;
		private _ctrlList = _this select 1;
		private _index = _this select 2;



		private _cursel = lbcursel _ctrlList;
		private _type = (ctrltype _ctrlList == 102);
		private _center = (missionnamespace getvariable ["JNG_CENTER",player]);
		private _checkboxTextures = [
			tolower gettext (configfile >> "RscCheckBox" >> "textureUnchecked"),
			tolower gettext (configfile >> "RscCheckBox" >> "textureChecked")
		];


		private _dataStr = if _type then{_ctrlList lnbData [_cursel,0]}else{_ctrlList lbdata _cursel};
		DECOMPILE_DATA

		private _initVehicle = false;
		switch _index do {
			case IDC_JNG_TAB_CAR;
			case IDC_JNG_TAB_ARMOR;
			case IDC_JNG_TAB_HELI;
			case IDC_JNG_TAB_PLANE;
			case IDC_JNG_TAB_NAVAL;
			case IDC_JNG_TAB_STATIC: {
				["Preview", [_display,_data,_index]] call jn_fnc_garage;
			};
			case IDC_JNG_TAB_REPAIR: {

			};
			case IDC_JNG_TAB_HARDPOINT: {
				_nodeID = _data select 0;

				//remove old static
				{
					if!(BIS_fnc_arsenal_target isEqualTo _x)then{//lets not remove the camara thats attached to
						_x hideObject true;
						detach _x;
						deleteVehicle _x;
					};
				} forEach attachedObjects _center;

				//user selected empty
				_attachItemNew = [];
				if!(_data isEqualTo "")then{
					SPLIT_SAVE
					_attachItemNew = _data;//save _data so we can update vehicle data later

					//add new
					private _attachment = ["CreateVehicle",[_data,true,[0,0,0]]] call jn_fnc_garage;
					[_center,_attachment, false,false] call jn_fnc_logistics_load;
				};

				//set radio button
				for "_l" from 0 to  (lbsize _ctrlList - 1) do {
					_ctrlList lbsetpicture [_l,_checkboxTextures select 0];
				};
				_ctrlList lbsetpicture [_cursel,_checkboxTextures select 1];

				//get selected ctrl on the left
				private _indexLeft = _center call jn_fnc_garage_getVehicleIndex;
				private _ctrlListLeft = _display displayCtrl (IDC_RSCDISPLAYARSENAL_LIST + _indexLeft);

				//load vehicle
				private _cursel = lbCurSel _ctrlListLeft;
				private _datastr = _ctrlListLeft lbdata _cursel;
				DECOMPILE_DATA
				SPLIT_SAVE

				//update vehicle
				_attachItem = _attachItemNew;
				COMPILE_SAVE

				//save vehicle
				_ctrlListLeft lbsetdata [_cursel,_datastr];

			};
			case IDC_JNG_TAB_PYLON: {
				private _item = _data select 0;
				private _idPylon = _data select 1;

				//get selected ctrl on the left
				private _index = _center call jn_fnc_garage_getVehicleIndex;
				private _ctrlListLeft = _display displayCtrl (IDC_RSCDISPLAYARSENAL_LIST + _index);

				//load vehicle data
				private _datastr = _ctrlListLeft lnbdata [_cursel,0];
				DECOMPILE_DATA
				SPLIT_SAVE


				_cfg = (configfile >> "cfgMagazines" >> _item);
				_maxAmmo = getNumber(_cfg >> "count");

				//update
				_ammoPylon set [_idPylon-1, [_item,_maxAmmo]];
				_center setPylonLoadOut [_idPylon, _item];

				//set radio button
				for "_l" from 0 to (((lnbsize _ctrlList) select 0) - 1) do {
					_ctrlList lnbsetpicture [[_l,0],_checkboxTextures select 0];
				};
				_ctrlList lnbsetpicture [[_cursel,0],_checkboxTextures select 1];



				//save data
				COMPILE_SAVE
				_ctrlList lbsetdata [_cursel,_datastr];

			};
			case IDC_JNG_TAB_REARM: {

			};
			case IDC_JNG_TAB_REFUEL: {

			};
			case IDC_JNG_TAB_TEXTURE: {
				_selected = _checkboxTextures find (_ctrlList lbpicture _cursel);
				for "_i" from 0 to (lbsize _ctrlList - 1) do {
					_ctrlList lbsetpicture [_i,_checkboxTextures select 0];
				};
				_ctrlList lbsetpicture [_cursel,_checkboxTextures select 1];
				_initVehicle = true;
			};
			case IDC_JNG_TAB_COMPONENT: {
				_selected = _checkboxTextures find (_ctrlList lbpicture _cursel);
				_ctrlList lbsetpicture [_cursel,_checkboxTextures select ((_selected + 1) % 2)];
				_initVehicle = true;
			};
		};


		if (_initVehicle) then {
			["initVehicle",[_display,_center]] call jn_fnc_garage;
		};
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "initVehicle": {
		_display = _this select 0;
		_center = _this select 1;

		_checkboxTextures = [
			tolower gettext (configfile >> "RscCheckBox" >> "textureUnchecked"),
			tolower gettext (configfile >> "RscCheckBox" >> "textureChecked")
		];

		_ctrlListTextures = _display displayctrl (IDC_RSCDISPLAYARSENAL_LIST + IDC_JNG_TAB_TEXTURE);
		_ctrlListAnimations = _display displayctrl (IDC_RSCDISPLAYARSENAL_LIST + IDC_JNG_TAB_COMPONENT);

		_textures = "";
		_animations = [];
		for "_i" from 0 to (lbsize _ctrlListTextures - 1) do {
			if ((_ctrlListTextures lbpicture _i) == (_checkboxTextures select 1)) exitwith {_textures = [_ctrlListTextures lbdata _i,1];};
		};
		for "_i" from 0 to (lbsize _ctrlListAnimations - 1) do {
			_animations pushback (_ctrlListAnimations lbdata _i);
			_animations pushback (_checkboxTextures find (_ctrlListAnimations lbpicture _i));
		};

		[_center,_textures,_animations] call bis_fnc_initVehicle;
	};

	/////////////////////////////////////////////////////////////////////////////////////////// EVENT
	case "TabSelectLeft":{
		_display = _this select 0;
		_index = _this select 1;

		//show selected, disable others
		{
			_idc = _x;
			_active = _idc == _index;

			{
				_ctrlList = _display displayctrl (_x + _idc);
				_ctrlList ctrlenable _active;
				_ctrlList ctrlsetfade ([1,0] select _active);
				_ctrlList ctrlcommit FADE_DELAY;
			} foreach [IDC_RSCDISPLAYARSENAL_LIST,IDC_RSCDISPLAYARSENAL_LISTDISABLED,IDC_RSCDISPLAYARSENAL_SORT];

			_ctrlTab = _display displayctrl (IDC_RSCDISPLAYARSENAL_TAB + _idc);
			_ctrlTab ctrlenable !_active;

			if (_active) then {
				_ctrlList = _display displayctrl (IDC_RSCDISPLAYARSENAL_LIST + _idc);
				_ctrlLineTabLeft = _display displayctrl IDC_RSCDISPLAYARSENAL_LINETABLEFT;
				_ctrlLineTabLeft ctrlsetfade 0;
				_ctrlTabPos = ctrlposition _ctrlTab;
				_ctrlLineTabPosX = (_ctrlTabPos select 0) + (_ctrlTabPos select 2) - 0.01;
				_ctrlLineTabPosY = (_ctrlTabPos select 1);
				_ctrlLineTabLeft ctrlsetposition [
					safezoneX,//_ctrlLineTabPosX,
					_ctrlLineTabPosY,
					(ctrlposition _ctrlList select 0) - safezoneX,//_ctrlLineTabPosX,
					ctrlposition _ctrlTab select 3
				];
				_ctrlLineTabLeft ctrlcommit 0;
				ctrlsetfocus _ctrlList;
			};

			_ctrlIcon = _display displayctrl (IDC_RSCDISPLAYARSENAL_ICON + _idc);
			//_ctrlIcon ctrlsetfade ([1,0] select _active);
			_ctrlIcon ctrlshow _active;
			_ctrlIcon ctrlenable !_active;

			_ctrlIconBackground = _display displayctrl (IDC_RSCDISPLAYARSENAL_ICONBACKGROUND + _idc);
			_ctrlIconBackground ctrlshow _active;
		} foreach [IDCS_LEFT];

		//Show left list background
		{
			_ctrl = _display displayctrl _x;
			_ctrl ctrlsetfade 0;
			_ctrl ctrlcommit FADE_DELAY;
		} foreach [
			IDC_RSCDISPLAYARSENAL_LINETABLEFT,
			IDC_RSCDISPLAYARSENAL_FRAMELEFT,
			IDC_RSCDISPLAYARSENAL_BACKGROUNDLEFT
		];
	};

	/////////////////////////////////////////////////////////////////////////////////////////// EVENT
	case "TabSelectRight": {
		//if(JNG_CENTER isEqualTo player)exitWith{};

		private _display = _this select 0;
		private _index = _this select 1;
		private _ctrlList = _display displayctrl (IDC_RSCDISPLAYARSENAL_LIST + _index);
		private _ctrlTab = _display displayctrl (IDC_RSCDISPLAYARSENAL_TAB + _index);
		private _type = (ctrltype _ctrlList == 102);

		private _ctrFrameRight = _display displayctrl IDC_RSCDISPLAYARSENAL_FRAMERIGHT;
		private _ctrBackgroundRight = _display displayctrl IDC_RSCDISPLAYARSENAL_BACKGROUNDRIGHT;

		{
			_idc = _x;
			_active = _idc == _index;
			_activeList = !(_idc in [IDC_JNG_TAB_REPAIR,IDC_JNG_TAB_REFUEL,IDC_JNG_TAB_PYLON]);//excude lists

			//show tabs
			if(_idc != IDC_JNG_TAB_HARDPOINT)then{
				private _ctrlTab = _display displayctrl (IDC_RSCDISPLAYARSENAL_TAB + _idc);
				_ctrlTab ctrlenable true;
				_ctrlTab ctrlShow true;
				_ctrlTab ctrlsetfade ([1,0] select true);
				_ctrlTab ctrlcommit 0;
			};

			//Show list
			{
				_ctrlList = _display displayctrl (_x + _idc);
				_ctrlList ctrlShow (_active && _activeList);
				_ctrlList ctrlEnable (_active && _activeList);
				_ctrlList ctrlsetfade ([1,0] select (_active && _activeList));
				_ctrlList ctrlcommit FADE_DELAY;
			} foreach [IDC_RSCDISPLAYARSENAL_LIST,IDC_RSCDISPLAYARSENAL_LISTDISABLED];

			_ctrlTab = _display displayctrl (IDC_RSCDISPLAYARSENAL_TAB + _idc);
			_ctrlTab ctrlenable (!_active && ctrlfade _ctrlTab == 0);

			if(_active)then{

				//enable sort for rearm
				private _isRearm = (_index == IDC_JNG_TAB_REARM);
				private _ctrlSort = _display displayctrl (IDC_RSCDISPLAYARSENAL_SORT + IDC_JNG_TAB_REARM_SORT);
				_ctrlSort ctrlShow _isRearm;
				_ctrlSort ctrlEnable _isRearm;
				_ctrlSort ctrlsetfade ([1,0] select _isRearm);
				_ctrlSort ctrlcommit FADE_DELAY;



				_ctrlList = _display displayctrl (IDC_RSCDISPLAYARSENAL_LIST + _idc);

				_ctrlLineTabRight = _display displayctrl IDC_RSCDISPLAYARSENAL_LINETABRIGHT;

				_ctrlLineTabRight ctrlsetfade 0;
				_ctrlTabPos = ctrlposition _ctrlTab;
				_ctrlLineTabPosX = (ctrlposition _ctrlList select 0) + (ctrlposition _ctrlList select 2);
				_ctrlLineTabPosY = (_ctrlTabPos select 1);
				_ctrlLineTabRight ctrlsetposition [
					_ctrlLineTabPosX,
					_ctrlLineTabPosY,
					safezoneX + safezoneW - _ctrlLineTabPosX,//(_ctrlTabPos select 0) - _ctrlLineTabPosX + 0.01,
					ctrlposition _ctrlTab select 3
				];
				_ctrlLineTabRight ctrlcommit 0;
				ctrlsetfocus _ctrlList;

				_ctrlLoadCargo = _display displayctrl IDC_RSCDISPLAYARSENAL_LOADCARGO;

				_ctrlListPos = ctrlposition _ctrlList;
				//_ctrlListPos set [3,(_ctrlListPos select 3) + (ctrlposition _ctrlLoadCargo select 3)];

				{
					_x ctrlsetposition _ctrlListPos;
					_x ctrlsetfade ([1,0] select _activeList);
					_x ctrlcommit 0;
					_x ctrlShow true;
					_x ctrlEnable true;
				} foreach [_ctrFrameRight,_ctrBackgroundRight];

			};
		} foreach [IDCS_RIGHT];

		//update 3d icons
		_oldIcons = missionnamespace getvariable ["JNG_garage_icons",[]];
		switch (_index) do
		{
			case IDC_JNG_TAB_PYLON: {
				_icons = missionnamespace getvariable ["JNG_garage_icons_pylon",[]];
				_message =  if(_icons isEqualTo [])then{"No pylons on this vehicle"}else{"Select a pylon you want to change"};
				['showMessageEndless',[_display,_message]] call jn_fnc_arsenal;
				missionnamespace setvariable ["JNG_garage_icons",_icons];
			};

			case IDC_JNG_TAB_REPAIR:{
				_icons = missionnamespace getvariable ["JNG_garage_icons_damage",[]];
				_message =  if(_icons isEqualTo [])then{"No damages on this vehicle"}else{"Select a parts you want to repair"};
				['showMessageEndless',[_display,_message]] call jn_fnc_arsenal;
				missionnamespace setvariable ["JNG_garage_icons",_icons];
			};

			default {
				//remove message
				['hideMessage',[_display]] call jn_fnc_arsenal;
				missionnamespace setvariable ["JNG_garage_icons",[]];
			};
		};
		{
			_ctrl = _x;
			_ctrl ctrlShow false;
			_ctrl ctrlEnable false;
		} forEach _oldIcons;
		_newIcons = missionnamespace getvariable ["JNG_garage_icons",[]];
		{
			_ctrl = _x;
			_ctrl ctrlShow true;
			_ctrl ctrlEnable true;
		} forEach _newIcons;
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "LoadVehicle":{
	};

	/////////////////////////////////////////////////////////////////////////////////////////// EVENT
	case "SelectPylonIcon":{
		private _display = _this select 0;
		private _idPylon = _this select 1;

		private _center = JNG_CENTER;
		private _type = typeOf _center;
		private _cfg = (configfile >> "CfgVehicles" >> _type);

		private _icons = missionnamespace getvariable ["JNG_garage_icons",[]];

		//set color
		{
			_ctrl = _x;
			_idPylon2 = _ctrl getVariable "idPylon";
			_color = if(_idPylon2 == _idPylon)then{
				[0, 1, 0, 1];
			}else{
				[1, 1, 1, 1];
			};

			_ctrl ctrlSetTextColor _color;

		} forEach _icons;


		//add items to list
		_indexList = if(_idPylon <= 0)then{//Sparkers pylons
			_idPylon = -_idPylon;
			private _ctrlList = _display displayctrl (IDC_RSCDISPLAYARSENAL_LIST + IDC_JNG_TAB_HARDPOINT);

			//clear list
			lbclear _ctrlList;


			_model = gettext (_cfg >> "model");

			//get allowed attactment list
			_allowedWeaponModels = [];
			{
				_model2 = _x select 0;
				if(_model isEqualTo _model2)then{
					_allowedWeaponModels = _x select 1;
				};
			} forEach jnl_allowedWeapons;


			//add empty
			_displayName = "<Empty11>";
			_lbAdd = _ctrlList lbadd _displayName;
			_ctrlList lbsetdata [_lbAdd, ""];
			_ctrlList lbsetpicture [_lbAdd,tolower gettext (configfile >> "RscCheckBox" >> "textureUnchecked")];

			//current static
			call {
				private _index = _center call jn_fnc_garage_getVehicleIndex;
				private _ctrllistLeft = _display displayCtrl (IDC_RSCDISPLAYARSENAL_LIST + _index);
				private _datastr = _ctrllistLeft lbdata (lbCurSel _ctrllistLeft);
				DECOMPILE_DATA
				SPLIT_SAVE //vehicle data

				if!(_attachItem isEqualTo [])then{
					private _data = _attachItem;
					SPLIT_SAVE//attachment data
					private _lbAdd = _ctrlList lbadd _name;
					private _dataStr = str _data;
					_ctrlList lbsetdata [_lbAdd, _dataStr];
					_ctrlList lbsetpicture [_lbAdd,tolower gettext (configfile >> "RscCheckBox" >> "textureChecked")];
				};
			};

			//loop all static weapons
			_ctrlListStatic = _display displayctrl (IDC_RSCDISPLAYARSENAL_LIST + IDC_JNG_TAB_STATIC);
			for "_i" from 0 to (lbsize _ctrlListStatic - 1) do {
				_dataStr = _ctrlListStatic lbdata _i;
				DECOMPILE_DATA
				SPLIT_SAVE
				_model2 = gettext (configFile >> "cfgVehicles" >> _type >> "model");
				if(_model2 in _allowedWeaponModels)then{

					_cfg = (configfile >> 'CfgVehicles' >> _type);
					_lbAdd = _ctrlList lbadd _name;
					_dataStr = str _data;
					_ctrlList lbsetdata [_lbAdd, _dataStr];
					_ctrlList lbsetpicture [_lbAdd,tolower gettext (configfile >> "RscCheckBox" >> "textureUnchecked")];
				};
			};
			IDC_JNG_TAB_HARDPOINT//return
		}else{//Arma pylons
			private _ctrlList = _display displayctrl (IDC_RSCDISPLAYARSENAL_LIST + IDC_JNG_TAB_PYLON);

			lnbClear _ctrlList;

			_currentAmmo = (getPylonMagazines _center) select (_idPylon - 1);
			_currentAmount = _center ammoOnPylon _idPylon;
			_compatibleAmmo = _center getCompatiblePylonMagazines _idPylon;
			{
				_item = _x;
				_cfg = (configfile >> 'CfgMagazines' >> _item);
				_displayName = if(_foreachindex == 0)then{_ctrlList lnbsetcurselrow _foreachindex;"<Empty>"}else{getText(_cfg >> 'displayName')};
				_lbAdd = _ctrlList lnbaddrow ["",_displayName,str 0];
				_dataStr = str [_item,_idPylon,_displayName];
				_ctrlList lnbsetdata [[_lbAdd,0],_dataStr];
				_ctrlList lnbsetpicture [[_lbAdd,0],tolower gettext (configfile >> "RscCheckBox" >> "textureUnchecked")];

				//select current ammo
				if(_currentAmmo isEqualTo _item)then{
					_ctrlList lnbsetcurselrow _foreachindex;
					_ctrlList lnbsetpicture [[_lbAdd,0],tolower gettext (configfile >> "RscCheckBox" >> "textureChecked")];
				};
			} forEach ([""] +_compatibleAmmo);
			IDC_JNG_TAB_PYLON//return
		};

		//make list visible again
		_ctrFrameRight = _display displayctrl IDC_RSCDISPLAYARSENAL_FRAMERIGHT;
		_ctrBackgroundRight = _display displayctrl IDC_RSCDISPLAYARSENAL_BACKGROUNDRIGHT;
		{
			_x ctrlShow true;
			_x ctrlEnable true;
			_x ctrlsetfade 0;
			_x ctrlcommit FADE_DELAY;
		} foreach [_ctrFrameRight,_ctrBackgroundRight];
		{
			private _index = _x;
			_active = (_indexList == _index);
			{
				_ctrlList = _display displayctrl (_x + _index);
				_ctrlList ctrlShow _active;
				_ctrlList ctrlEnable _active;
				_ctrlList ctrlsetfade ([1,0] select _active);
				_ctrlList ctrlcommit FADE_DELAY;
			} foreach [IDC_RSCDISPLAYARSENAL_LIST,IDC_RSCDISPLAYARSENAL_LISTDISABLED];
		} forEach [IDC_JNG_TAB_HARDPOINT,IDC_JNG_TAB_PYLON];
	};

	/////////////////////////////////////////////////////////////////////////////////////////// EVENT
	case "SelectRepairIcon":{
		_display = _this select 0;
		_damageID = _this select 1;
		_ctrlIcon = _this select 2;


		_center = JNG_CENTER;



		//update data
		{
			_ctrlList = _display displayCtrl (IDC_RSCDISPLAYARSENAL_LIST + _x);
			if(ctrlEnabled _ctrlList)exitWith{
				//load
				_cursel = lbCurSel _ctrlList;
				_datastr = _ctrlList lbdata _cursel;
				DECOMPILE_DATA
				SPLIT_SAVE

				//update
				_damage set [_damageID, 0];
				_center setHitIndex [_damageID,0];
				_ctrlIcon ctrlEnable false;
				_ctrlIcon ctrlShow false;

				//save
				COMPILE_SAVE
				_ctrlList lbsetdata [_cursel,_datastr];
			};
		} forEach [IDCS_LEFT];
	};

	/////////////////////////////////////////////////////////////////////////////////////////// EVENT
	case "SelectRearmList":{
		private _display = _this select 0;

		private _ctrlSort = _display displayctrl (IDC_RSCDISPLAYARSENAL_SORT + IDC_JNG_TAB_REARM_SORT);
		private _cursel = lbCurSel _ctrlSort;
		private _dataStr = _ctrlSort lbData _cursel; //"[-1]"
		DECOMPILE_DATA

		private _turret = _data; //[-1]
		private _center = missionnamespace getvariable "JNG_CENTER";
		private _type = typeOf _center;
		private _cfg = (configfile >> "CfgVehicles" >> _type);


		_currentMagazines = magazinesAllTurrets _center;

		_ctrlList = _display displayctrl (IDC_RSCDISPLAYARSENAL_LIST + IDC_JNG_TAB_REARM);
		lnbClear _ctrlList;

		_currentMagazine = [];
		{
			private["_magazine","_turret2","_amount"];
			_magazine = _x select 0;
			_turret2 = _x select 1;
			_amount = _x select 2;

			if(_turret isEqualTo _turret2)then{
				_found = false;
				{
					_magazine2 = _x select 0;
					if(_magazine2 isEqualTo _magazine)exitWith{
						_found = true;
						_oldAmount = (_currentMagazine select _foreachindex select 1);
						_currentMagazine set [_foreachindex,[_magazine, _oldAmount + _amount]];
					};
				} forEach _currentMagazine;
				if(!_found)then{
					_currentMagazine pushback [_magazine,_amount];
				};
			};
		} forEach _currentMagazines;



		//find config of turret
		_cfgTurret = _cfg;
		_gunnerName = "driver";

		if!(_turret isEqualTo [-1])then{
			{_cfgTurret = (_cfgTurret >> "Turrets") select _x;} foreach _turret;
			_gunnerName = gettext (_cfgTurret>> "gunnerName");
		};

		//name
		_weapons = [];
		if (isArray (_cfgTurret >> "weapons"))then{
			_weapons = getarray (_cfgTurret >> "weapons");
		}else{
			_weapons = [gettext (_cfgTurret >> "weapons")];
		};

		//no weapons found skip turret
		if!(_weapons isEqualTo [])then{
			_magazinesLose = [];
			if (isArray (_cfgTurret >> "magazines"))then{
				_magazinesLose = getarray (_cfgTurret >> "magazines");
			}else{
				_magazinesLose = [gettext (_cfgTurret >> "magazines")];
			};
			_magazines = [];
			{
				private["_magazine","_cfg","_amount"];
				_magazine = _x;
				_cfg = (configfile >> "CfgMagazines" >> _magazine);
				_amount = getNumber(_cfg >> "count");

				_found = false;
				{
					_magazine2 = _x select 0;
					_oldAmount = _x select 1;
					if(_magazine2 isEqualTo _magazine)exitWith{
						_found = true;
						_magazines set [_foreachindex, [_magazine,(_oldAmount + _amount)]];
					};
				} forEach _magazines;
				if(!_found)then{
					_magazines pushback [_magazine,_amount];
				};

			} forEach _magazinesLose;

			//add magazines to list
			{
				private["_magazine","_cfg"];
				_magazine = _x select 0;
				_maxAmount = _x select 1;
				_cfg = (configfile >> "CfgMagazines" >> _magazine);

				//TODO add real ammo count thats in the crate
				_amount = round(random 10000);

				_currentAmount = 0;
				{
					if(_magazine isEqualTo (_x select 0))exitWith{
						_currentMagazine deleteAt _foreachindex;
						_currentAmount = _x select 1;
					};
				} forEach _currentMagazine;

				_amountStr = _amount call AMOUTTOTEXT;
				_currentAmountStr = _currentAmount call AMOUTTOTEXT;
				_maxAmountStr = _maxAmount call AMOUTTOTEXT;

				_displayName = getText(_cfg >> "displayName");
				_text1 = "";//not used, picture;
				_text2 = "[" + _amountStr + "] " + _displayName;//amount in garage + name
				_text3 = "[" + _currentAmountStr + "/" + _maxAmountStr + "]";//right text;

				_ctrlList lnbSetColumnsPos [0,0.07,0.66];//move text to left because we dont use pic and we need some space
				_lbAdd = _ctrlList lnbaddrow [_text1,_text2,_text3];
				COMPILE_REARM
				_ctrlList lnbsetdata [[_lbAdd,0],_datastr];
			} forEach _magazines;
		};
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "SelectCurrentCenter":{
		params ["_display","_center"];
		private _index = _center call jn_fnc_garage_getVehicleIndex;
		private _nameCenter = _center getVariable ["jng_name",""];

		{
			private _ctrlList = _display displayCtrl (IDC_RSCDISPLAYARSENAL_LIST + _x);
			private _active = _index == _x;

			if(_active)then{
				for "_i" from 0 to (lbsize _ctrlList - 1) do {
					private _datastr = _ctrlList lbdata _i;
					DECOMPILE_DATA
					SPLIT_SAVE
					if(_nameCenter isEqualTo _name)exitWith{
						_ctrlList lbsetCurSel _i;
					};
				};
			}else{
				_ctrlList lbsetCurSel -1;
			};

		} forEach [IDCS_LEFT];
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "Preview":{
		if!(isnil "jna_preview_This")exitWith{};//inpatient person spamming the button
		_display = _this select 0;
		_data = _this select 1;
		_index = _this select 2;

		SPLIT_SAVE
		if (_name isEqualTo (_center getVariable "jng_name"))exitWith{};//player is already changing this
		if (!(_beingChanged isEqualTo "") && !(_beingChanged isEqualTo (name player))) exitWith{//someone else is changing this
			["SelectCurrentCenter",[_display,JNG_CENTER]] call jn_fnc_garage;
		};
		//save it global so we can use it later
		jna_preview_This = _this;

		//spawn so we can use sleep
		jna_handlePreview1 = [] spawn{
			//disable userinput while we wait for the server to respond
			disableUserInput true;

			//this is called by the server
			jn_fnc_garage_requestVehicleMessage = {
				params ["_message"];//server lets us know if we can use vehicle (true/false)

				_display = jna_preview_This select 0;
				_data = jna_preview_This select 1;
				_index = jna_preview_This select 2;

				//message recieved from server no need to close this script after 1 sec anymore
				terminate jna_handlePreview2;

				if(_message)then{
					//change close button to get vehicle
					_ctrlButtonClose = _display displayctrl (getnumber (configfile >> "RscDisplayArsenal" >> "Controls" >> "ControlBar" >> "controls" >> "ButtonClose" >> "idc"));
					_ctrlButtonClose ctrlSetText "Get vehicle";




					SPLIT_SAVE
					_cfg = (configfile >> "CfgVehicles" >> _type);

					//tell the server we are not using the old vehicle anymore, first we need to find it back
					{
						private _index = _x;
						private _ctrlList = _display displayCtrl (IDC_RSCDISPLAYARSENAL_LIST + _index);

						private _found = false;
						for "_i" from 0 to (lbsize _ctrlList - 1) do {
							private _datastr = _ctrlList lbdata _i;
							DECOMPILE_DATA
							SPLIT_SAVE
							if(_name isEqualTo (JNG_CENTER getVariable "jng_name"))exitWith{
								[_data, _index] remoteExecCall ["jn_fnc_garage_releaseVehicle",2];
								_found = true;
							}
						};
						if(_found)exitWith{};
					} forEach [IDCS_LEFT];



					//remove local vehicle, if there was one
					with missionnamespace do{
						if (!isnull JNG_CENTER && JNG_CENTER != player) then{
							{
								if!(BIS_fnc_arsenal_target isEqualTo _x)then{//lets not remove the camara thats attached to
									_x hideObject true;
									detach _x;
									deleteVehicle _x;
								};
							} forEach attachedObjects JNG_CENTER;
							deleteVehicle JNG_CENTER;
							JNG_CENTER = nil;
						};
					};

					//create new vehicle
					private _center = ["CreateVehicle",[_data,true]] call jn_fnc_garage;
					missionnamespace setvariable ["JNG_CENTER",_center];

					//set Rearm tab
					_ctrlSort = _display displayctrl(IDC_RSCDISPLAYARSENAL_SORT + IDC_JNG_TAB_REARM_SORT);
					lbClear _ctrlSort;
					{
						_turret = _x;

						//find config of turret
						_cfgTurret = _cfg;
						_gunnerName = "Driver";

						if!(_turret isEqualTo [-1])then{
							{_cfgTurret = (_cfgTurret >> "Turrets") select _x;} foreach _turret;
							_gunnerName = gettext (_cfgTurret>> "gunnerName");
						};
						_magazines = if (isArray (_cfgTurret >> "magazines"))then{
							getarray (_cfgTurret >> "magazines");
						}else{
							[gettext (_cfgTurret >> "magazines")];
						};

						//remove turrets without magazines
						if!(_magazines isEqualTo [])then{
							_lbAdd = _ctrlSort lbAdd _gunnerName;
							_ctrlSort lbSetCurSel 0;
							_ctrlSort lbSetData [_lbAdd, str _turret];
						}
					} forEach ([[-1]] + (allturrets [_center,true]));
					//["SelectRearmList",[_display]] call jn_fnc_garage; //Update list
					_ctrlSort lbSetCurSel 0;


					//Update 3d icons ----------------------------------------------

					//remove old ones
					{
						_ctrl = _x;
						ctrlDelete _ctrl;
					} forEach (
						(missionnamespace getvariable ["JNG_garage_icons_damage",[]])+
						(missionnamespace getvariable ["JNG_garage_icons_pylon",[]])
					);

					//addnew

					//repair icons
					_hitpoints = getAllHitPointsDamage _center;
					_ctrlList = [];
					if(count _hitpoints > 0)then{
						{
							_selectionName = _x;
							if!(_selectionName isEqualTo "")then{
								_damage = _hitpoints select 2 select _foreachindex;
								if(_damage == 0)exitWith{};

								_ctrl = _display ctrlCreate ["RscButtonArsenal",-1];
								_ctrl ctrlsetposition [0,0,0];
								_ctrl ctrlSetText "\A3\ui_f\data\IGUI\Cfg\Actions\repair_ca.paa";
								_ctrl ctrlenable false;
								_ctrl ctrlshow false;
								_ctrl ctrlSetTooltip (_selectionName +" " + str _damage+" " + str _foreachindex);
								_ctrl ctrlsetfade 0;
								_ctrl ctrlSetTextColor [1, 0, 0, 1];
								_ctrl ctrlcommit 0;
								_ctrl setVariable ["location",_center selectionposition _selectionName];
								_ctrl ctrladdeventhandler ["buttonclick",format ["
									_damageID = %1;
									_display = uiNamespace getVariable 'arsanalDisplay';

									['SelectRepairIcon',[_display,_damageID,_this select 0]] call jn_fnc_garage;
								",_foreachindex,_ctrl]];

								_ctrlList pushback _ctrl;
							};
						} forEach (_hitpoints select 1);
					};
					missionnamespace setvariable ["JNG_garage_icons_damage",_ctrlList];

					//pylon icons
					_ctrlList = [];
					{
						_selectionName = _x;
						if((_selectionName find "proxy:\a3\weapons_f\dynamicloadout\") != -1) then {
							_idPylon = parseNumber (_selectionName select [(count _selectionName-3)]);
							_compatibleAmmo = _center getCompatiblePylonMagazines _idPylon;

							_toolTip = "Pylon"+ str _idPylon + " Ammo:" + str (_center ammoOnPylon _idPylon);

							_ctrl = _display ctrlCreate ["RscButtonArsenal",-1];
							_ctrl ctrlsetposition [0,0,0];
							_ctrl ctrlSetText "\A3\ui_f\data\IGUI\Cfg\Actions\reammo_ca.paa";
							_ctrl ctrlenable false;
							_ctrl ctrlSetTooltip _toolTip;
							_ctrl setVariable ["idPylon",_idPylon];
							_ctrl setVariable ["location",_center selectionposition _selectionName];
							_ctrl ctrlshow false;
							_ctrl ctrlsetfade 0;
							_ctrl ctrladdeventhandler ["buttonclick",format ["
								_idPylon = %1;
								_display = uiNamespace getVariable 'arsanalDisplay';

								['SelectPylonIcon',[_display,_idPylon]] call jn_fnc_garage;
							",_idPylon]];

							_ctrl ctrlcommit 0;
							_ctrlList pushback _ctrl;
						};
					} forEach selectionNames _center;

					//hardpoints icons
					_model = gettext (_cfg >> "model");
					_nodeID = 0;
					{
						_model2 = _x select 0;
						if(_model isEqualTo _model2)exitWith{
							{
								if(_x select 0 == 0)exitWith{//find weapon node
									_hardpoint = _x select 1;
									_hardpointRotation = _x select 2;
									_toolTip = "Welding point for static weapons";
									_ctrl = _display ctrlCreate ["RscButtonArsenal",-1];
									_ctrl ctrlsetposition [0,0,0];
									_ctrl ctrlSetText "\A3\ui_f\data\IGUI\Cfg\Actions\reammo_ca.paa";
									_ctrl ctrlSetTooltip _toolTip;
									_ctrl setVariable ["idPylon",_nodeID];
									_ctrl setVariable ["location",_hardpoint];
									_ctrl setVariable ["rotation",_hardpointRotation];
									_ctrl ctrlenable false;
									_ctrl ctrlshow false;
									_ctrl ctrlsetfade 0;
									_ctrl ctrladdeventhandler ["buttonclick",format["
										_display = uiNamespace getVariable 'arsanalDisplay';

										['SelectPylonIcon',[_display,%1]] call jn_fnc_garage;
									",-_nodeID]];

									_ctrl ctrlcommit 0;
									_ctrlList pushback _ctrl;
									_nodeID = _nodeID +1;
								};
							} forEach (_x select 1);//loop hardpoints

						};
					} forEach jnl_vehicleHardpoints;


					missionnamespace setvariable ["JNG_garage_icons_pylon",_ctrlList];

					_checkboxTextures = [
						tolower gettext (configfile >> "RscCheckBox" >> "textureUnchecked"),
						tolower gettext (configfile >> "RscCheckBox" >> "textureChecked")
					];

					//--- Textures-----------------------------------------------
					_ctrlListTextures = _display displayctrl (IDC_RSCDISPLAYARSENAL_LIST + IDC_JNG_TAB_TEXTURE);
					lbclear _ctrlListTextures;
					{
						_displayName = gettext (_x >> "displayName");
						if (_displayName != "") then {
							_textures = getarray (_x >> "textures");
							_lbAdd = _ctrlListTextures lbadd _displayName;
							_ctrlListTextures lbsetdata [_lbAdd,configname _x];
							_ctrlListTextures lbsetpicture [_lbAdd,_checkboxTextures select 0];

						};
					} foreach (configproperties [_cfg >> "textureSources","isclass _x",true]);
					lbsort _ctrlListTextures;

					//select texure from save
					for "_i" from 0 to (lbsize _ctrlListTextures - 1) do {
						_data = _ctrlListTextures lbdata _i;
						if (_data isEqualTo _texture) then {
							_ctrlListTextures lbsetcursel _i;
							_ctrlListTextures lbsetpicture [_i,_checkboxTextures select 1];
						};
					};

					_ctrlListTexturesDisabled = _display displayctrl (IDC_RSCDISPLAYARSENAL_LISTDISABLED + IDC_RSCDISPLAYGARAGE_TAB_SUBTEXTURE);
					_ctrlListTexturesDisabled ctrlshow (lbsize _ctrlListTextures == 0);

					//--- Animations---------------------------------------------

					_ctrlListAnimations = _display displayctrl (IDC_RSCDISPLAYARSENAL_LIST + IDC_JNG_TAB_COMPONENT);
					lbclear _ctrlListAnimations;
					{
						_configName = configname _x;
						_displayName = gettext (_x >> "displayName");
						if (_displayName != "" && {getnumber (_x >> "scope") > 1 || !isnumber (_x >> "scope")}) then {
							_lbAdd = _ctrlListAnimations lbadd _displayName;
							_ctrlListAnimations lbsetdata [_lbAdd,_configName];
							_ctrlListAnimations lbsetpicture [_lbAdd,_checkboxTextures select ((_center animationphase _configName) max 0)];
						};
					} foreach (configproperties [_cfg >> "animationSources","isclass _x",true]);
					lbsort _ctrlListAnimations;
					_ctrlListAnimationsDisabled = _display displayctrl (IDC_RSCDISPLAYARSENAL_LISTDISABLED + IDC_JNG_TAB_COMPONENT);
					_ctrlListAnimationsDisabled ctrlshow (lbsize _ctrlListAnimations == 0);


					//update lock button
					if(isMultiplayer)then{
						_ctrlButtonLock = _display displayctrl IDC_RSCDISPLAYARSENAL_CONTROLSBAR_BUTTONINTERFACE;
						_ctrlButtonLock ctrlEnable true;
						if (_locked isEqualTo "") then{
							_ctrlButtonLock ctrlSetText "Lock Vehicle";
							_ctrlButtonLock ctrlSetTooltip "Locks vehicle so others cant use it";
						}else{
							_ctrlButtonLock ctrlSetText "Unlock Vehicle";
							_ctrlButtonLock ctrlSetTooltip "Unlocks vehicle so others can use it";
						};
					};

					//show right icons and list
					["TabSelectRight",[_display,IDC_JNG_TAB_REARM]] call jn_fnc_garage;
				}else{// if !_message
					['showMessage',[_display,"Someone is already using this"]] call jn_fnc_arsenal;
				};

				["SelectCurrentCenter",[_display,JNG_CENTER]] call jn_fnc_garage;
				disableUserInput false;
				jn_fnc_garage_requestVehicleMessage = nil;
				jna_preview_This = nil;
			};

			//ask server to lock vehicle for us so others cant access it
			_data = jna_preview_This select 1;
			_index = jna_preview_This select 2;
			SPLIT_SAVE//get vehicle name
			[_name, _index, name player, getPlayerUID player, clientOwner] remoteExecCall ["jn_fnc_garage_requestVehicle",2];
		};

		//if we didnt get a message from server close the program with a error
		jna_handlePreview2 = [] spawn {
			sleep 1;
			terminate jna_handlePreview1;
			disableUserInput false;
			jn_fnc_garage_requestVehicleMessage = nil;
			jna_preview_This = nil;
			["Error: no message received from server 'jn_fnc_garage_requestVehicleMessage'"] call BIS_fnc_error;
		};
	};

	/////////////////////////////////////////////////////////////////////////////////////////// EVENT
	case "KeyDown": {
		_display = _this select 0;
		_key = _this select 1;
		_shift = _this select 2;
		_ctrl = _this select 3;
		_alt = _this select 4;
		_center = (missionnamespace getvariable ["JNG_CENTER",player]);
		_return = false;
		_ctrlTemplate = _display displayctrl IDC_RSCDISPLAYARSENAL_TEMPLATE_TEMPLATE;
		_inTemplate = ctrlfade _ctrlTemplate == 0;

		switch true do {
			case (_key == DIK_ESCAPE): {
				["buttonClose"] call jn_fnc_garage;
				_return = true;
			};


			//--- Prevent opening the commanding menu
			case (_key == DIK_1);
			case (_key == DIK_2);
			case (_key == DIK_3);
			case (_key == DIK_4);
			case (_key == DIK_5);
			case (_key == DIK_1);
			case (_key == DIK_7);
			case (_key == DIK_8);
			case (_key == DIK_9);
			case (_key == DIK_0);

			//--- Tab to browse tabs
			case (_key == DIK_TAB): {
			};



			//--- Save
			case (_key == DIK_S): {
				//if (_ctrl) then {['buttonSave',[_display]] call jn_fnc_arsenal;};
			};
			//--- Open
			case (_key == DIK_O): {
				//if (_ctrl) then {['buttonLoad',[_display]] call jn_fnc_arsenal;};
			};

			//--- Vision mode
			case (_key in (actionkeys "nightvision") && !_inTemplate): {
				_mode = missionnamespace getvariable ["BIS_fnc_arsenal_visionMode",-1];
				_mode = (_mode + 1) % 3;
				missionnamespace setvariable ["BIS_fnc_arsenal_visionMode",_mode];
				switch _mode do {
					//--- Normal
					case 0: {
						camusenvg false;
						false setCamUseTi 0;
					};
					//--- NVG
					case 1: {
						camusenvg true;
						false setCamUseTi 0;
					};
					//--- TI
					default {
						camusenvg false;
						true setCamUseTi 0;
					};
				};
				playsound ["RscDisplayCurator_visionMode",true];
				_return = true;

			};
		};
		_return
	};

	/////////////////////////////////////////////////////////////////////////////////////////// EVENT
	case "buttonClose": {
		_display = uiNamespace getVariable "arsanalDisplay";
		with missionnamespace do{
			if( (!isnil "JNG_CENTER") && {!isnull JNG_CENTER} && {JNG_CENTER != player} )then{
				private _center = JNG_CENTER;
				{
					_x hideObject true;
					detach _x;
					deleteVehicle _x;
				}foreach attachedObjects _center;

				private _index = _center call jn_fnc_garage_getVehicleIndex;
				private _ctrlList = _display displayCtrl (IDC_RSCDISPLAYARSENAL_LIST + _index);
				private _cursel = lbCurSel _ctrlList;
				private _datastr = _ctrlList lbdata _cursel;
				DECOMPILE_DATA
				[_data, _index] remoteExecCall ["jn_fnc_garage_releaseVehicle",2];
				deleteVehicle _center;
			};
			jna_preview_This = nil;
			JNG_CENTER = nil;
		};
		["buttonClose",[_display]] spawn jn_fnc_arsenal;
	};

	/////////////////////////////////////////////////////////////////////////////////////////// EVENT
	case "buttonGetVehicle": {
		_display = _this select 0;
		_center = JNG_CENTER;
		if!(_center isEqualTo player)then{
			private _pos = getpos _center;

			//get current selected vehicle
			private _indexLeft = _center call jn_fnc_garage_getVehicleIndex;
			private _ctrlListLeft = _display displayCtrl (IDC_RSCDISPLAYARSENAL_LIST + _indexLeft);
			private _cursel = lbCurSel _ctrlListLeft;
			private _datastr = _ctrlListLeft lbdata _cursel;
			DECOMPILE_DATA
			SPLIT_SAVE


			//tell the server you took the vehicle
			[_name, _indexLeft] remoteExecCall ["jn_fnc_garage_removeVehicle",2];


			//remove attachments
			{
				if!(BIS_fnc_arsenal_target isEqualTo _x)then{//lets not remove the camara thats attached to
					_x hideObject true;
					detach _x;
					deleteVehicle _x;
				};
			} forEach attachedObjects _center;

			//remove local vehicle
			_center hideObject true;//so the new vehicle doesnt crash it to its old ghost, it gets removed a frame later
			deleteVehicle _center;

			//create global vehicle
			private _center = ["CreateVehicle",[_data,false]] call jn_fnc_garage;//JNG_CENTER is redefined in this function
			_center setpos _pos;

			//lock the vehicle
			//_center setVariable ["ownerX",getPlayerUID player];

			//remove items inside vehicle
			clearWeaponCargo _center;
			clearMagazineCargoGlobal _center;
			clearitemCargo _center;
			clearbackpackCargoGlobal _center;

			//set texure and animations
			["initVehicle",[_display,_center]] call jn_fnc_garage;

			//set center to nil so the vehicle doesnt get removed after the arsenal closes
			JNG_CENTER = nil;

			["buttonClose",[_display]] spawn jn_fnc_arsenal;

		}else{
			["buttonClose",[_display]] spawn jn_fnc_arsenal;
		};
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "CreateVehicle": {
		params ["_data","_local",["_pos",player getPos [10,getDir player]]];
		private _data = _this select 0;
		private _local = _this select 1;//true, spawns vehicle localy
		SPLIT_SAVE

		private _cfg = (configfile >> "cfgvehicles" >> _type);

		//create vehicle
		private _center = objnull;
		if(_local)then{
			_center = _type createVehiclelocal _pos;
			//_center enablesimulation false;
			//_center allowDamage false;
		}else{
			_center = _type createVehicle _pos;
		};
		//_center setpos _pos;

		//lock vehicle
		//_center setVariable ["ownerX",getPlayerUID player];

		_center setVariable ["jng_name",_name];

		//set textures and animations
		private _initAnimations = [];
		{
			private _configName = configname _x;
			_initAnimations pushback _configName;
			_initAnimations pushback parseNumber (_configName in _animations);// 1 or 0
		} foreach (configproperties [_cfg >> "animationSources","isclass _x",true]);


		[_center,_texture,_initAnimations] call bis_fnc_initVehicle;

		//Load ammo, after we removed default ammo
		{
			private _magazine = _x select 0;
			private _turret = _x select 1;
			_center removeMagazinesTurret [_magazine, _turret];
		}foreach (magazinesAllTurrets _center);

		{
			private _turret = _x select 0;
			private _magazine = _x select 1;
			private _ammo = _x select 2;

			private _ammoPerMag = getNumber (configfile >> "CfgMagazines" >> _magazine >> "count");

			while {_ammo > 0}do{
				if(_ammoPerMag>_ammo)then{_ammoPerMag = _ammo};
				_center addMagazineTurret [_magazine,_turret,_ammoPerMag];
				_ammo = _ammo - _ammoPerMag;
			};
		} forEach (_ammoClassic);

		//Load pylon from save
		{ _center removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon") } forEach getPylonMagazines _center;
		{
			private _type = _x select 0;
			private _amount = _x select 1;
			private _location = _foreachindex+1;
			_center setPylonLoadOut [_location, _type, true];
			_center setAmmoOnPylon [_location, _amount];
		}foreach (_ammoPylon);

		//Load damage
		if(typename _damage isEqualTo "ARRAY")then{
			{
				_center setHitIndex [_foreachindex, _x, true];
			} forEach _damage;
		}else{
			_center setDamage _damage;
		};

		if!(_attachItem isEqualTo [])then{
			private _attachment = ["CreateVehicle",[_attachItem,_local,[0,0,0]]] call jn_fnc_garage;
			[_center,_attachment, false,false] call jn_fnc_logistics_load;
		};

		_center//return
	};

	/////////////////////////////////////////////////////////////////////////////////////////// EVENT
	case "buttonCargo":{
		_display = _this select 0;
		_add = _this select 1; //-1 or 1

		_ctrlList = ctrlnull;
		_index = -1;
		_lbcursel = -1;
		{
			_ctrlList = _display displayctrl (IDC_RSCDISPLAYARSENAL_LIST + _x);
			if (ctrlenabled _ctrlList) exitwith {_lbcursel = lbcursel _ctrlList;_index = _x};
		} foreach [IDCS_RIGHT];

		_ctrlSort = _display displayctrl (IDC_RSCDISPLAYARSENAL_SORT + IDC_JNG_TAB_REARM_SORT);
		_curselSort = lbCurSel _ctrlSort;
		_dataStr = _ctrlSort lbData _curselSort; //"[-1]"
		DECOMPILE_DATA
		_turret = _data; //[-1]

		_dataStr = _ctrlList lnbData [_lbcursel,0];
		DECOMPILE_DATA
		SPLIT_REARM


		//TODO add real ammo count thats in the crate
		_amount = round(random 10000);
		_stepSize = getNumber(configFile >> "CfgMagazines">>_magazine>>"count");
		_currentAmount = _currentAmount + (_stepSize*_add);

		if(_currentAmount<0)then{_currentAmount=0;};
		if(_currentAmount>_maxAmount)then{_currentAmount=_maxAmount;};

		_amountStr = _amount call AMOUTTOTEXT;
		_currentAmountStr = _currentAmount call AMOUTTOTEXT;
		_maxAmountStr = _maxAmount call AMOUTTOTEXT;

		_text1 = "";//not used, picture;
		_text2 = "[" + _amountStr + "] " + _displayName;//amount in garage + name
		_text3 = "[" + _currentAmountStr + "/" + _maxAmountStr + "]";//right text;

		_ctrlList lnbSetText [[_lbcursel,0],_text1];
		_ctrlList lnbSetText [[_lbcursel,1],_text2];
		_ctrlList lnbSetText [[_lbcursel,2],_text3];

		COMPILE_REARM
		_ctrlList lnbsetdata [[_lbcursel,0],_datastr];


		//update Data in vehicle list
		private _indexLeft = _center call jn_fnc_garage_getVehicleIndex;
		private _ctrlListLeft = _display displayCtrl (IDC_RSCDISPLAYARSENAL_LIST + _indexLeft);
		private _cursel = lbCurSel _ctrlListLeft;
		private _datastr = _ctrlListLeft lbdata _cursel;
		DECOMPILE_DATA
		SPLIT_SAVE

		private _found = false;
		{
			_turret2 = _x select 0;
			_magazine2 = _x select 1;
			_ammo2 = _x select 2;

			if(_magazine isEqualTo _magazine2 && _turret isEqualTo _turret2)exitWith{
				_found = true;
				_ammoClassic set [_foreachindex, [_turret2,_magazine, _currentAmount]];
			};
		} forEach _ammoClassic;

		if(!_found)then{
			_ammoClassic pushBack [_turret2,_magazine, _currentAmount];
		};

		COMPILE_SAVE
		_ctrlListLeft lbSetData [_cursel, _datastr];
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "ShowStats": {
		_display = _this select 0;

		_ctrlStats = _display displayctrl IDC_RSCDISPLAYARSENAL_STATS_STATS;

		_ctrlStatsPos = ctrlposition _ctrlStats;
		_ctrlStatsPos set [0,0];
		_ctrlStatsPos set [1,0];
		_ctrlBackground = _display displayctrl IDC_RSCDISPLAYARSENAL_STATS_STATSBACKGROUND;
		_barMin = 0.01;
		_barMax = 1;

		_statControls = [
			[IDC_RSCDISPLAYARSENAL_STATS_STAT1,IDC_RSCDISPLAYARSENAL_STATS_STATTEXT1, " 001 liter fuel"],
			[IDC_RSCDISPLAYARSENAL_STATS_STAT2,IDC_RSCDISPLAYARSENAL_STATS_STATTEXT2, " 1kg metal for welding"],
			[IDC_RSCDISPLAYARSENAL_STATS_STAT3,IDC_RSCDISPLAYARSENAL_STATS_STATTEXT3, " 12 engine parts   and  1 windows"],
			[IDC_RSCDISPLAYARSENAL_STATS_STAT4,IDC_RSCDISPLAYARSENAL_STATS_STATTEXT4, " 6 tracks         and            10 tires"],
			[IDC_RSCDISPLAYARSENAL_STATS_STAT5,IDC_RSCDISPLAYARSENAL_STATS_STATTEXT5, "4kg lectronics    and    10 Lamps"]
		];

		{
			_ctrlStat = _display displayctrl (_x select 0);
			_ctrlText = _display displayctrl (_x select 1);

			_ctrlStat progresssetposition (random 1);
			_ctrlText ctrlsettext (_x select 2);
		} forEach _statControls;
		_ctrlStats ctrlsetfade 0;
		_ctrlStats ctrlcommit FADE_DELAY;
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "lockButton":{
		_display = _this select 0;
		_center = (missionnamespace getvariable ["JNG_CENTER",objnull]);

		if(_center isEqualTo player)exitWith{};
		private _index = _center call jn_fnc_garage_getVehicleIndex;
		diag_log ["_index",_index];
		if(_index == -1)exitWith{};
		private _ctrlList = _display displayCtrl (IDC_RSCDISPLAYARSENAL_LIST + _index);

		_cursel = lbCurSel _ctrlList;

		_datastr = _ctrlList lbdata _cursel;
		DECOMPILE_DATA
		SPLIT_SAVE

		_ctrlButtonLock = _display displayctrl IDC_RSCDISPLAYARSENAL_CONTROLSBAR_BUTTONINTERFACE;
		if (_locked isEqualTo "") then{
			_locked = getPlayerUID player;
			_ctrlButtonLock ctrlSetText "Unlock Vehicle";
			_ctrlButtonLock ctrlSetTooltip "Unlocks vehicle so others can use it";
		}else{
			_locked = "";
			_ctrlButtonLock ctrlSetText "Lock Vehicle";
			_ctrlButtonLock ctrlSetTooltip "Locks vehicle so others cant use it";
		};
		//update all clients, update color
		["updateVehicleSingleData",[_name,_index,nil,_locked]] call jn_fnc_garage;
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	default {
		["Error: wrong input given '%1' for mode '%2'",_this,_mode] call BIS_fnc_error;
	};
};


