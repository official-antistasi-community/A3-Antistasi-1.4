// call compileScript ["functions\Utility\KeyCache\Tests\unitTest_garbageCollector_basicDeletion.sqf"];

#include "..\config.hpp"
#include "..\..\..\..\Includes\common.inc"
FIX_LINE_NUMBERS()

private _reporterContext = [];
private _fnc_reporter = {
    params ["_context","_text"];
    ["UnitTest KeyCache-GC", _text] call A3A_fnc_customHint;
    Info("UnitTest, KeyCache GarbageCollector, " + _text);
};
A3A_keyCache_unitTest_directoryPath = "functions\Utility\KeyCache\Tests\";


if (!isNil {Dev_unitTestInProgress}) exitWith {
    Error("Previous unit test still running");
    "Previous unit test still running";
};
Dev_unitTestInProgress = true;
Dev_basicDeletionTestHandle = [_fnc_reporter,_reporterContext] spawn {
    //// Setup
    params ["_fnc_reporter","_reporterContext"];
    "confirmUnitTest" call A3A_fnc_keyCache_init;

    private _keyCache_DB = __keyCache_getVar(A3A_keyCache_DB);
    _keyCache_DB set ["Test123", [
        "value",
        100,
        0,
        nil
    ]];

    private _keyCache_GC_gen0NewestBucket = [];
    __keyCache_setVar(A3A_keyCache_GC_gen0NewestBucket, _keyCache_GC_gen0NewestBucket);
    private _keyCache_GC_generations = [
        [  // Gen0
            [_keyCache_GC_gen0NewestBucket],
            _keyCache_GC_gen0NewestBucket,
            0.001,
            1,
            0
        ]
    ];
    __keyCache_setVar(A3A_keyCache_GC_generations, _keyCache_GC_generations);

    private _GCHandle = [0] spawn A3A_fnc_keyCache_garbageCollector;
    uiSleep 1;
    "Test123" call A3A_fnc_keyCache_registerForGC;
    [_reporterContext, "Basic Deletion<br/>Test Started"] call _fnc_reporter;

    private _timeout = serverTime + 30;
    private _passedTest = false;

    //// Assert
    waitUntil {
        _passedTest = !("Test123" in _keyCache_DB);
        _passedTest || _timeout <= serverTime
    };
    if (_passedTest) then {
        [_reporterContext, "Basic Deletion<br/>Test Passed"] call _fnc_reporter;
    } else {
        [_reporterContext, "Basic Deletion<br/>Test Failed"] call _fnc_reporter;
    };

    //// Clean Up
    terminate _GCHandle;
    call compileScript [A3A_keyCache_unitTest_directoryPath+"unitTestUtility_revertInit.sqf"];
    Dev_unitTestInProgress = nil;
};
"Unit Test Started";
