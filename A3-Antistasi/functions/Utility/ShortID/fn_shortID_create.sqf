/*
Maintainer: Caleb Serafin
    Creates a ShortID that is unique to every computer on a server during the servers uptime.
    This is not unique between restarts or different servers.

Return Value: <ShortID>: <SCALAR, SCALAR>

Scope: Any
Environment: Unscheduled
Public: Yes
Dependency: <CODE> fn_shortID_init must of completed.

Example:
    call A3A_fnc_shortID_create;  // [1280,1]

    [] spawn {
        private _id = 0;
        isNil{_id = call A3A_fnc_shortID_create};
        _id;  // [1280,2]
    };
*/
private _newID = [A3A_shortID_clientID + A3A_shortID_counter2, A3A_shortID_counter1];

A3A_shortID_counter1 = A3A_shortID_counter1 + 1;
if (A3A_shortID_counter1 >= A3A_shortID_counter1Modulo) then {
    A3A_shortID_counter1 = 0;
    A3A_shortID_counter2 = (A3A_shortID_counter2 + 1) mod A3A_shortID_counter2Modulo;
};

_newID;
