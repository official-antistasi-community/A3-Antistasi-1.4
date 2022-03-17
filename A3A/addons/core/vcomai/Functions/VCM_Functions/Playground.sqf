	//params ["_pos","_dist", "_params"];
	private _pos = getpos player;
	private _dist = 25;
	private _params = [1, -1, 0.1, 0, 0, false, objNull];
	_pos = _pos findEmptyPosition [0,_dist];
	if (_pos isEqualTo []) exitWith {_pos};
	_params =+ _params;
	_params set [0, -1];
	_pos = _pos isFlatEmpty _params;
	if (_pos isEqualTo []) exitWith {_pos};
	_pos




[] spawn {
	VCOMTEST = true;
	while {VCOMTEST} do {
		{
			systemchat format ["%2: %1",(getSuppression _x),(typeof _x)];

		} foreach allunits;
		sleep 0.05;
	};

};





//[_x,_CurrentBackPack,_VCOM_HASUAV]

if (VCM_Debug) then {diag_log "Static Weapon Check"};

private ["_t", "_wait"];
_t = time;
_wait = 3;

{
private _Unit = _x select 0;
private _Foot = isNull objectParent _Unit;
if (_Foot) then
{	
private _BackPack = _x select 1;
private _HASUAV = _x select 2;

private _NearestEnemy = _leader findNearestEnemy _leader;
if (isNull _NearestEnemy) then
{
	_NearestEnemy = _leader call VCM_fnc_ClstEmy;	
};

//If the unit is in a building, or can see the enemy, we don't want them deploying mortars.
private _CurrentBackPack = backpack _Unit;
private _Vcom_Indoor = false;
private _Position = getposATL _Unit;
private _Array = lineIntersectsObjs [_Position,[_Position select 0,_Position select 1,(_Position select 2) + 10], objnull, objnull, true, 4];
{
	if (_x isKindof "Building") exitWith {_Vcom_Indoor = true;};
} foreach _Array;

if !(_Vcom_Indoor) then
{
	private _AssembledG = getText (configfile >> "CfgVehicles" >> _CurrentBackPack >> "assembleInfo" >> "assembleTo");
	if !(_AssembledG isEqualTo "") then
	{
		private _StaticCreated = _AssembledG createvehicle [0,0,0];
		_StaticCreated setposATL (getposATL _Unit);

		[_Unit,_StaticCreated,_NearestEnemy] spawn 
		{
			params ["_Unit","_StaticCreated","_NearestEnemy"];

			[_Unit,"AinvPknlMstpSnonWnonDnon_Putdown_AmovPknlMstpSnonWnonDnon"] remoteExec ["Vcm_PMN",0];
  			sleep 3.5;
			_Unit assignAsGunner _StaticCreated;
			[_Unit] orderGetIn true;
			_Unit moveInGunner _StaticCreated;
			removeBackpackGlobal _Unit;

			private _dirTo = _StaticCreated getDir _NearestEnemy;
			_StaticCreated setDir _dirTo;
			(Vehicle _Unit) setDir _dirTo;
		};

		_StaticList deleteat _foreachindex;
		[_Unit,_CurrentBackPack,_StaticCreated] spawn VCM_fnc_PackStatic;
	};

};
};
} foreach _StaticList;
_BackbkC4 = time;