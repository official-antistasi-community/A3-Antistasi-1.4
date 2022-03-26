private ["_bldpositions","_position","_allpos","_timeontarget"];

(_this select 1) setvariable ["UPSMON_Civdisable",true];

switch (_this select 0) do 
{
	case "COMBAT": 
	{
	
	};
	
	case "TALK": 
	{
		_timeontarget = time + 120;
		_position1 = getposATL (_this select 1);
		_position2 = getposATL (_this select 2);
		If (_position1 vectordistance _position2 > 5) then 
		{
			Dostop (_this select 1);
			(_this select 1) Domove _position2;
			(_this select 1) setDestination [_position2, "LEADER PLANNED", true];
			waituntil {IsNull (_this select 1) || !alive (_this select 1) || getposATL (_this select 1) vectordistance _position2 <= 3};
		};
		
		If (alive (_this select 1)) then
		{
			Dostop (_this select 1);
			[(_this select 1),_position2] call UPSMON_dowatch;
			(_this select 1) action ["Talk", _this select 2];
			sleep 0.8;
			(_this select 1) disableAI "MOVE";
		};
	};
	
	case "SIT": 
	{
		(_this select 1) action ["sitDown", _this select 1];
		(_this select 1) disableAI "MOVE";
		If (UPSMON_Allowfireplace) then
		{
			If ([] call UPSMON_Nighttime) then
			{
				If (!([(_this select 1)] call UPSMON_Inbuilding)) then
				{
					If (count (nearestobjects [getposATL (_this select 1),["FirePlace_burning_F"],50]) == 0) then
					{
						If (count (nearestobjects [getposATL (_this select 1),["Streetlamp"],100]) == 0) then
						{
							_pos = [getposATL (_this select 1),getdir (_this select 1),2] call UPSMON_GetPos2D;
							_fireplace = "FirePlace_burning_F" createvehicle _pos;
							(_this select 1) setvariable ["UPSMON_fireplace",_fireplace]
						};
					};
				};
			};
		};
	};
	
	case "FLEE": 
	{
		If (Speedmode (_this select 1) != "FULL") then {(_this select 1) setspeedmode "FULL"};
		If (Behaviour (_this select 1) != "CARELESS") then {(_this select 1) setspeedmode "CARELESS"};
		
		If ((_this select 1) getvariable ["UPSMON_Civdisable",false]) then 
		{
			(_this select 1) switchmove "";
			(_this select 1) enableAI "MOVE";
			(_this select 1) setvariable ["UPSMON_Civdisable",false];	
		};
		
		(_this select 1) setvariable ["UPSMON_Civfleeing",true];
		_position = [];
		
		If ((IsNull (_this select 2)) || !([(_this select 2),(_this select 1),20,130] call UPSMON_Haslos)) then
		{
			_bldpositions = [getposATL (_this select 1),"RANDOMDN",100] call UPSMON_GetNearestBuilding;					
			if (count _bldpositions > 0) then
			{
				_bldpos = _bldpositions select 1;
				_position = (_bldpos select 0) select 0;
			};
		
			If (count _position > 0) then
			{
				Dostop (_this select 1);
				(_this select 1) Domove _position;
				(_this select 1) setDestination [_position, "LEADER PLANNED", true];
				waituntil {IsNull (_this select 1) || !alive (_this select 1) || (((getposATL (_this select 1)) vectordistance _position) <= 3)};
			
				if (!IsNull (_this select 1)) then
				{
					if (alive (_this select 1)) then
					{
						If (getposATL (_this select 1) vectordistance _position <= 3) then
						{
							(_this select 1) disableAI "MOVE";
							(_this select 1) setunitpos "MIDDLE";
						};
					};
				};
			}
			else
			{
				(_this select 1) disableAI "MOVE";
				(_this select 1) setunitpos "DOWN";
			};
			
		}
		else
		{
			(_this select 1) disableAI "MOVE";
			(_this select 1) setunitpos "DOWN";		
		};
		
		sleep 120;
		
		(_this select 1) setvariable ["UPSMON_Civfleeing",false];
		If (Speedmode (_this select 1) != "LIMITED") then {(_this select 1) setspeedmode "LIMITED"};
	};
};