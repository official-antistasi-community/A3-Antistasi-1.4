/*
	Author: Genesis

	Description:
		This function handles units actively engaging enemies from a larger distance

	Parameter(s):
		0: ARRAY - List of all units within a group

	Returns:
		nil
*/
params ["_Group","_SniperList"];

private _NearestEnemy = (leader _Group) call VCM_fnc_ClstKnwnEnmy;

if (count _NearestEnemy > 0) then
{

	private _ShootArray = [];
	{
		if (_Group knowsAbout (_x # 1) > 1.5) then
		{
			_ShootArray pushback (_x # 1);
		};
	
	} foreach _NearestEnemy;
	
	if (count _ShootArray > 0) then
	{
		
		{
				if !(_x in _SniperList) then
				{
					if ((random 100) > 50) then
					{
							private _rtrn = [_ShootArray,_x,true,""] call VCM_fnc_ClstObj;
							private _LOS = [_x, "VIEW"] checkVisibility [eyePos _x, eyePos _rtrn];
							//private _LOS = lineIntersectsSurfaces [eyePos _x, eyePos _rtrn, objNull, objNull, false, 1,"VIEW","GEOM"];
							if (_LOS > 0) then
							{
								[_x,_rtrn] spawn
								{
									params ["_Unit","_rtrn"];
									sleep (2 + RANDOM 4);									
									for "_i" from 1 to (random 2) do 
									{
										_Unit doSuppressiveFire _rtrn;
										_Unit suppressFor 3;
										sleep 3;
									};
								};
							};
					};
				};
		} foreach (units _Group);
	};
};