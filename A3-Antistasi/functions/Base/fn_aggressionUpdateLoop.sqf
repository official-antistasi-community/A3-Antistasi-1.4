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
    [] spawn A3A_fnc_calculateAggression;
};
