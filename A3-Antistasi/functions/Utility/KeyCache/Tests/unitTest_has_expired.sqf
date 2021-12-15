// call compileScript ["functions\Utility\KeyCache\Tests\unitTest_has_expired.sqf"];

#include "..\config.hpp"
#include "..\..\..\..\Includes\common.inc"
FIX_LINE_NUMBERS()

private _reporterContext = [];
private _fnc_reporter = {
    params ["_context","_text"];
    ["UnitTest KeyCache-Has Expired", _text] call A3A_fnc_customHint;
    Info("UnitTest, KeyCache Has Expired, " + _text);
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
    _keyCache_DB set ["SomeTestVariable",["SomeAnswerVariable",100,serverTime,nil]];
    [_reporterContext, "Has Expired<br/>Test Started"] call _fnc_reporter;

    //// Assert
    private _passedTest = !("SomeTestVariable" call A3A_fnc_keyCache_has);
    if (_passedTest) then {
        [_reporterContext, "Has Expired<br/>Test Passed"] call _fnc_reporter;
    } else {
        [_reporterContext, "Has Expired<br/>Test Failed"] call _fnc_reporter;
    };

    //// Clean Up
    call compileScript [A3A_keyCache_unitTest_directoryPath+"unitTestUtility_revertInit.sqf"];
    Dev_unitTestInProgress = nil;
};
"Unit Test Started";
