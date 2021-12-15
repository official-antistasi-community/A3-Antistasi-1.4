// call compileScript ["functions\Utility\KeyCache\Tests\unitTest_lookup_unExpired.sqf"];

#include "..\config.hpp"
#include "..\..\..\..\Includes\common.inc"
FIX_LINE_NUMBERS()

private _reporterContext = [];
private _fnc_reporter = {
    params ["_context","_text"];
    ["UnitTest KeyCache-Lookup Unexpired", _text] call A3A_fnc_customHint;
    Info("UnitTest, KeyCache Lookup Unexpired, " + _text);
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
    _keyCache_DB set ["SomeTestVariable",["SomeAnswerVariable",300,serverTime + 100,nil]];
    [_reporterContext, "Lookup Unexpired<br/>Test Started"] call _fnc_reporter;

    //// Assert
    private _value = "SomeTestVariable" call A3A_fnc_keyCache_lookup;
    private _expiry = (_keyCache_DB get "SomeTestVariable")#2;
    private _expiryUpdated = (_expiry > serverTime + 200) && (_expiry < serverTime + 400);

    private _passedTest = _value == "SomeAnswerVariable" && _expiryUpdated;
    if (_passedTest) then {
        [_reporterContext, "Lookup Unexpired<br/>Test Passed"] call _fnc_reporter;
    } else {
        [_reporterContext, "Lookup Unexpired<br/>Test Failed"] call _fnc_reporter;
    };

    //// Clean Up
    call compileScript [A3A_keyCache_unitTest_directoryPath+"unitTestUtility_revertInit.sqf"];
    Dev_unitTestInProgress = nil;
};
"Unit Test Started";
