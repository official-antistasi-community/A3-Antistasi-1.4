// call compileScript ["functions\Utility\KeyCache\Tests\unitTest_set_expiry.sqf"];

#include "..\config.hpp"
__fixLineNumbers

private _fnc_reporter = compileScript [__keyCache_testDirectoryPath+"testReporter.sqf"];
private _reporterContext = createHashmapFromArray [["_componentName","Set-Expiry"]];

if (!isNil {Dev_unitTestInProgress}) exitWith {
    __log_error("Previous unit test still running");
    "Previous unit test still running";
};
Dev_unitTestInProgress = true;
Dev_testHandle = [_fnc_reporter,_reporterContext] spawn {
    //// Setup
    params ["_fnc_reporter","_reporterContext"];
    "confirmUnitTest" call A3A_fnc_keyCache_init;
    private _keyCache_DB = __keyCache_getVar(A3A_keyCache_DB);
    [_reporterContext, "Set Expiry<br/>Test Started"] call _fnc_reporter;

    //// Assert
    ["SomeTestVariable", "SomeAnswerVariable", 300, {hint "Goodbye World"}] call A3A_fnc_keyCache_set;
    private _struct = _keyCache_DB getOrDefault ["SomeTestVariable",["WrongAnswer",0,-1,nil]];

    // Since these are so small, they have been lumped together. Although it is no longer a true unit test.
    private _checks = [
        ["correctTranslation", _struct#0 isEqualTo "SomeAnswerVariable"],
        ["correctLifetime", _struct#1 isEqualTo 300],
        ["expiryInFuture", _struct#2 > serverTime],
        ["hasOnGC", _struct#3 isEqualTo {hint "Goodbye World"}],
        ["registeredForGC", "SomeTestVariable" in __keyCache_getVar(A3A_keyCache_GC_registeredItems)]
    ];

    private _failedTests = [];
    private _passedTest = true;
    {
        if (isNil {_x#1} || {_x#1 == false}) then {
            _passedTest = false;
            _failedTests pushBack _x#0;
        };
    } forEach _checks;

    if (_passedTest) then {
        [_reporterContext, "Set No Expiry<br/>Test Passed"] call _fnc_reporter;
    } else {
        [_reporterContext, "Set No Expiry<br/>Test Failed, ("+(_failedTests joinString ", ")+")"] call _fnc_reporter;
    };

    //// Clean Up
    call compileScript [__keyCache_testDirectoryPath+"unitTestUtility_revertInit.sqf"];
    Dev_unitTestInProgress = nil;
};
"Unit Test Started";
