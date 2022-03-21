//_Group spawn VCM_fnc_UseEM;
params ["_Group"];

waitUntil 
{
	if ((random 100 <= Vcm_AI_EM_CHN)) then
	{
		{
			private _Unit = _x;
			if (isNull objectParent _Unit) then
			{
				private _MP = _Unit getVariable ["VCM_MVWP",[]];
				if (count _MP > 0 && {!(_Unit getVariable ["VCM_VAULT",false])}) then
				{
					[_Unit,_MP] spawn VCM_fnc_UseEMExec;
				};
			};
		} foreach (units _Group);
	};
	sleep 1;
	{alive _x} count (units _Group) < 1
};
