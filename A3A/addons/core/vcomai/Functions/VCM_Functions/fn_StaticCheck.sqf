//[_x,_CurrentBackPack,_VCOM_HASUAV]
params ["_StaticList"];

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
			if !(_HASUAV) then
			{
				
				if !(_AssembledG isEqualTo "") then
				{
					private _StaticCreated = _AssembledG createvehicle [0,0,100];
			
					[_Unit,_StaticCreated,_NearestEnemy] spawn 
					{
						params ["_Unit","_StaticCreated","_NearestEnemy"];
						
						private _NewPos = _Unit modelToWorld [0,1,0.35];
						_StaticCreated allowdamage false;
						_StaticCreated setVelocity [0,0,0];
						private _NewPos = _Unit modelToWorld [0,1,0.35];
						_StaticCreated setposATL _NewPos;
						_StaticCreated allowdamage true;
						
						sleep (random 2);
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
			
					_StaticList set [_foreachindex,"DELETEME"];
					[_Unit,_CurrentBackPack,_StaticCreated] spawn VCM_fnc_PackStatic;
				};
			}
			else
			{
				if !(_AssembledG isEqualTo "") then
				{

					[_Unit,_NearestEnemy,_AssembledG] spawn 
					{
						params ["_Unit","_NearestEnemy","_AssembledG"];
			
						sleep (random 2);
						[_Unit,"AinvPknlMstpSnonWnonDnon_Putdown_AmovPknlMstpSnonWnonDnon"] remoteExec ["Vcm_PMN",0];
						removeBackpackGlobal _Unit;
						sleep 3.5;
						private _UAVCreated = _AssembledG createvehicle [0,0,50];
						_UAVCreated engineon true;
						_UAVCreated allowdamage false;
						_UAVCreated setVelocity [0,0,0];
						private _NewPos = _Unit modelToWorld [0,1,0.25];
						_UAVCreated setposATL _NewPos;
						
						createVehicleCrew _UAVCreated;
						{
							[_x] joinsilent (group _Unit);
						} foreach (crew _UAVCreated);
						_UAVCreated spawn {sleep 30;_this allowdamage true;};
						_UAVCreated domove (getposATL _NearestEnemy);
						_StaticList set [_foreachindex,"DELETEME"];
					};
				

				};
			};
		
		};
	};
} foreach _StaticList;
_StaticList = _StaticList - ["DELETEME"];

_StaticList