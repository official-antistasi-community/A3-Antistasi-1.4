/*
private _fnc_reporter = compileScript [__keyCache_testDirectoryPath+"testReporter.sqf"];
private _reporterContext = createHashmapFromArray [["_componentName","My Piece"]];
[_reporterContext,"Hello RPT, my test passed, goodbye."] call _fnc_reporter;
*/

#include "..\config.hpp"
__fixLineNumbers

private _hashmap = createHashmap;
params [
    ["_context",_hashmap,[_hashmap]],
    ["_text","",[""]]
];

private _componentName = _context getOrDefault ["_componentName","General"];
private _componentNameShort = _context getOrDefault ["_componentNameShort",_componentName];

__hint_info("UnitTest KeyCache-"+_componentNameShort, _text);
__log_info("UnitTest, KeyCache "+_componentName+", " + _text);
