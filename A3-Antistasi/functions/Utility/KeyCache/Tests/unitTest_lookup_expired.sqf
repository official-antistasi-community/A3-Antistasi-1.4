// call compileScript ["functions\Utility\KeyCache\Tests\unitTest_lookup_expired.sqf"];

#include "..\config.hpp"
__fixLineNumbers

private _fnc_reporter = compileScript [__keyCache_testDirectoryPath+"testReporter.sqf"];
private _reporterContext = createHashmapFromArray [["_componentName","Lookup-Expired"]];

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
    _keyCache_DB set ["SomeTestVariable",["SomeAnswerVariable",100,serverTime,nil]];
    [_reporterContext, "Lookup Expired<br/>Test Started"] call _fnc_reporter;

    //// Assert
    private _value = "SomeTestVariable" call A3A_fnc_keyCache_lookup;
    private _passedTest = _value == "SomeTestVariable";
    if (_passedTest) then {
        [_reporterContext, "Lookup Expired<br/>Test Passed"] call _fnc_reporter;
    } else {
        [_reporterContext, "Lookup Expired<br/>Test Failed"] call _fnc_reporter;
    };

    //// Clean Up
    call compileScript [__keyCache_testDirectoryPath+"unitTestUtility_revertInit.sqf"];
    Dev_unitTestInProgress = nil;
};
"Unit Test Started";
