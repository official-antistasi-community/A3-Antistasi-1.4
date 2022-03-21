private _T1 = time + 1;
private _T2 = time + 10;

waituntil
{
	//Every 10 seconds
	if (time > _T2) then
	{
		if (Vcm_ActivateAI) then
		{
			{
				if (local _x && {simulationEnabled (leader _x)} && {!(isplayer (leader _x))} && {(leader _x) isKindOf "Man"}) then 
				{
					private _Grp = _x;
						if !(_Grp in VcmAI_ActiveList) then //{!(VCM_SIDEENABLED findIf {_x isEqualTo (side _Grp)} isEqualTo -1)}
						{
							if !(((units _Grp) findIf {alive _x}) isEqualTo -1) then
							{
								_x call VCM_fnc_SquadExc;
							};
						};
				};
			} foreach allGroups;
		};
		_T2 = time + 10;
	};	
	sleep 1;
	false;
};