params ["_Unit","_Grenade",["_Force",false]];


//Get group FSM EH
private _FSMID = (group _Unit) getVariable "VCOM_FSMH";


private _SmokeGrenadeCoolDownChk = _FSMID getFSMVariable "_SmokeGrenadeCoolDownChk";
 
//Do zeus control check - the AI unit has to be local to the machine that is doing this check.
private _RemoteControlled = false;
if (local _Unit) then
{
	private _AmITooControlling = missionNamespace getVariable ["bis_fnc_moduleRemoteControl_unit", player];
	if (_AmITooControlling isEqualTo _Unit) then {_RemoteControlled = true;}; 
};

if (_RemoteControlled) exitwith {};

//First we need to find our neastest known enemy.
private _NEnemies = (leader _unit) call VCM_fnc_ClstKnwnEnmy;

//If there are no known enemies, maybe we should throw a smoke grenade on our position. Or if they are further than 30 meters.
if (count _NEnemies > 0) then
{

	private _TargetArray = [];
	{
		if (_x # 0 < 40) then
		{
			_TargetArray pushback (_x # 1);
		};
	} foreach _NEnemies;

	//Target is close enough to consider for grenade range.
	if (count _TargetArray > 0 && {_Grenade}) then
	{
			private _NE = [_TargetArray,_Unit,true,""] call VCM_fnc_ClstObj;
			private _PotentialGrenades = ((configfile >> "CfgWeapons" >> "Throw") call BIS_fnc_getCfgSubClasses);
			private _CurrentGear = magazines _unit;
			private _ExitNow = false;
			if (_NE distance2D _Unit < 100) then
			{

				
				{
					if (!(["smoke",_x] call BIS_fnc_inString) && !(["IR",_x] call BIS_fnc_inString)) then
					{
						private _CfgPath = (configFile >> "CfgWeapons" >> "Throw" >> _x >> "magazines");
						private _muzzle_magazines = getArray _CfgPath;
						private _FinalGrenade = "none";
						{
							if (_x in _CurrentGear) exitWith
							{
								_FinalGrenade = _x;
							};
						} foreach _muzzle_magazines;
						
						if !(_FinalGrenade isEqualTo "none") then
						{
								_unit lookAt _NE;
								_intersections = lineIntersectsSurfaces [eyePos _unit, aimPos _NE, _unit, _NE, true, 1];
								private _TooClose = false;
								if (count _intersections > 0) then
								{
									if ((_intersections#0)#0 distance2D (getposASL _unit) < 10) then
									{
										_TooClose = true;
									};
								};
								if (_TooClose) exitWith {};
								sleep 1;
								_unit setVariable ["vcm_muzzle",_x];
								_unit setVariable ["vcm_NE",_NE];
								_TempID = _unit addEventHandler ["Fired", 
								{
									params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
									private _getMuzzle = _unit getVariable ["vcm_muzzle","none"];
									private _NE = _unit getVariable ["vcm_NE","none"];
									if (_muzzle isEqualTo _getMuzzle) then
									{
										_projectile spawn
										{
											waituntil {(getposATL _this)#2 < 0.1};
											_this setVelocity [((random 2)-(random 4)),((random 2)-(random 4)),(random 2)];
										};
										private _dir = direction _NE;
										private _TargetPos = getposATL _NE;								
										private _speed = (30 + (random 10));
										private _oPos = getposATL _projectile;
										private _dir2 = ((_Targetpos select 0) - (_oPos select 0)) atan2 ((_Targetpos select 1) - (_oPos select 1));
										private _range = _unit distance2D _NE;
										_range = _range + (random 2);
										
										private _GetVelocity = velocity _NE;
										
										private _boostX = (_GetVelocity select 0) * 1.5;
										private _boostY = (_GetVelocity select 1) * 1.5;
										private _LOS = [ObjNull, "GEOM"] checkVisibility [eyePos _unit, eyePos _NE];
										private _ZBoost = 2.5;
										if (_LOS isEqualTo 0) then {_ZBoost = 6;_range = _range/1.1;};
										_projectile setvelocity [_speed * (sin _dir2) + (_boostX), _speed * (cos _dir2) + (_boostY), _ZBoost * (_range/_speed)];								
									};
								}];
							_unit forceweaponfire [_x,_x];
							[_TempID,_unit] spawn {params ["_TempID","_Unit"];sleep 2;_unit removeEventHandler ["Fired", _TempID]};
							_ExitNow = true;
						};
					};
					if (_ExitNow) exitWith {};
				} foreach _PotentialGrenades;
			};
		};
		
		private _TargetArray = [];
		{
			_TargetArray pushback (_x # 1);
		} foreach _NEnemies;
};	

if (!(_Grenade) && {_Force || {(_SmokeGrenadeCoolDownChk + Vcm_SmokeCooldown) < time}}) then
{

	//Smoke grenade use
	private _UnitSide = side _Unit;
	private _Enemies = ((allunits select {side _x isEqualTo _UnitSide}) inAreaArray [(getpos _Unit), 1000, 1000, 0, false, -1]);
	private _NE = [_Enemies,_Unit,true,""] call VCM_fnc_ClstObj;
	private _PotentialGrenades = ((configfile >> "CfgWeapons" >> "Throw") call BIS_fnc_getCfgSubClasses);
	private _CurrentGear = magazines _unit;
	private _ExitNow = false;
	{
		//Set FSM variable back to current time, to reset cooldown.
		_FSMID setFSMVariable ["_SmokeGrenadeCoolDownChk",time];		
			
		if (["smoke",_x] call BIS_fnc_inString) then
		{
			private _CfgPath = (configFile >> "CfgWeapons" >> "Throw" >> _x >> "magazines");
			private _muzzle_magazines = getArray _CfgPath;
			private _FinalGrenade = "none";
			{
				if (_x in _CurrentGear) exitWith
				{
					_FinalGrenade = _x;
				};
			} foreach _muzzle_magazines;
			
			if !(_FinalGrenade isEqualTo "none") then
			{
					_unit lookAt _NE;					
					sleep 1;
					_unit setVariable ["vcm_muzzle",_x];
					_unit setVariable ["vcm_NE",_NE];
					_TempID = _unit addEventHandler ["Fired", 
					{
						params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
						private _getMuzzle = _unit getVariable ["vcm_muzzle","none"];
						private _NE = _unit getVariable ["vcm_NE","none"];
						if (_muzzle isEqualTo _getMuzzle) then
						{
							_projectile spawn
							{
								waituntil {(getposATL _this)#2 < 0.1};
								_this setVelocity [((random 2)-(random 4)),((random 2)-(random 4)),(random 2)];
							};
							private _dir = direction _NE;
							private _TargetPos = getposATL _NE;								
							private _speed = (5 + (random 5));
							private _oPos = getposATL _projectile;
							private _dir2 = ((_Targetpos select 0) - (_oPos select 0)) atan2 ((_Targetpos select 1) - (_oPos select 1));
							private _range = (_unit distance2D _NE)/10;
							_range = _range + (random 2);
							
							private _GetVelocity = velocity _NE;
							
							private _boostX = (_GetVelocity select 0) * 1.5;
							private _boostY = (_GetVelocity select 1) * 1.5;
							private _LOS = [ObjNull, "GEOM"] checkVisibility [eyePos _unit, eyePos _NE];
							private _ZBoost = 2.5;
							if (_LOS isEqualTo 0) then {_ZBoost = 1;_range = _range/5;};
							_projectile setvelocity [_speed * (sin _dir2) + (_boostX), _speed * (cos _dir2) + (_boostY), _ZBoost * (_range/_speed)];								
						};
					}];
				_unit forceweaponfire [_x,_x];
				[_TempID,_unit] spawn {params ["_TempID","_Unit"];sleep 2;_unit removeEventHandler ["Fired", _TempID]};
				_ExitNow = true;
			};
		};
		if (_ExitNow) exitWith {};
	} foreach _PotentialGrenades;		
};
		





