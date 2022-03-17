
/*
	Author: Genesis

	Description:
		Reveals players using IR-laser to enemies with NVGs.

	Parameter(s):
		NONE

	Returns:
		NOTHING
*/

while {alive player && {Vcm_ActivateAI}} do
{
	if (player isIRLaserOn currentWeapon player) then
	{
		private _side = side player;
		
		private _wepDir = (player weaponDirection currentWeapon player) vectorMultiply 1000;
		private _eyePosS = eyePos player;
		private _eyePosB = [_eyePosS select 0,_eyePosS select 1,(_eyePosS select 2 - 0.25)];
		private _endSight = _eyePosB vectoradd _wepDir;
		private _lineInter = lineIntersectsSurfaces [_eyePosB, _endSight, player, player, true, 1];
		
		if !(_lineInter isEqualTo []) then
		{
			private _finalPos = (_lineInter select 0 select 0);
			private _enemies = allUnits select {[_side,(side _x)] call BIS_fnc_sideIsEnemy && (currentVisionMode _x isEqualTo 1)};
			private _dirPlayer = getdir Player;
			if !(_enemies isEqualTo []) then
			{
				private _startPos = (getpos player);
				private _toalDist = _startPos distance2D _finalPos;
				private _chunks = round (_toalDist/100);
				private _chunkN = 0;
				while {_chunks > _chunkN} do
				{
					_startPos = [_startPos,100,_dirPlayer] call BIS_fnc_relPos;
					private _ne = [_enemies,_startPos,true,"IR"] call VCM_fnc_ClstObj;
					if (_ne distance2D _startPos < 65) exitWith 
					{				
						[
							[_ne,player],
							{
								params ["_ne","_unit"];
								if (local _ne) then
								{
									private _kv = _ne knowsAbout _unit;
									_ne reveal [_unit,(_kv + 0.4)];
								};								
							}
						] remoteExec ["bis_fnc_call",0];		
					};					
					_chunkN = _chunkN + 1;
					sleep 0.1;
				};			
			};
			sleep 0.25;
		};	
	};
	sleep 0.25;
};