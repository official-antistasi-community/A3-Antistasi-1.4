/*  This loop updates the aggression every minute

    Execution on: Server

    Scope: Internal

    Params:
        None

    Returns:
        Nothing
*/

while {true} do
{
    sleep 60;

    waitUntil {!prestigeIsChanging};
    prestigeIsChanging = true;

    //Calculate new values for each element
    aggressionStackOccupants = aggressionStackOccupants apply {[(_x select 0) + (_x select 1), (_x select 1)]};
    //Filter out all elements which have passed the 0 value
    aggressionStackOccupants = aggressionStackOccupants select {(_x select 0) * (_x select 1) < 0};

    //Calculate new values for each element
    aggressionStackInvaders = aggressionStackInvaders apply {[(_x select 0) + (_x select 1), (_x select 1)]};
    //Filter out all elements which have passed the 0 value
    aggressionStackInvaders = aggressionStackInvaders select {(_x select 0) * (_x select 1) < 0};

    prestigeIsChanging = false;
    [] call A3A_fnc_calculateAggression;

    //Update attackCountdown
    attackCountdown = attackCountdown - (60 * (0.5 + ((aggressionOccupants + aggressionInvaders)/200)));
	if (attackCountdown < 0) then {attackCountdown = 0};
	publicVariable "attackCountdown";
	if (attackCountdown == 0) then
	{
		[1200] remoteExec ["A3A_fnc_timingCA",2];
		if (!bigAttackInProgress) then
		{
			[] spawn A3A_fnc_rebelAttack;
		};
	};
};
