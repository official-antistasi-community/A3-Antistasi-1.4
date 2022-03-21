
/*
	Author: Genesis

	Description:
		Function for AI calling in artillery support.

	Parameter(s):
		0: GROUP - Group calling for support
		1: GROUP - Enemy group to be targetted

	Returns:
		NOTHING
		
		
		
		
		
west reportRemoteTarget [TARGET, 3600];
TARGET confirmSensorTarget [west, true];
VLS fireAtTarget [TARGET, "weapon_vls_01"];		
		
*/

params ["_callGrp","_enemyGrp","_AvgKnw","_PredictedLoc"];
private _CallSide = (side _callGrp);

private _LazClass = "";
switch (_CallSide) do 
{
	case (west): {_LazClass = "LaserTargetE";};
	case (east): {_LazClass = "LaserTargetW";};
	case (resistance): {_LazClass = "LaserTargetE";};
};


//First let's go ahead and make sure we clear any dead artillery units.
private _RemoveList = [];

{
	private _veh = _x;
	private _class = typeOf _veh;
	if !(isNil ("_class")) then 
	{
		private _artyChk = getNumber(configfile/"CfgVehicles"/_class/"artilleryScanner");	
		if (!(_artyChk isEqualTo 1) || !(alive _x)) then
		{
			_RemoveList pushBack _x;
		};
	};
} foreach VCM_ARTYLST;

{
		private _Num = _x;
		private _Index = VCM_ARTYLST findIf {_x isEqualTo _Num};
		VCM_ARTYLST deleteAt _Index;
} foreach _RemoveList;

//Let's find an artillery group that can provide support.
private _artyArray = [];
{
	if ([(side _x),_CallSide] call BIS_fnc_sideIsFriendly && {side _x in VCM_ARTYSIDES}) then
	{
		_artyArray pushback _x;
	};	
} foreach VCM_ARTYLST;

//There are no artillery units available!
if (_artyArray isEqualTo []) exitWith {};

//Now with our completed array, lets find positions that can support.
private _clstGrp = [_artyArray,(leader _callGrp),true,"Arty1"] call VCM_fnc_ClstObj;
if (isNil "_clstGrp") exitWith {};

//Now we need to see how much we know about the enemy.

private _EnemyGrpLeader = leader _enemyGrp;
//Find any friendlies within 50 meters.
private _AllEmyUnits = _EnemyGrpLeader nearEntities [["Man","LandVehicle"], 50];

if (count _AllEmyUnits < 1) exitWith {};


//Now that we passed basic checks, let's collect more information to do the damage.
private _VCnt = [];
private _MinRDist = 0;
private _MaxRDist = 0;

private _RndNumber = 0;


switch (true) do 
{
	case (_AvgKnw >= 0 && {_AvgKnw < 10}): {_MinRDist = 50;_MaxRDist = 100;_RndNumber = 1;};
	case (_AvgKnw >= 10 && {_AvgKnw < 20}): {_MinRDist = 40;_MaxRDist = 80;_RndNumber = 1;};
	case (_AvgKnw >= 20 && {_AvgKnw < 30}): {_MinRDist = 30;_MaxRDist = 60;_RndNumber = 1;};
	case (_AvgKnw >= 30 && {_AvgKnw < 40}): {_MinRDist = 20;_MaxRDist = 50;_RndNumber = 1;};
	case (_AvgKnw >= 40 && {_AvgKnw < 50}): {_MinRDist = 15;_MaxRDist = 50;_RndNumber = 2;};
	case (_AvgKnw >= 50 && {_AvgKnw < 60}): {_MinRDist = 10;_MaxRDist = 50;_RndNumber = 2;};
	case (_AvgKnw >= 60 && {_AvgKnw < 70}): {_MinRDist = 8;_MaxRDist = 30;_RndNumber = 2;};
	case (_AvgKnw >= 70 && {_AvgKnw < 80}): {_MinRDist = 6;_MaxRDist = 30;_RndNumber = 2;};
	case (_AvgKnw >= 80 && {_AvgKnw < 90}): {_MinRDist = 4;_MaxRDist = 30;_RndNumber = 3;};
	case (_AvgKnw >= 90 && {_AvgKnw <= 100}): {_MinRDist = 2;_MaxRDist = 30;_RndNumber = 3;};
	case (_AvgKnw > 100): {_MinRDist = 1;_MaxRDist = 25;_RndNumber = 3;};
};

	if (VCM_DebugOld) then {systemChat (format ["_AvgKnw: %1  _RndNumber: %2",_AvgKnw,_RndNumber])};

{
	if (_x isKindOf "LandVehicle") then
	{
		_Vcnt pushBack _x;
	};	
} foreach _AllEmyUnits;
	


//Define what rounds we are using at the enemies.
//["HE","Guided","Laser Guided","Cluster Shells","Mine Cluster","White Smoke","AT Mine Cluster"]
//_Finallist pushbackunique (getText(configfile/"CfgMagazines"/_x/"displayNameShort"));	
private _FinalArtyArray = [];
private _FinalAmmoType = [];
private _SmokeArray = [];
if (VCM_DebugOld) then {systemChat (format ["count _VCnt: %1",(count _VCnt)])};
if (count _VCnt > 0) then
{
	{
		private _Unit = _x;
		private _ammoArray = getArtilleryAmmo [vehicle _Unit];
		if !(isNil "_ammoArray") then
		{
			{
				private _Type = getText(configfile/"CfgMagazines"/_x/"displayNameShort");
				if (["AT", _Type] call BIS_fnc_inString || ["Guided", _Type] call BIS_fnc_inString) then {_FinalArtyArray pushBackUnique _Unit;_FinalAmmoType pushBackUnique _x;};
				if (["Smoke", _Type] call BIS_fnc_inString) then {_SmokeArray pushBackUnique _x;};
			} foreach _ammoArray;		
		};	
	} foreach (units _clstGrp);
	private _VAttached = selectRandom _VCnt;
	private _LazTarget = _LazClass createVehicle [0,0,0];_LazTarget attachto [_VAttached,[0,0,4]]; _LazTarget spawn {sleep 120; deleteVehicle _this;};
	_CallSide reportRemoteTarget [_VAttached, 120];
	_VAttached confirmSensorTarget [_CallSide, true];
	
	if (VCM_DebugOld) then {systemChat (format ["_LazTarget: %1 Attached To: %2",_LazTarget,(typeOf _VAttached)])};
}
else
{
	{
		private _Unit = _x;
		private _ammoArray = getArtilleryAmmo [vehicle _Unit];
		if !(isNil "_ammoArray") then
		{
			{
				private _Type = getText(configfile/"CfgMagazines"/_x/"displayNameShort");
				if (["HE", _Type] call BIS_fnc_inString || ["Cluster", _Type] call BIS_fnc_inString && !(["AT", _Type] call BIS_fnc_inString)) then {_FinalArtyArray pushBackUnique _Unit;_FinalAmmoType pushBackUnique _x;};
				if (["Smoke", _Type] call BIS_fnc_inString) then {_SmokeArray pushBackUnique _x;};
			} foreach _ammoArray;		
		};	
	} foreach (units _clstGrp);	
	
};


if (VCM_DebugOld) then {systemChat (format ["_clstGrp: %1  _FinalAmmoType: %2",_clstGrp,_FinalAmmoType])};

//Now let's fire
private _RndSelEnmy = selectRandom _AllEmyUnits;
private _PredictedLoc2 = ((leader _callGrp) targetKnowledge (vehicle _RndSelEnmy))#6;


private _aVehGrpUnits = [];
{_aVehGrpUnits pushback (vehicle _x)} foreach _FinalArtyArray;
private _randomAmmoArray = selectRandom _FinalAmmoType;
if (isNil "_randomAmmoArray") exitWith {If (VCM_DebugOld) then {[(leader _clstGrp),"NO AMMO"] call VCM_fnc_DebugText;};};


//Exit if group cannot reach.
private _continueFiring = _PredictedLoc2 inRangeOfArtillery [_aVehGrpUnits,_randomAmmoArray];
if !(_continueFiring) exitWith {If (VCM_DebugOld) then {[(leader _clstGrp),"NOT APPROPRIATE RANGE"] call VCM_fnc_DebugText;};};


//Make sure we do minimal friendly fire.
private _FriendlyArray = (leader _clstGrp) call VCM_fnc_FriendlyArray;


if (_RndNumber isEqualTo 1) then
{
		private _FireUnit = selectRandom _aVehGrpUnits;
		private _dist = (_MinRDist + (random _MaxRDist));
		private _pos = _PredictedLoc2;		
		private _positions = _pos getPos [_dist,(random 360)];
		private _CF = [_FriendlyArray,_positions,true,"Arty1"] call VCM_fnc_ClstObj;
		if (_CF distance2D _positions > 100) then
		{
			_FireUnit doArtilleryFire [_positions,_randomAmmoArray,_RndNumber];	
			If (VCM_DebugOld) then {[(leader _clstGrp),"DO FIRE"] call VCM_fnc_DebugText;};
		}
		else
		{
			If (VCM_DebugOld) then {[(leader _clstGrp),"SMOKE FIRE"] call VCM_fnc_DebugText;};
			if (count _SmokeArray > 0) then
			{
				_FireUnit doArtilleryFire [_positions,(selectRandom _SmokeArray),_RndNumber];	
			};
		};
}
else
{
	{
		private _dist = (_MinRDist + (random _MaxRDist));
		private _pos = _PredictedLoc2;
		private _positions = _pos getPos [_dist,(random 360)];
		private _CF = [_FriendlyArray,_positions,true,"Arty1"] call VCM_fnc_ClstObj;
		If (VCM_DebugOld) then {[(leader _clstGrp),"DO FIRE 2"] call VCM_fnc_DebugText;};
		if (_CF distance2D _positions > 50) then
		{
			_x doArtilleryFire [_positions,_randomAmmoArray,_RndNumber];	
		}
		else
		{
			if (count _SmokeArray > 0) then
			{
				_x doArtilleryFire [_positions,(selectRandom _SmokeArray),_RndNumber];	
			};
		};
	} foreach _aVehGrpUnits;
};