#include "Garage\defineCommon.inc"

private ["_flag","_typeX"];

if (!hasInterface) exitWith {};

_flag = _this select 0;
_typeX = _this select 1;

switch _typeX do
	{
	case "take":
		{
		removeAllActions _flag;
		_actionX = _flag addAction ["<t>Take the Flag<t> <img image='\A3\ui_f\data\igui\cfg\actions\takeflag_ca.paa' size='1.8' shadow=2 />", {[_this select 0, _this select 1] call A3A_fnc_mrkWIN},nil,6,true,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])",4];
		_flag setUserActionText [_actionX,"Take the Flag","<t size='2'><img image='\A3\ui_f\data\igui\cfg\actions\takeflag_ca.paa'/></t>"];
		};
	case "unit": {_flag addAction ["Unit Recruitment", {if ([player,300] call A3A_fnc_enemyNearCheck) then {hint "You cannot recruit units while there are enemies near you"} else {nul=[] execVM "Dialogs\unit_recruit.sqf"}},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])",4]};
	case "vehicle": {_flag addAction ["Buy Vehicle", {if ([player,300] call A3A_fnc_enemyNearCheck) then {hint "You cannot buy vehicles while there are enemies near you"} else {nul = createDialog "vehicle_option"}},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])",4]};
	case "mission": {
		petros addAction ["Mission Request", {nul=CreateDialog "mission_menu";},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and ([_this] call A3A_fnc_isMember) and (petros == leader group petros)",4];
		petros addAction ["HQ Management", {[] execVM "Dialogs\dialogHQ.sqf"},nil,0,false,true,"","(_this == theBoss) and (petros == leader group petros)", 4];
	};
	case "truckX": {actionX = _flag addAction ["<t>Transfer Ammobox to Truck<t> <img image='\A3\ui_f\data\igui\cfg\actions\unloadVehicle_ca.paa' size='1.8' shadow=2 />", "ammunition\transfer.sqf",nil,6,true,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])"]};
	//case "heal": {if (player != _flag) then {_flag addAction [format ["Revive %1",name _flag], "Revive\actionRevive.sqf",nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])"]}};
	case "heal": {
				if (player != _flag) then
					{
					if ([_flag] call A3A_fnc_fatalWound) then
						{
						_actionX = _flag addAction [format ["<t>Revive %1 </t> <img size='1.8' <img image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_reviveMedic_ca.paa' />",name _flag], "Revive\actionRevive.sqf",nil,6,true,true,"","!(_this getVariable [""helping"",false]) and (isNull attachedTo _target)",4];
						_flag setUserActionText [_actionX,format ["Revive %1",name _flag],"<t size='2'><img image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_reviveMedic_ca.paa'/></t>"];
						}
					else
						{
						_actionX = _flag addAction [format ["<t>Revive %1 </t> <img size='1.8' <img image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_revive_ca.paa' />",name _flag], "Revive\actionRevive.sqf",nil,6,true,true,"","!(_this getVariable [""helping"",false]) and (isNull attachedTo _target)",4];
						_flag setUserActionText [_actionX,format ["Revive %1",name _flag],"<t size='2'><img image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_revive_ca.paa'/></t>"];
						};
					};
				};
	case "heal1":
		{
		if (player != _flag) then
			{
			if ([_flag] call A3A_fnc_fatalWound) then
				{
				_actionX = _flag addAction [format ["<t>Revive %1</t> <img size='1.8' <img image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_reviveMedic_ca.paa' />",name _flag], "Revive\actionRevive.sqf",nil,6,true,false,"","!(_this getVariable [""helping"",false]) and (isNull attachedTo _target)",4];

				_flag setUserActionText [_actionX,format ["Revive %1",name _flag],"<t size='2'><img image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_reviveMedic_ca.paa'/></t>"];
				}
			else
				{
				_actionX = _flag addAction [format ["<t>Revive %1</t> <img size='1.8' <img image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_revive_ca.paa' />",name _flag], "Revive\actionRevive.sqf",nil,6,true,false,"","!(_this getVariable [""helping"",false]) and (isNull attachedTo _target)",4];
				_flag setUserActionText [_actionX,format ["Revive %1",name _flag],"<t size='2'><img image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_revive_ca.paa'/></t>"];
				};
			//_flag addAction [format ["Revive %1",name _flag], "Revive\actionRevive.sqf",nil,0,false,true,"","!(_this getVariable [""helping"",false]) and (isNull attachedTo _target)"];

			_actionX = _flag addAction [format ["<t>Carry %1</t> <img image='\A3\ui_f\data\igui\cfg\actions\take_ca.paa' size='1.6' shadow=2 />",name _flag], "Revive\carry.sqf",nil,5,true,false,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (isNull attachedTo _target) and !(_this getVariable [""helping"",false]);",4];
			_flag setUserActionText [_actionX,format ["Carry %1",name _flag],"<t size='2'><img image='\A3\ui_f\data\igui\cfg\actions\take_ca.paa'/></t>"];
			[_flag] call jn_fnc_logistics_addActionLoad;
			};
		};
	case "moveS": {_flag addAction ["Move this asset", "moveHQObject.sqf",nil,0,false,true,"","(_this == theBoss)"]};
	case "remove":
		{
		if (player == _flag) then
			{
			if (isNil "actionX") then
				{
				removeAllActions _flag;
				if (player == player getVariable ["owner",player]) then {[] call SA_Add_Player_Tow_Actions};
				}
			else
				{
				_flag removeAction actionX;
				};
			}
		else
			{
			removeAllActions _flag
			};
		};
	case "refugee": {_flag addAction ["<t>Liberate</t> <img image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unbind_ca.paa' size='1.6' shadow=2 />", "AI\liberaterefugee.sqf",nil,6,true,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])",4]};//"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unbind_ca.paa"
	case "prisonerX": {_flag addAction ["<t>Liberate POW</t> <img image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unbind_ca.paa' size='1.6' shadow=2 />", "AI\liberatePOW.sqf",nil,6,true,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])",4]};
	case "interrogate": {_flag addAction ["Interrogate", "AI\interrogate.sqf",nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])",4]};
	case "captureX": {_flag addAction ["<t>Release POW</t> <img image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unbind_ca.paa' size='1.6' shadow=2 />", "AI\captureX.sqf",nil,6,true,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])",4]};
	case "buildHQ": {_flag addAction ["Build HQ here", {[] spawn A3A_fnc_buildHQ},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])",4]};
	case "seaport": {_flag addAction ["Buy Boat", {[vehSDKBoat] spawn A3A_fnc_addFIAVeh},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])",4]};
	case "steal": {_flag addAction ["Steal Static", "REINF\stealStatic.sqf",nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])",4]};
	case "garage":
		{
		if (isMultiplayer) then
			{
			_flag addAction ["Personal Garage", {nul = [GARAGE_PERSONAL] spawn A3A_fnc_garage},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])"];
			_flag addAction ["Faction Garage", {nul = [GARAGE_FACTION] spawn A3A_fnc_garage},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])"];
			}
		else
			{
			_flag addAction ["Faction Garage", {nul = [GARAGE_FACTION] spawn A3A_fnc_garage},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])"]
			};
		};
	case "fireX":
		{
		fireX addAction ["Rest for 8 Hours", "skiptime.sqf",nil,0,false,true,"","(_this == theBoss)",4];
		fireX addAction ["Clear Nearby Forest", "clearForest.sqf",nil,0,false,true,"","(_this == theBoss)",4];
		fireX addAction ["I hate the fog", "[10,0] remoteExec [""setFog"",2]",nil,0,false,true,"","(_this == theBoss)",4];
		fireX addAction ["Move this asset", "moveHQObject.sqf",nil,0,false,true,"","(_this == theBoss)"];
		};

	case "SDKFlag":
		{
		removeAllActions _flag;
		_flag addAction ["Unit Recruitment", {if ([player,300] call A3A_fnc_enemyNearCheck) then {hint "You cannot recruit units while there are enemies near you"} else {nul=[] execVM "Dialogs\unit_recruit.sqf"}},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])",4];
		_flag addAction ["Buy Vehicle", {if ([player,300] call A3A_fnc_enemyNearCheck) then {hint "You cannot buy vehicles while there are enemies near you"} else {nul = createDialog "vehicle_option"}},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])",4];
		if (isMultiplayer) then
			{
			_flag addAction ["Personal Garage", {nul = [GARAGE_PERSONAL] spawn A3A_fnc_garage},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])",4];
			_flag addAction ["Faction Garage", {nul = [GARAGE_FACTION] spawn A3A_fnc_garage},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])",4];
			}
		else
			{
			_flag addAction ["Faction Garage", {nul = [GARAGE_FACTION] spawn A3A_fnc_garage},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])",4]
			};
		};
	};