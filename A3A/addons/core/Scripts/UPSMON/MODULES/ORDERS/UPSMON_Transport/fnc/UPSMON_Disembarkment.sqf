
private ["_grp","_assignedvehicle","_dist","_targetdist","_get_out_dist","_unitsincargo"];

_grp = _this select 0;
_assignedvehicle = _this select 1;
_dist = _this select 2;
_targetdist = _this select 3;
_supstate = _this select 4;
_safemode = ["CARELESS","SAFE"];

{
	_vehicle = vehicle _x;
	_unitsincargo = [_vehicle] call UPSMON_FN_unitsInCargo;
	

	if (!(_vehicle iskindof "AIR") && !(_vehicle iskindof "StaticWeapon") && !(_vehicle iskindof "MAN")) then
	{
		_get_out_dist = UPSMON_closeenoughV  * ((random .4) + 1);
		If (_vehicle iskindof "TANK" || _vehicle iskindof "Wheeled_APC_F" || !(IsNull (gunner _vehicle))) then {_get_out_dist = UPSMON_closeenough  * ((random .4) + 0.8);};
		If ((behaviour _x) in _safemode) then 
		{
			If (_grp getvariable ["UPSMON_Grpmission",""] != "TRANSPORT") then
			{
				_targetdist = 20000
			};
		};		
		
		if (UPSMON_Debug>0) then {diag_log format ["Disembark!!! CanMove:%1 Alive:%2 Dist1:%3 targetDist:%4 Gothit:%5 Cargo:%6",canmove _vehicle,alive (driver _vehicle),_dist <= _get_out_dist,_targetdist <= (200 * ((random .4) + 1)),_supstate,_unitsincargo];};
			
		if (!(_vehicle getvariable ["UPSMON_disembarking",false])) then
		{
			if (!(canmove _vehicle) 
				|| !(alive (driver _vehicle))
				|| _dist <= _get_out_dist 
				|| (_supstate != "") 
				|| _targetdist <= (200 * ((random .4) + 1))) then
			{
				[_vehicle,_unitsincargo,_grp,_supstate] spawn UPSMON_dodisembark;
			};
		}
	};
	
	If (_vehicle iskindof "AIR") then
	{
		If (count _unitsincargo > 0) then
		{
			If (_grp getvariable ["UPSMON_Grpmission",""] == "TRANSPORT") then
			{
				_get_out_dist = UPSMON_paradropdist * ((random 0.4) + 1);
				if (UPSMON_Debug>0) then {diag_log format ["Disembark!!! CanMove:%1 Alive:%2 Dist1:%3 targetDist:%4 Gothit:%5 Cargo:%6",canmove _vehicle,alive (driver _vehicle),_dist <= _get_out_dist,_targetdist <= (200 * ((random .4) + 1)),_supstate,_unitsincargo];};
				If (_targetdist <= _get_out_dist || _dist <= 800) then
				{
					If (((_grp getvariable ["UPSMON_Transportmission",[]]) select 0) == "LANDING" || ((_grp getvariable ["UPSMON_Transportmission",[]]) select 0) == "LANDBASE") then
					{
						If (_dist <= 800) then
						{
							If (!(_grp getvariable ["UPSMON_ChangingLZ",false])) then
							{
								_targetpos = [_vehicle,getposATL _vehicle,["car"]] call UPSMON_SrchTrpPos;
								_mission = (_grp getvariable ["UPSMON_Transportmission",[]]) select 0;
								_group = (_grp getvariable ["UPSMON_Transportmission",[]]) select 2;
								_grp setvariable ["UPSMON_Transportmission",[_mission,_targetpos,_group]];
								[_grp,_targetpos,"MOVE","COLUMN","FULL","CARELESS","YELLOW",1,UPSMON_flyInHeight] call UPSMON_DocreateWP;
								_grp getvariable ["UPSMON_ChangingLZ",true];
							};
						};
						If ((abs(velocity _vehicle select 2)) <= 1 && ((getposATL _vehicle) select 2) <= 4) then
						{
							[_vehicle,_unitsincargo,_grp] spawn UPSMON_dohelidisembark;
						};
					}
					else
					{
						[_vehicle] spawn UPSMON_KeepAltitude;
						[_vehicle,_unitsincargo,_grp] spawn UPSMON_doparadrop;
					};
				};
			};
		};
	};								
} foreach _assignedvehicle;