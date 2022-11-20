/*
Author: Håkon
Description:
    compiles all functions in configFile >> A3A >> CfgFunctions
    used for debug as it allows live editing, slower than defining them in configFile >> CfgFunctions

    runs preInit funcs that are compiled aswell and defines A3A_postInitFuncs for postInit funcs to be run

Arguments: <string> if "preInit" run preInit funcs

Return Value: <Bool> compiled

Scope: Any
Environment: Any
Public: Yes
Dependencies:

Example: call A3A_fnc_prepFunctions;

License: MIT License
*/
private _callType = param [0, "", [""]];
private _skipPreInit = if (_callType isEqualTo "preInit") then {false} else {true};

//Headers (optimised headers by Killzone_Kid)
private _headerNoDebug = "
    private _fnc_scriptNameParent = if (isNil '_fnc_scriptName') then {'%1'} else {_fnc_scriptName};
    private _fnc_scriptName = '%1';
    scriptName _fnc_scriptName;
";
private _headerSaveScriptMap = "
    private _fnc_scriptMap = if (isNil '_fnc_scriptMap') then {[_fnc_scriptName]} else {_fnc_scriptMap + [_fnc_scriptName]};
";
private _headerLogScriptMap = "
    textLogFormat ['%1 : %2', _fnc_scriptMap joinString ' >> ', _this];
";
private _headerSystem = "
    private _fnc_scriptNameParent = if (isNil '_fnc_scriptName') then {'%1'} else {_fnc_scriptName};
    scriptName '%1';
";

//--- Compose headers based on current debug mode
private _debug = uinamespace getvariable ["bis_fnc_initFunctions_debugMode", 0];
private _headerDefault = switch _debug do {

    //--- 0 - Debug mode off
    default {
        _headerNoDebug
    };

    //--- 1 - Save script map (order of executed functions) to '_fnc_scriptMap' variable
    case 1: {
        _headerNoDebug + _headerSaveScriptMap
    };

    //--- 2 - Save script map and log it
    case 2: {
        _headerNoDebug + _headerSaveScriptMap + _headerLogScriptMap
    };
};

//compile function (credit to BI: Karel Moricky)
_fncCompile = {
    //      Func name,  file,      headerType
    params ["_fncVar", "_fncPath", "_fncHeader"];

    private _header = switch _fncHeader do {

        //--- No header (used in low-level functions, like 'fired' event handlers for every weapon)
        case -1: { "" };

        //--- System functions' header (rewrite default header based on debug mode)
        case 1: { _headerSystem };

        //--- Full header
        default { _headerDefault };
    };

    //--- Extend error report by including name of the function responsible
    private _debugHeaderExtended = format ["%4%1line 1 ""%2 [%3]""%4", "#", _fncPath, _fncVar, toString [13,10]];
    private _debugMessage = "Log: [Functions]%1 | %2";

    compile (format [_header, _fncVar, _debugMessage] + _debugHeaderExtended + preprocessFile _fncPath);

};

private _preInitFuncs = [];
A3A_postInitFuncs = [];
{
    //Tag scope
    private _tag = configName _x;
    if (getText (_x/"tag") isNotEqualTo "") then {_tag = getText (_x/"tag")};
    {
        //Category scope
        private _requiredAddons = getArray (_x/"requiredAddons");
        if (_requiredAddons findIf { !(isClass (configFile/"CfgPatches"/_x)) } > -1) then { continue }; //dependecies missing, skip compilation

        private _path = getText (_x/"file");
        if (_path isEqualTo "") then { _path = "functions\" + configName _x }; //default path resolve, not used in Antistasi as addons root is game dir unlike missions which is mission dir + functions

        {
            //Function scope
            private _funcName = configName _x;
            private _func = _tag + "_fnc_" + _funcName;

            private _ext = if (getText (_x/"ext") isEqualTo "") then {".sqf"} else {getText (_x/"ext")};
            private _file = _path + "\fn_" + _funcName + _ext;
            if (getText (_x/"file") isNotEqualTo "") then { _file = getText (_x/"file") };

            if (getNumber (_x/"preInit") isEqualTo 1) then { _preInitFuncs pushBackUnique _func };
            if (getNumber (_x/"postInit") isEqualTo 1) then { A3A_postInitFuncs pushBackUnique _func };

            //allways recompiles so ignore that attribute
            //preStart dosnt support live edit and would only trigger on game start anyways so no point in support here either

            if (_ext isEqualTo ".fsm") then {
                missionNamespace setVariable [_func, compile format ["%1_fsm = _this execfsm '%2'; %1_fsm",_func,_file]];
                continue;
            };

            missionNamespace setVariable [_func, [_func, _file, getNumber (_x/"headerType")] call _fncCompile];
        } forEach ("true" configClasses _x);

    } forEach ("true" configClasses _x);

} forEach ("true" configClasses (configFile/"A3A"/"CfgFunctions"));

if (_skipPreInit) exitWith { true };
//if !( isClass (missionConfigFile/"A3A") ) exitWith { false }; //dont run code unless we are in a A3A mission

{
    call (missionNamespace getVariable _x);
} forEach _preInitFuncs;

true
