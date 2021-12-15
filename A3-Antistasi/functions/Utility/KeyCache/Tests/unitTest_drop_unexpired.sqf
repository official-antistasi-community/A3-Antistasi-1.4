// call compileScript ["functions\Utility\KeyCache\Tests\unitTest_drop_unexpired.sqf"];

#include "..\config.hpp"
__fixLineNumbers

private _fnc_reporter = compileScript [__keyCache_testDirectoryPath+"testReporter.sqf"];
private _reporterContext = createHashmapFromArray [["_componentName","Drop-Unexpired"]];

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

    Dev_keyCacheDropUnitTest_unExpired_onGCRan = false;

    _keyCache_DB set ["SomeTestVariable",["SomeAnswerVariable",100,serverTime + 100,{Dev_keyCacheDropUnitTest_unExpired_onGCRan = true}]];
    [_reporterContext, "Drop Unexpired<br/>Test Started"] call _fnc_reporter;

    //// Assert
    "SomeTestVariable" call A3A_fnc_keyCache_drop;

    private _passedTest = !("SomeTestVariable" in _keyCache_DB);
    uiSleep 1;
    _passedTest = _passedTest && !Dev_keyCacheDropUnitTest_unExpired_onGCRan;

    if (_passedTest) then {
        [_reporterContext, "Drop Unexpired<br/>Test Passed"] call _fnc_reporter;
    } else {
        [_reporterContext, "Drop Unexpired<br/>Test Failed"] call _fnc_reporter;
    };

    //// Clean Up
    Dev_keyCacheDropUnitTest_unExpired_onGCRan = nil;
    call compileScript [__keyCache_testDirectoryPath+"unitTestUtility_revertInit.sqf"];
    Dev_unitTestInProgress = nil;
};
"Unit Test Started";
