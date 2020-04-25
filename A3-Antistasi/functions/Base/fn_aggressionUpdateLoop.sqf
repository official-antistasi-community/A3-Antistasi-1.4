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

    private _counter = 0;
    while {_counter < (count aggressionStackOccupants)} do
    {
        private _element = aggressionStackOccupants select _counter;
        _element set [0, (_element select 0) + (_element select 1)];

        //Quick check if the signs of the values are equal, if so delete
        if((_element select 0) * (_element select 1) >= 0) then
        {
            aggressionStackOccupants deleteAt _counter;
            _counter = _counter - 1;
        };
        _counter = _counter + 1;
    };

    _counter = 0;
    while {_counter < (count aggressionStackInvaders)} do
    {
        private _element = aggressionStackInvaders select _counter;
        _element set [0, (_element select 0) + (_element select 1)];

        //Quick check if the signs of the values are equal, if so delete
        if((_element select 0) * (_element select 1) >= 0) then
        {
            aggressionStackInvaders deleteAt _counter;
            _counter = _counter - 1;
        };
        _counter = _counter + 1;
    };

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
