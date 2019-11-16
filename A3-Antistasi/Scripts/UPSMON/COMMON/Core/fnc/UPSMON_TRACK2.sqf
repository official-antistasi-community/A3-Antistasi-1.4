/****************************************************************
File: UPSMON_TRACK.sqf
Author: Azroul13

Description:

Parameter(s):

Returns:

****************************************************************/
private ["_grp"];


_grp = _this select 0;
If !(_grp in UPSMON_Trackednpcs) then {UPSMON_Trackednpcs set [count UPSMON_Trackednpcs,_grp];};
_eh = ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler 
["Draw",
'
	{
		If (!IsNull _x) then
		{
			if (count units _x > 0) then
			{
				_leader = leader _x;
				_rankshort = [rank _leader,"displayNameShort"] call BIS_fnc_rankparams;  
				_lastname = name _leader;  
				_scale = (sizeof typeof _leader) / 30;
				_units = (units _x) - [_leader];
				_colorblufor = [(profilenamespace getvariable ["Map_BLUFOR_R",0]),(profilenamespace getvariable ["Map_BLUFOR_G",1]),(profilenamespace getvariable ["Map_BLUFOR_B",1]),(profilenamespace getvariable ["Map_BLUFOR_A",0.8])];  
				_coloropfor = [(profilenamespace getvariable ["Map_OPFOR_R",0]),(profilenamespace getvariable ["Map_OPFOR_G",1]),(profilenamespace getvariable ["Map_OPFOR_B",1]),(profilenamespace getvariable ["Map_OPFOR_A",0.8])];  
				_colorindfor = [(profilenamespace getvariable ["Map_Independent_R",0]),(profilenamespace getvariable ["Map_Independent_G",1]),(profilenamespace getvariable ["Map_Independent_B",1]),(profilenamespace getvariable ["Map_Independent_A",0.8])];  
				_colorciv = [(profilenamespace getvariable ["Map_Civilian_R",0]),(profilenamespace getvariable ["Map_Civilian_G",1]),(profilenamespace getvariable ["Map_Civilian_B",1]),(profilenamespace getvariable ["Map_Civilian_A",0.8])];  
				_color = [];    
				if (side _leader == west) then {_color = _colorblufor;};  
				if (side _leader == east) then {_color = _coloropfor;};  
				if (side _leader == resistance) then {_color = _colorindfor;};  
				if (side _leader == civilian) then {_color = _colorciv;};    
 
				_align = "right";  
				_fontsize = 0.04;
		
				_grptype = [_leader] call UPSMON_grptype;
				_drawicon = configfile >> "CfgMarkers" >> "b_inf" >> "icon";
				_drawwpicon = configfile >> "CfgMarkers" >> "mil_objective" >> "icon";
				If (_grptype == "Iscar") then {_drawicon = configfile >> "CfgMarkers" >> "b_motor_inf" >> "icon";};
				If (_grptype == "IsAir") then {_drawicon = configfile >> "CfgMarkers" >> "b_plane" >> "icon";};
				If (_grptype == "Isboat") then {_drawicon = configfile >> "CfgMarkers" >> "b_naval" >> "icon";};    

				_align = "left";
				_textwp = ""; 
				_text = format ["%1. %2 - Grpcount: %3 - Mission: %4 Status: %5 - Target: %6",_rankshort, _lastname,count units _x,_x getvariable ["UPSMON_Grpmission","PATROL"],_x getvariable ["UPSMON_Grpstatus","GREEN"],_x getvariable ["UPSMON_GrpTarget",ObjNull]];
				
				(_this select 0) drawIcon [
					getText _drawicon,
					_color,
					visiblePosition _leader,
					0.5/ctrlMapScale (_this select 0),
					0.5/ctrlMapScale (_this select 0),
					direction _leader,
					 --,  
					 1,  
					 _fontsize,  
					 "TahomaB",  
					 _align
				];
				If (count(waypoints _x) != 0) then 
				{
					_wppos = waypointPosition [_x,count(waypoints _x)-1];
					(_this select 0) drawIcon [getText (_drawwpicon),  _color,_wppos,   0.5/ctrlMapScale (_this select 0),   0.5/ctrlMapScale (_this select 0),  direction _leader,  _textwp,  1,  _fontsize,  "TahomaB",  _align];
				};
				_behcolor = [1,1,1,1];  
				if (behaviour _leader == "SAFE") then {_behcolor = [0,0.8,0,1]};  
				if (behaviour _leader == "AWARE") then {_behcolor = [0.85,0.85,0,1]};  
				if (behaviour _leader == "COMBAT") then {_behcolor = [0.9,0,0,1]};  
				if (behaviour _leader == "STEALTH") then {_behcolor = [0,0,1,1]};  
				if !(((expectedDestination _leader) select 0) select 0 < 1 AND ((expectedDestination _leader) select 0) select 1 < 1) then 
				{  
					(_this select 0) drawArrow [
						visiblePosition _leader,  
						((expectedDestination _leader) select 0), 
						_behcolor
					];
				};	
			};
		};
	} foreach UPSMON_Trackednpcs
'
];

/****************************************************************
_eh = ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler 
[
	"Draw"
,' 
	_leader = leader _grp;
	_rankshort = [rank _leader,"displayNameShort"] call BIS_fnc_rankparams;  
	_lastname = name _leader;  
	_scale = (sizeof typeof _leader) / 30;    
	_colorblufor = [(profilenamespace getvariable ["Map_BLUFOR_R",0]),(profilenamespace getvariable ["Map_BLUFOR_G",1]),(profilenamespace getvariable ["Map_BLUFOR_B",1]),(profilenamespace getvariable ["Map_BLUFOR_A",0.8])];  
	_coloropfor = [(profilenamespace getvariable ["Map_OPFOR_R",0]),(profilenamespace getvariable ["Map_OPFOR_G",1]),(profilenamespace getvariable ["Map_OPFOR_B",1]),(profilenamespace getvariable ["Map_OPFOR_A",0.8])];  
	_colorindfor = [(profilenamespace getvariable ["Map_Independent_R",0]),(profilenamespace getvariable ["Map_Independent_G",1]),(profilenamespace getvariable ["Map_Independent_B",1]),(profilenamespace getvariable ["Map_Independent_A",0.8])];  
	_colorciv = [(profilenamespace getvariable ["Map_Civilian_R",0]),(profilenamespace getvariable ["Map_Civilian_G",1]),(profilenamespace getvariable ["Map_Civilian_B",1]),(profilenamespace getvariable ["Map_Civilian_A",0.8])];  
	_color = [];    
	if (side _leader == west) then {_color = _colorblufor;};  
	if (side _leader == east) then {_color = _coloropfor;};  
	if (side _leader == resistance) then {_color = _colorindfor;};  
	if (side _leader == civilian) then {_color = _colorciv;};    
 
	_align = "right";  
	_fontsize = 0.04;
		
	_grptype = [_leader] call UPSMON_grptype;
	_drawicon = configfile >> "CfgMarkers" >> "b_inf" >> "icon";
	If (_grptype == "Iscar") then {_drawicon = configfile >> "CfgMarkers" >> "b_motor_inf" >> "icon";};
	If (_grptype == "IsAir") then {_drawicon = configfile >> "CfgMarkers" >> "b_plane" >> "icon";};
	If (_grptype == "Isboat") then {_drawicon = configfile >> "CfgMarkers" >> "b_naval" >> "icon";};    

	_align = "left";
	_unitshit = [];  
	{if (damage _x >= 0.65) then {_unitshit set [count _unitshit,_x];}}foreach units _leader;   
	_text = format ["%1. %2 - Grpcount: %3 - Wounding units: %4",_rankshort, _lastname,count units group _leader,count _unitshit];

	(_this select 0) drawIcon [getText (_drawicon),  _color,  visiblePosition _leader,   0.5/ctrlMapScale (_this select 0),   0.5/ctrlMapScale (_this select 0),  direction _leader,  _text,  1,  _fontsize,  "TahomaB",  _align];    
	_behcolor = [1,1,1,1];  
	if (behaviour _leader == "SAFE") then {_behcolor = [0.85,0.85,0,1]};  
	if (behaviour _leader == "AWARE") then {_behcolor = [0,0.8,0,1]};  
	if (behaviour _leader == "COMBAT") then {_behcolor = [0.9,0,0,1]};  
	if (behaviour _leader == "STEALTH") then {_behcolor = [0,0,1,1]};  
	if !(((expectedDestination _leader) select 0) select 0 < 1 AND ((expectedDestination _leader) select 0) select 1 < 1) then {  (_this select 0) drawArrow [visiblePosition _leader,  ((expectedDestination _leader) select 0), _behcolor];};'	
];
****************************************************************/ 