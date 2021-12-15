// call compileScript ["functions\Utility\KeyCache\Tests\unitTest_drop_expired.sqf"];

#include "..\config.hpp"
#include "..\..\..\..\Includes\common.inc"
FIX_LINE_NUMBERS()

private _reporterContext = [];
private _fnc_reporter = {
    params ["_context","_text"];
    ["UnitTest KeyCache-Drop Expired", _text] call A3A_fnc_customHint;
    Info("UnitTest, KeyCache Drop Expired, " + _text);
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

    Dev_keyCacheDropUnitTest_expired_onGCRan = false;

    _keyCache_DB set ["SomeTestVariable",["SomeAnswerVariable",100,serverTime,{Dev_keyCacheDropUnitTest_expired_onGCRan = true}]];
    [_reporterContext, "Drop Expired<br/>Test Started"] call _fnc_reporter;

    //// Assert
    "SomeTestVariable" call A3A_fnc_keyCache_drop;

    private _passedTest = !("SomeTestVariable" in _keyCache_DB);
    uiSleep 1;
    _passedTest = _passedTest && Dev_keyCacheDropUnitTest_expired_onGCRan;

    if (_passedTest) then {
        [_reporterContext, "Drop Expired<br/>Test Passed"] call _fnc_reporter;
    } else {
        [_reporterContext, "Drop Expired<br/>Test Failed"] call _fnc_reporter;
    };

    //// Clean Up
    Dev_keyCacheDropUnitTest_expired_onGCRan = nil;
    call compileScript [A3A_keyCache_unitTest_directoryPath+"unitTestUtility_revertInit.sqf"];
    Dev_unitTestInProgress = nil;
};
"Unit Test Started";
