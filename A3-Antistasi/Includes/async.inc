/*
    Collection of async macros

    these macros can only be used in scheduled environment ie. when suspension is allowed
*/

//generates a unique varname for variable transmision between machines
#define genVarName(VarName) (VarName + "_" + str round (time *1000) + "_" + str round random 1e6)

/*
Author: Håkon

Await
    Awaits return from function on a remote

    Does NOT allow suspension of execution

Syntax: arg await(func, target)
    arg: <Any> anything passed to function
    func: <Code> code to be executed
    target: <Int> machine to run the function on

Return: <Any> What the function returns

Examples:
    private _ret = [argA, argB] await(someFunction, 2);

    private _ret2 = ["Test : ", "1a 2d 3c"] await({
        (_this #0) + (_this #1);
    }, 2);

    private _ret3 = await({someServerVar}, 2)

Notes:
    function has to be available on the machine you want to run it on, you can send code with this but not code stored in local variables.
    keep in mind that commas inside of macro calls is only allowed to seperate macro inputs.

Performance: ~80ms
*/
#define await(FUNCTION, TARGET) call {\
    if (!canSuspend) exitWith { Error("Suspension not allowed, spawn this function") }; \
    private _varName = genVarName("await"); \
    missionNamespace setVariable [_varName, nil]; \
    private _awaitTimeout = time + 5; \
    [[_varName, _this], { \
        params ["_varName", "_args"]; \
        private _await_VAR = _args call FUNCTION; \
        [missionNamespace, [_varName, _await_VAR]] remoteExecCall ["setVariable", remoteExecutedOwner]; \
    }] remoteExecCall ["call", TARGET]; \
    waitUntil {!isNil _varName || time > _awaitTimeout}; \
    if (isNil _varName) then { private _logString = "Await timed out after 5 secounds | Function: "+ #FUNCTION +" | Target "+ #TARGET; Error(_logString) }; \
    private _return = missionNamespace getVariable _varName; \
    missionNamespace setVariable [_varName, nil]; \
    _return \
}

/*
Author: Håkon

AwaitAsync
    Awaits return from function on a remote

    Does allow suspension of execution

Syntax: arg AwaitAsync(func, target, timeout?)
    arg: <Any> anything passed to function
    func: <Code> code to be executed
    target: <Int> machine to run the function on
    timeout: <Int> time before timeout (default 60 sec)

Return: <Any> What the function returns

Examples:
    private _ret = [argA, argB] AwaitAsync(someFunction, 2);

    private _ret2 = ["Test : ", "1a 2d 3c"] AwaitAsync({
        sleep 1;
        (_this #0) + (_this #1);
    }, 2);

    private _ret3 = AwaitAsync({someServerVar}, 2)

Notes:
    function has to be available on the machine you want to run it on, you can send code with this but not code stored in local variables.
    keep in mind that commas inside of macro calls is only allowed to seperate macro inputs.

Performance: ~100ms
*/
#define awaitAsync(FUNCTION, TARGET) call {\
    if (!canSuspend) exitWith { Error("Suspension not allowed, spawn this function") }; \
    private _varName = genVarName("awaitAsync");; \
    missionNamespace setVariable [_varName, nil]; \
    private _awaitTimeout = time + 5; \
    [[_varName, _this], { \
        params ["_varName", "_args"]; \
        private _await_VAR = _args call FUNCTION; \
        [missionNamespace, [_varName, _await_VAR]] remoteExecCall ["setVariable", remoteExecutedOwner]; \
    }] remoteExecCall ["spawn", TARGET]; \
    waitUntil {!isNil _varName || time > _awaitTimeout}; \
    if (isNil _varName) then { private _logString = "Await timed out after 5 secounds | Function: "+ #FUNCTION +" | Target "+ #TARGET; Error(_logString) }; \
    private _return = missionNamespace getVariable _varName; \
    missionNamespace setVariable [_varName, nil]; \
    _return \
}

#define awaitAsync(FUNCTION, TARGET, TIMEOUT) call {\
    if (!canSuspend) exitWith { Error("Suspension not allowed, spawn this function") }; \
    private _varName = genVarName("awaitAsync");; \
    missionNamespace setVariable [_varName, nil]; \
    private _awaitTimeout = time + TIMEOUT; \
    [[_varName, _this], { \
        params ["_varName", "_args"]; \
        private _await_VAR = _args call FUNCTION; \
        [missionNamespace, [_varName, _await_VAR]] remoteExecCall ["setVariable", remoteExecutedOwner]; \
    }] remoteExecCall ["spawn", TARGET]; \
    waitUntil {!isNil _varName || time > _awaitTimeout}; \
    if (isNil _varName) then { private _logString = "Await timed out after "+ #TIMEOUT +" secounds | Function: "+ #FUNCTION +" | Target "+ #TARGET; Error(_logString) }; \
    private _return = missionNamespace getVariable _varName; \
    missionNamespace setVariable [_varName, nil]; \
    _return \
}

/*
Author: Håkon

getVar
    gets a missionNamespace variable from a different machine

Syntax: getVar(variable, Target)
    variable: <string> Variable to get
    Target: <Int> machine to get variable from

Return: <Any> What the variable is on the target

Examples:
    private _someserverVar = getVar("someServerVar", 2);

Performance: ~85ms
*/
#define getVar(VAR, TARGET) call {\
    if (!canSuspend) exitWith { Error("Suspension not allowed, spawn this function") }; \
    private _varName = genVarName("getVar"); \
    missionNamespace setVariable [_varName, nil]; \
    [_varName, { \
        private _await_VAR = missionNamespace getVariable #VAR; \
        [missionNamespace, [_this, [_await_VAR]]] remoteExecCall ["setVariable", remoteExecutedOwner]; \
    }] remoteExecCall ["call", TARGET]; \
    waitUntil {!isNil _varName}; \
    private _return = (missionNamespace getVariable _varName) select 0; \
    missionNamespace setVariable [_varName, nil]; \
    _return \
}
