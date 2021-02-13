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

    //Sleep if no player is online
    if (isMultiplayer && (count (allPlayers - (entities "HeadlessClient_F")) == 0)) then
    {
        waitUntil {sleep 10; (count (allPlayers - (entities "HeadlessClient_F")) > 0)};
    };

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

    [3, format ["Occupants:%1 Invaders:%2 Warlevel:%3", aggressionOccupants, aggressionInvaders, tierWar], "aggressionUpdateLoop"] call A3A_fnc_log;

    if(gameMode != 4) then
    {
        //Update attack countdown for occupants and execute attack if needed
        attackCountdownOccupants = attackCountdownOccupants - (60 * (0.5 + (aggressionOccupants/100)));
    	if (attackCountdownOccupants < 0) then
        {
            attackCountdownOccupants = 0;
            if (!bigAttackInProgress) then
            {
                [Occupants] spawn A3A_fnc_rebelAttack;
            }
            else
            {
                [600, Occupants] call A3A_fnc_timingCA;
            };
        }
        else
        {
            //timingCA broadcasts the value in the if case
            publicVariable "attackCountdownOccupants";
        };
    };

    if (gameMode != 3) then
    {
        //Update attack countdown for invaders and execute attack if needed
        attackCountdownInvaders = attackCountdownInvaders - (60 * (0.5 + (aggressionInvaders/100)));
    	if (attackCountdownInvaders < 0) then
        {
            attackCountdownInvaders = 0;
            if (!bigAttackInProgress) then
            {
                [Invaders] spawn A3A_fnc_rebelAttack;
            }
            else
            {
                [600, Invaders] call A3A_fnc_timingCA;
            };
        }
        else
        {
            //timingCA broadcasts the value in the if case
            publicVariable "attackCountdownOccupants";
        };
    };
};
