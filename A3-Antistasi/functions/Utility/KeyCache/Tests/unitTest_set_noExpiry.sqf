// call compileScript ["functions\Utility\KeyCache\Tests\unitTest_set_noExpiry.sqf"];

#include "..\config.hpp"
#include "..\..\..\..\Includes\common.inc"
FIX_LINE_NUMBERS()

private _reporterContext = [];
private _fnc_reporter = {
    params ["_context","_text"];
    ["UnitTest KeyCache-Set No Expiry", _text] call A3A_fnc_customHint;
    Info("UnitTest, KeyCache No Expiry, " + _text);
};
A3A_keyCache_unitTest_directoryPath = "functions\Utility\KeyCache\Tests\";


if (!isNil {Dev_unitTestInProgress}) exitWith {
    Error("Previous unit test still running");
    "Previous unit test still running";
};
Dev_unitTestInProgress = true;
Dev_testHandle = [_fnc_reporter,_reporterContext] spawn {
    //// Setup
    params ["_fnc_reporter","_reporterContext"];
    "confirmUnitTest" call A3A_fnc_keyCache_init;
    private _keyCache_DB = __keyCache_getVar(A3A_keyCache_DB);
    [_reporterContext, "Set No Expiry<br/>Test Started"] call _fnc_reporter;

    //// Assert
    ["SomeTestVariable", "SomeAnswerVariable", 1e39, {hint "Goodbye World"}] call A3A_fnc_keyCache_set;
    private _struct = _keyCache_DB getOrDefault ["SomeTestVariable",["WrongAnswer",0,-1,nil]];

    // Since these are so small, they have been lumped together. Although it is no longer a true unit test.
    private _checks = [
        ["correctTranslation", _struct#0 isEqualTo "SomeAnswerVariable"],
        ["infiniteLifetime", !finite (_struct#1)],
        ["infiniteExpiry", !finite (_struct#2)],
        ["hasOnGC", _struct#3 isEqualTo {hint "Goodbye World"}],
        ["excludedFromGC", !("SomeTestVariable" in __keyCache_getVar(A3A_keyCache_GC_registeredItems))]
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
    call compileScript [A3A_keyCache_unitTest_directoryPath+"unitTestUtility_revertInit.sqf"];
    Dev_unitTestInProgress = nil;
};
"Unit Test Started";
