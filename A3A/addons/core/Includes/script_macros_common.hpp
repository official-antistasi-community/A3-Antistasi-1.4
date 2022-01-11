/*
    Header: script_macros_common.hpp

    Description:
        A general set of useful macro functions for use by CBA itself or by any module that uses CBA.

    Authors:
        Sickboy <sb_at_dev-heaven.net> and Spooner
*/

/* ****************************************************
 New - Should be exported to general addon
 Aim:
   - Simplify (shorten) the amount of characters required for repetitive tasks
   - Provide a solid structure that can be dynamic and easy editable (Which sometimes means we cannot adhere to Aim #1 ;-)
     An example is the path that is built from defines. Some available in this file, others in mods and addons.

 Follows  Standard:
   Object variables: PREFIX_COMPONENT
   Main-object variables: PREFIX_main
   Paths: MAINPREFIX\PREFIX\SUBPREFIX\COMPONENT\SCRIPTNAME.sqf
   e.g: x\six\addons\sys_menu\fDate.sqf

 Usage:
   define PREFIX and COMPONENT, then include this file
   (Note, you could have a main addon for your mod, define the PREFIX in a macros.hpp,
   and include this script_macros_common.hpp file.
   Then in your addons, add a component.hpp, define the COMPONENT,
   and include your mod's script_macros.hpp
   In your scripts you can then include the addon's component.hpp with relative path)

 TODO:
   - Try only to use 1 string type " vs '
   - Evaluate double functions, and simplification
   - Evaluate naming scheme; current = prototype
   - Evaluate "Debug" features..
   - Evaluate "create mini function per precompiled script, that will load the script on first usage, rather than on init"
   - Also saw "Namespace" typeName, evaluate which we need :P
   - Single/Multi player gamelogics? (Incase of MP, you would want only 1 gamelogic per component, which is pv'ed from server, etc)
 */

#ifndef MAINPREFIX
    #define MAINPREFIX x
#endif

#ifndef SUBPREFIX
    #define SUBPREFIX addons
#endif

#ifndef MAINLOGIC
    #define MAINLOGIC main
#endif

#ifndef VERSION
    #define VERSION 0
#endif

#ifndef VERSION_AR
    #define VERSION_AR VERSION
#endif

#ifndef VERSION_CONFIG
    #define VERSION_CONFIG version = VERSION; versionStr = QUOTE(VERSION); versionAr[] = {VERSION_AR}
#endif

#define ADDON DOUBLES(PREFIX,COMPONENT)
#define MAIN_ADDON DOUBLES(PREFIX,main)

/* -------------------------------------------
Macro: RETDEF()
    If a variable is undefined, return the default value. Otherwise, return the
    variable itself.

Parameters:
    VARIABLE - the variable to check
    DEFAULT_VALUE - the default value to use if variable is undefined

Example:
    (begin example)
        // _var is undefined
        hintSilent format ["_var=%1", RETDEF(_var,5)]; // "_var=5"
        _var = 7;
        hintSilent format ["_var=%1", RETDEF(_var,5)]; // "_var=7"
    (end example)
Author:
    654wak654
------------------------------------------- */
#define RETDEF(VARIABLE,DEFAULT_VALUE) (if (isNil {VARIABLE}) then [{DEFAULT_VALUE}, {VARIABLE}])

/* -------------------------------------------
Macro: RETNIL()
    If a variable is undefined, return the value nil. Otherwise, return the
    variable itself.

Parameters:
    VARIABLE - the variable to check

Example:
    (begin example)
        // _var is undefined
        hintSilent format ["_var=%1", RETNIL(_var)]; // "_var=any"
    (end example)

Author:
    Alef (see CBA issue #8514)
------------------------------------------- */
#define RETNIL(VARIABLE) RETDEF(VARIABLE,nil)

/* -------------------------------------------
Group: General
------------------------------------------- */

// *************************************
// Internal Functions
#define DOUBLES(var1,var2) ##var1##_##var2
#define TRIPLES(var1,var2,var3) ##var1##_##var2##_##var3
#define QDOUBLES(var1,var2) QUOTE(DOUBLES(var1,var2))
#define QTRIPLES(var1,var2,var3) QUOTE(TRIPLES(var1,var2,var3))
#define QUOTE(var1) #var1

#ifdef MODULAR
    #define COMPONENT_T DOUBLES(t,COMPONENT)
    #define COMPONENT_M DOUBLES(m,COMPONENT)
    #define COMPONENT_S DOUBLES(s,COMPONENT)
    #define COMPONENT_C DOUBLES(c,COMPONENT)
    #define COMPONENT_F COMPONENT_C
#else
    #define COMPONENT_T COMPONENT
    #define COMPONENT_M COMPONENT
    #define COMPONENT_S COMPONENT
    #define COMPONENT_F COMPONENT
    #define COMPONENT_C COMPONENT
#endif

/* -------------------------------------------
Macro: ISNILS()

Description:
    Sets a variable with a value, but only if it is undefined.

Parameters:
    VARIABLE - Variable to set [Any, not nil]
    DEFAULT_VALUE - Value to set VARIABLE to if it is undefined [Any, not nil]

Examples:
    (begin example)
        // _fish is undefined
        ISNILS(_fish,0);
        // _fish => 0
    (end)
    (begin example)
        _fish = 12;
        // ...later...
        ISNILS(_fish,0);
        // _fish => 12
    (end)

Author:
    Sickboy
------------------------------------------- */
#define ISNILS(VARIABLE,DEFAULT_VALUE) if (isNil #VARIABLE) then { ##VARIABLE = ##DEFAULT_VALUE }
#define ISNILS2(var1,var2,var3,var4) ISNILS(TRIPLES(var1,var2,var3),var4)
#define ISNILS3(var1,var2,var3) ISNILS(DOUBLES(var1,var2),var3)
#define ISNIL(var1,var2) ISNILS2(PREFIX,COMPONENT,var1,var2)
#define ISNILMAIN(var1,var2) ISNILS3(PREFIX,var1,var2)

#define CREATELOGICS(var1,var2) ##var1##_##var2## = ([sideLogic] call CBA_fnc_getSharedGroup) createUnit ["LOGIC", [0, 0, 0], [], 0, "NONE"]
#define CREATELOGICLOCALS(var1,var2) ##var1##_##var2## = "LOGIC" createVehicleLocal [0, 0, 0]
#define CREATELOGICGLOBALS(var1,var2) ##var1##_##var2## = ([sideLogic] call CBA_fnc_getSharedGroup) createUnit ["LOGIC", [0, 0, 0], [], 0, "NONE"]; publicVariable QUOTE(DOUBLES(var1,var2))
#define CREATELOGICGLOBALTESTS(var1,var2) ##var1##_##var2## = ([sideLogic] call CBA_fnc_getSharedGroup) createUnit [QUOTE(DOUBLES(ADDON,logic)), [0, 0, 0], [], 0, "NONE"]

#define GETVARS(var1,var2,var3) (##var1##_##var2 getVariable #var3)
#define GETVARMAINS(var1,var2) GETVARS(var1,MAINLOGIC,var2)

#ifndef PATHTO_SYS
    #define PATHTO_SYS(var1,var2,var3) \MAINPREFIX\##var1\SUBPREFIX\##var2\##var3.sqf
#endif
#ifndef PATHTOF_SYS
    #define PATHTOF_SYS(var1,var2,var3) \MAINPREFIX\##var1\SUBPREFIX\##var2\##var3
#endif

#ifndef PATHTOF2_SYS
    #define PATHTOF2_SYS(var1,var2,var3) MAINPREFIX\##var1\SUBPREFIX\##var2\##var3
#endif

#define PATHTO_R(var1) PATHTOF2_SYS(PREFIX,COMPONENT_C,var1)
#define PATHTO_T(var1) PATHTOF_SYS(PREFIX,COMPONENT_T,var1)
#define PATHTO_M(var1) PATHTOF_SYS(PREFIX,COMPONENT_M,var1)
#define PATHTO_S(var1) PATHTOF_SYS(PREFIX,COMPONENT_S,var1)
#define PATHTO_C(var1) PATHTOF_SYS(PREFIX,COMPONENT_C,var1)
#define PATHTO_F(var1) PATHTO_SYS(PREFIX,COMPONENT_F,var1)

// Already quoted ""
#define QPATHTO_R(var1) QUOTE(PATHTO_R(var1))
#define QPATHTO_T(var1) QUOTE(PATHTO_T(var1))
#define QPATHTO_M(var1) QUOTE(PATHTO_M(var1))
#define QPATHTO_S(var1) QUOTE(PATHTO_S(var1))
#define QPATHTO_C(var1) QUOTE(PATHTO_C(var1))
#define QPATHTO_F(var1) QUOTE(PATHTO_F(var1))

// This only works for binarized configs after recompiling the pbos
// TODO: Reduce amount of calls / code..
#define COMPILE_FILE2_CFG_SYS(var1) compile preprocessFileLineNumbers var1
#define COMPILE_FILE2_SYS(var1) COMPILE_FILE2_CFG_SYS(var1)

#define COMPILE_FILE_SYS(var1,var2,var3) COMPILE_FILE2_SYS('PATHTO_SYS(var1,var2,var3)')
#define COMPILE_FILE_CFG_SYS(var1,var2,var3) COMPILE_FILE2_CFG_SYS('PATHTO_SYS(var1,var2,var3)')

#define SETVARS(var1,var2) ##var1##_##var2 setVariable
#define SETVARMAINS(var1) SETVARS(var1,MAINLOGIC)
#define GVARMAINS(var1,var2) ##var1##_##var2##
#define CFGSETTINGSS(var1,var2) configFile >> "CfgSettings" >> #var1 >> #var2
//#define SETGVARS(var1,var2,var3) ##var1##_##var2##_##var3 =
//#define SETGVARMAINS(var1,var2) ##var1##_##var2 =

// Compile-Once, JIT: On first use.
// #define PREPMAIN_SYS(var1,var2,var3) ##var1##_fnc_##var3 = { ##var1##_fnc_##var3 = COMPILE_FILE_SYS(var1,var2,DOUBLES(fnc,var3)); if (isNil "_this") then { call ##var1##_fnc_##var3 } else { _this call ##var1##_fnc_##var3 } }
// #define PREP_SYS(var1,var2,var3) ##var1##_##var2##_fnc_##var3 = { ##var1##_##var2##_fnc_##var3 = COMPILE_FILE_SYS(var1,var2,DOUBLES(fnc,var3)); if (isNil "_this") then { call ##var1##_##var2##_fnc_##var3 } else { _this call ##var1##_##var2##_fnc_##var3 } }
// #define PREP_SYS2(var1,var2,var3,var4) ##var1##_##var2##_fnc_##var4 = { ##var1##_##var2##_fnc_##var4 = COMPILE_FILE_SYS(var1,var3,DOUBLES(fnc,var4)); if (isNil "_this") then { call ##var1##_##var2##_fnc_##var4 } else { _this call ##var1##_##var2##_fnc_##var4 } }

// Compile-Once, at Macro. As opposed to Compile-Once, on first use.
#define PREPMAIN_SYS(var1,var2,var3) ##var1##_fnc_##var3 = COMPILE_FILE_SYS(var1,var2,DOUBLES(fnc,var3))
#define PREP_SYS(var1,var2,var3) ##var1##_##var2##_fnc_##var3 = COMPILE_FILE_SYS(var1,var2,DOUBLES(fnc,var3))
#define PREP_SYS2(var1,var2,var3,var4) ##var1##_##var2##_fnc_##var4 = COMPILE_FILE_SYS(var1,var3,DOUBLES(fnc,var4))

#ifndef DEBUG_SETTINGS
    #define DEBUG_SETTINGS [false, true, false]
#endif

#define MSG_INIT QUOTE(Initializing: ADDON version: VERSION)

// *************************************
// User Functions
#define CFGSETTINGS CFGSETTINGSS(PREFIX,COMPONENT)
#define PATHTO(var1) PATHTO_SYS(PREFIX,COMPONENT_F,var1)
#define PATHTOF(var1) PATHTOF_SYS(PREFIX,COMPONENT,var1)
#define PATHTOEF(var1,var2) PATHTOF_SYS(PREFIX,var1,var2)
#define QPATHTOF(var1) QUOTE(PATHTOF(var1))
#define QPATHTOEF(var1,var2) QUOTE(PATHTOEF(var1,var2))

#define COMPILE_FILE(var1) COMPILE_FILE_SYS(PREFIX,COMPONENT_F,var1)
#define COMPILE_FILE_CFG(var1) COMPILE_FILE_CFG_SYS(PREFIX,COMPONENT_F,var1)
#define COMPILE_FILE2(var1) COMPILE_FILE2_SYS('var1')
#define COMPILE_FILE2_CFG(var1) COMPILE_FILE2_CFG_SYS('var1')


#define VERSIONING_SYS(var1) class CfgSettings \
{ \
    class CBA \
    { \
        class Versioning \
        { \
            class var1 \
            { \
            }; \
        }; \
    }; \
};

#define VERSIONING VERSIONING_SYS(PREFIX)

/* -------------------------------------------
Macro: GVAR()
    Get full variable identifier for a global variable owned by this component.

Parameters:
    VARIABLE - Partial name of global variable owned by this component [Any].

Example:
    (begin example)
        GVAR(frog) = 12;
        // In SPON_FrogDancing component, equivalent to SPON_FrogDancing_frog = 12
    (end)

Author:
    Sickboy
------------------------------------------- */
#define GVAR(var1) DOUBLES(ADDON,var1)
#define EGVAR(var1,var2) TRIPLES(PREFIX,var1,var2)
#define QGVAR(var1) QUOTE(GVAR(var1))
#define QEGVAR(var1,var2) QUOTE(EGVAR(var1,var2))
#define QQGVAR(var1) QUOTE(QGVAR(var1))
#define QQEGVAR(var1,var2) QUOTE(QEGVAR(var1,var2))

/* -------------------------------------------
Macro: GVARMAIN()
    Get full variable identifier for a global variable owned by this addon.

Parameters:
    VARIABLE - Partial name of global variable owned by this addon [Any].

Example:
    (begin example)
        GVARMAIN(frog) = 12;
        // In SPON_FrogDancing component, equivalent to SPON_frog = 12
    (end)

Author:
    Sickboy
------------------------------------------- */
#define GVARMAIN(var1) GVARMAINS(PREFIX,var1)
#define QGVARMAIN(var1) QUOTE(GVARMAIN(var1))
#define QQGVARMAIN(var1) QUOTE(QGVARMAIN(var1))
// TODO: What's this?
#define SETTINGS DOUBLES(PREFIX,settings)
#define CREATELOGIC CREATELOGICS(PREFIX,COMPONENT)
#define CREATELOGICGLOBAL CREATELOGICGLOBALS(PREFIX,COMPONENT)
#define CREATELOGICGLOBALTEST CREATELOGICGLOBALTESTS(PREFIX,COMPONENT)
#define CREATELOGICLOCAL CREATELOGICLOCALS(PREFIX,COMPONENT)
#define CREATELOGICMAIN CREATELOGICS(PREFIX,MAINLOGIC)
#define GETVAR(var1) GETVARS(PREFIX,COMPONENT,var1)
#define SETVAR SETVARS(PREFIX,COMPONENT)
#define SETVARMAIN SETVARMAINS(PREFIX)
#define IFCOUNT(var1,var2,var3) if (count ##var1 > ##var2) then { ##var3 = ##var1 select ##var2 };

/* -------------------------------------------
Macro: PREP()

Description:
    Defines a function.

    Full file path:
        '\MAINPREFIX\PREFIX\SUBPREFIX\COMPONENT\fnc_<FNC>.sqf'

    Resulting function name:
        'PREFIX_COMPONENT_<FNC>'

    The PREP macro should be placed in a script run by a XEH preStart and XEH preInit event.

    The PREP macro allows for CBA function caching, which drastically speeds up load times.
    Beware though that function caching is enabled by default and as such to disable it, you need to
    #define DISABLE_COMPILE_CACHE above your #include "script_components.hpp" include!

    The function will be defined in ui and mission namespace. It can not be overwritten without
    a mission restart.

Parameters:
    FUNCTION NAME - Name of the function, unquoted <STRING>

Examples:
    (begin example)
        PREP(banana);
        call FUNC(banana);
    (end)

Author:
    dixon13
 ------------------------------------------- */
//#define PREP(var1) PREP_SYS(PREFIX,COMPONENT_F,var1)

#ifdef DISABLE_COMPILE_CACHE
    #define PREP(var1) TRIPLES(ADDON,fnc,var1) = compile preProcessFileLineNumbers 'PATHTO_SYS(PREFIX,COMPONENT_F,DOUBLES(fnc,var1))'
    #define PREPMAIN(var1) TRIPLES(PREFIX,fnc,var1) = compile preProcessFileLineNumbers 'PATHTO_SYS(PREFIX,COMPONENT_F,DOUBLES(fnc,var1))'
#else
    #define PREP(var1) ['PATHTO_SYS(PREFIX,COMPONENT_F,DOUBLES(fnc,var1))', 'TRIPLES(ADDON,fnc,var1)'] call SLX_XEH_COMPILE_NEW
    #define PREPMAIN(var1) ['PATHTO_SYS(PREFIX,COMPONENT_F,DOUBLES(fnc,var1))', 'TRIPLES(PREFIX,fnc,var1)'] call SLX_XEH_COMPILE_NEW
#endif

/* -------------------------------------------
Macro: PATHTO_FNC()

Description:
    Defines a function inside CfgFunctions.

    Full file path in addons:
        '\MAINPREFIX\PREFIX\SUBPREFIX\COMPONENT\fnc_<FNC>.sqf'
    Define 'RECOMPILE' to enable recompiling.
    Define 'SKIP_FUNCTION_HEADER' to skip adding function header.

Parameters:
    FUNCTION NAME - Name of the function, unquoted <STRING>

Examples:
    (begin example)
        // file name: fnc_addPerFrameHandler.sqf
        class CfgFunctions {
            class CBA {
                class Misc {
                    PATHTO_FNC(addPerFrameHandler);
                };
            };
        };
        // -> CBA_fnc_addPerFrameHandler
    (end)

Author:
    dixon13, commy2
 ------------------------------------------- */
#ifdef RECOMPILE
    #undef RECOMPILE
    #define RECOMPILE recompile = 1
#else
    #define RECOMPILE recompile = 0
#endif
// Set function header type: -1 - no header; 0 - default header; 1 - system header.
#ifdef SKIP_FUNCTION_HEADER
    #define CFGFUNCTION_HEADER headerType = -1
#else
    #define CFGFUNCTION_HEADER headerType = 0
#endif

#define PATHTO_FNC(func) class func {\
    file = QPATHTOF(DOUBLES(fnc,func).sqf);\
    CFGFUNCTION_HEADER;\
    RECOMPILE;\
}
#define DFUNC(func) class func {\
    RECOMPILE;\
};
#define DFUNCP(func, properties) class func {\
    RECOMPILE;\
    properties\
};

#define FUNC(var1) TRIPLES(ADDON,fnc,var1)
#define FUNCMAIN(var1) TRIPLES(PREFIX,fnc,var1)
#define FUNC_INNER(var1,var2) TRIPLES(DOUBLES(PREFIX,var1),fnc,var2)
#define EFUNC(var1,var2) FUNC_INNER(var1,var2)
#define QFUNC(var1) QUOTE(FUNC(var1))
#define QFUNCMAIN(var1) QUOTE(FUNCMAIN(var1))
#define QFUNC_INNER(var1,var2) QUOTE(FUNC_INNER(var1,var2))
#define QEFUNC(var1,var2) QUOTE(EFUNC(var1,var2))
#define QQFUNC(var1) QUOTE(QFUNC(var1))
#define QQFUNCMAIN(var1) QUOTE(QFUNCMAIN(var1))
#define QQFUNC_INNER(var1,var2) QUOTE(QFUNC_INNER(var1,var2))
#define QQEFUNC(var1,var2) QUOTE(QEFUNC(var1,var2))

#ifndef PRELOAD_ADDONS
    #define PRELOAD_ADDONS class CfgAddons \
{ \
    class PreloadAddons \
    { \
        class ADDON \
        { \
            list[]={ QUOTE(ADDON) }; \
        }; \
    }; \
}
#endif

/* -------------------------------------------
Macros: ARG_#()
    Select from list of array arguments

Parameters:
    VARIABLE(1-8) - elements for the list

Author:
    Rommel
------------------------------------------- */
#define ARG_1(A,B) ((A) select (B))
#define ARG_2(A,B,C) (ARG_1(ARG_1(A,B),C))
#define ARG_3(A,B,C,D) (ARG_1(ARG_2(A,B,C),D))
#define ARG_4(A,B,C,D,E) (ARG_1(ARG_3(A,B,C,D),E))
#define ARG_5(A,B,C,D,E,F) (ARG_1(ARG_4(A,B,C,D,E),F))
#define ARG_6(A,B,C,D,E,F,G) (ARG_1(ARG_5(A,B,C,D,E,F),G))
#define ARG_7(A,B,C,D,E,F,G,H) (ARG_1(ARG_6(A,B,C,D,E,E,F,G),H))
#define ARG_8(A,B,C,D,E,F,G,H,I) (ARG_1(ARG_7(A,B,C,D,E,E,F,G,H),I))

/* -------------------------------------------
Macros: ARR_#()
    Create list from arguments. Useful for working around , in macro parameters.
    1-8 arguments possible.

Parameters:
    VARIABLE(1-8) - elements for the list

Author:
    Nou
------------------------------------------- */
#define ARR_1(ARG1) ARG1
#define ARR_2(ARG1,ARG2) ARG1, ARG2
#define ARR_3(ARG1,ARG2,ARG3) ARG1, ARG2, ARG3
#define ARR_4(ARG1,ARG2,ARG3,ARG4) ARG1, ARG2, ARG3, ARG4
#define ARR_5(ARG1,ARG2,ARG3,ARG4,ARG5) ARG1, ARG2, ARG3, ARG4, ARG5
#define ARR_6(ARG1,ARG2,ARG3,ARG4,ARG5,ARG6) ARG1, ARG2, ARG3, ARG4, ARG5, ARG6
#define ARR_7(ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7) ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7
#define ARR_8(ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7,ARG8) ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7, ARG8

/* -------------------------------------------
Macros: FORMAT_#(STR, ARG1)
    Format - Useful for working around , in macro parameters.
    1-8 arguments possible.

Parameters:
    STRING - string used by format
    VARIABLE(1-8) - elements for usage in format

Author:
    Nou & Sickboy
------------------------------------------- */
#define FORMAT_1(STR,ARG1) format[STR, ARG1]
#define FORMAT_2(STR,ARG1,ARG2) format[STR, ARG1, ARG2]
#define FORMAT_3(STR,ARG1,ARG2,ARG3) format[STR, ARG1, ARG2, ARG3]
#define FORMAT_4(STR,ARG1,ARG2,ARG3,ARG4) format[STR, ARG1, ARG2, ARG3, ARG4]
#define FORMAT_5(STR,ARG1,ARG2,ARG3,ARG4,ARG5) format[STR, ARG1, ARG2, ARG3, ARG4, ARG5]
#define FORMAT_6(STR,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6) format[STR, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6]
#define FORMAT_7(STR,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7) format[STR, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7]
#define FORMAT_8(STR,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7,ARG8) format[STR, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7, ARG8]

// CONTROL(46) 12
#define DISPLAY(A) (findDisplay A)
#define CONTROL(A) DISPLAY(A) displayCtrl

/* -------------------------------------------
Macros: IS_x()
    Checking the data types of variables.

    IS_ARRAY() - Array
    IS_BOOL() - Boolean
    IS_BOOLEAN() - UI display handle(synonym for <IS_BOOL()>)
    IS_CODE() - Code block (i.e a compiled function)
    IS_CONFIG() - Configuration
    IS_CONTROL() - UI control handle.
    IS_DISPLAY() - UI display handle.
    IS_FUNCTION() - A compiled function (synonym for <IS_CODE()>)
    IS_GROUP() - Group.
    IS_INTEGER() - Is a number a whole number?
    IS_LOCATION() - World location.
    IS_NUMBER() - A floating point number (synonym for <IS_SCALAR()>)
    IS_OBJECT() - World object.
    IS_SCALAR() - Floating point number.
    IS_SCRIPT() - A script handle (as returned by execVM and spawn commands).
    IS_SIDE() - Game side.
    IS_STRING() - World object.
    IS_TEXT() - Structured text.

Parameters:
    VARIABLE - Variable to check if it is of a particular type [Any, not nil]

Author:
    Spooner
------------------------------------------- */
#define IS_META_SYS(VAR,TYPE) (if (isNil {VAR}) then {false} else {(VAR) isEqualType TYPE})
#define IS_ARRAY(VAR)    IS_META_SYS(VAR,[])
#define IS_BOOL(VAR)     IS_META_SYS(VAR,false)
#define IS_CODE(VAR)     IS_META_SYS(VAR,{})
#define IS_CONFIG(VAR)   IS_META_SYS(VAR,configNull)
#define IS_CONTROL(VAR)  IS_META_SYS(VAR,controlNull)
#define IS_DISPLAY(VAR)  IS_META_SYS(VAR,displayNull)
#define IS_GROUP(VAR)    IS_META_SYS(VAR,grpNull)
#define IS_OBJECT(VAR)   IS_META_SYS(VAR,objNull)
#define IS_SCALAR(VAR)   IS_META_SYS(VAR,0)
#define IS_SCRIPT(VAR)   IS_META_SYS(VAR,scriptNull)
#define IS_SIDE(VAR)     IS_META_SYS(VAR,west)
#define IS_STRING(VAR)   IS_META_SYS(VAR,"STRING")
#define IS_TEXT(VAR)     IS_META_SYS(VAR,text "")
#define IS_LOCATION(VAR) IS_META_SYS(VAR,locationNull)

#define IS_BOOLEAN(VAR)  IS_BOOL(VAR)
#define IS_FUNCTION(VAR) IS_CODE(VAR)
#define IS_INTEGER(VAR)  (if (IS_SCALAR(VAR)) then {floor (VAR) == (VAR)} else {false})
#define IS_NUMBER(VAR)   IS_SCALAR(VAR)

#define FLOAT_TO_STRING(num)    (if (_this == 0) then {"0"} else {str parseNumber (str (_this % _this) + str floor abs _this) + "." + (str (abs _this - floor abs _this) select [2]) + "0"})

/* -------------------------------------------
Macro: SCRIPT()
    Sets name of script (relies on PREFIX and COMPONENT values being #defined).
    Define 'SKIP_SCRIPT_NAME' to skip adding scriptName.

Parameters:
    NAME - Name of script [Indentifier]

Example:
    (begin example)
        SCRIPT(eradicateMuppets);
    (end)

Author:
    Spooner
------------------------------------------- */
#ifndef SKIP_SCRIPT_NAME
    #define SCRIPT(NAME) scriptName 'PREFIX\COMPONENT\NAME'
#else
    #define SCRIPT(NAME) /* nope */
#endif

/* -------------------------------------------
Macro: xSTRING()
    Get full string identifier from a stringtable owned by this component.

Parameters:
    VARIABLE - Partial name of global variable owned by this component [Any].

Example:
    ADDON is CBA_Balls.
    (begin example)
        // Localized String (localize command must still be used with it)
        LSTRING(Example); // STR_CBA_Balls_Example;
        // Config String (note the $)
        CSTRING(Example); // $STR_CBA_Balls_Example;
    (end)

Author:
    Jonpas
------------------------------------------- */
#ifndef STRING_MACROS_GUARD
#define STRING_MACROS_GUARD
    #define LSTRING(var1) QUOTE(TRIPLES(STR,ADDON,var1))
    #define ELSTRING(var1,var2) QUOTE(TRIPLES(STR,DOUBLES(PREFIX,var1),var2))
    #define CSTRING(var1) QUOTE(TRIPLES($STR,ADDON,var1))
    #define ECSTRING(var1,var2) QUOTE(TRIPLES($STR,DOUBLES(PREFIX,var1),var2))

    #define LLSTRING(var1) localize QUOTE(TRIPLES(STR,ADDON,var1))
    #define LELSTRING(var1,var2) localize QUOTE(TRIPLES(STR,DOUBLES(PREFIX,var1),var2))
#endif


/* -------------------------------------------
Macro: KEY_PARAM()
    Get value from key in _this list, return default when key is not included in list.

Parameters:
    KEY - Key name [String]
    NAME - Name of the variable to set [Identifier]
    DEF_VALUE - Default value to use in case key not found [ANY]

Example:


Author:
    Muzzleflash
------------------------------------------- */
#define KEY_PARAM(KEY,NAME,DEF_VALUE) \
    private #NAME; \
    NAME = [toLower KEY, toUpper KEY, DEF_VALUE, RETNIL(_this)] call CBA_fnc_getArg; \
    TRACE_3("KEY_PARAM",KEY,NAME,DEF_VALUE)

/* -------------------------------------------
Group: Assertions
------------------------------------------- */

#define ASSERTION_ERROR(MESSAGE) ERROR_WITH_TITLE("Assertion failed!",MESSAGE)

/* -------------------------------------------
Macro: ASSERT_TRUE()
    Asserts that a CONDITION is true. When an assertion fails, an error is raised with the given MESSAGE.

Parameters:
    CONDITION - Condition to assert as true [Boolean]
    MESSSAGE - Message to display if (A OPERATOR B) is false [String]

Example:
    (begin example)
        ASSERT_TRUE(_frogIsDead,"The frog is alive");
    (end)

Author:
    Spooner
------------------------------------------- */
#define ASSERT_TRUE(CONDITION,MESSAGE) \
    if (not (CONDITION)) then \
    { \
        ASSERTION_ERROR('Assertion (CONDITION) failed!\n\n' + (MESSAGE)); \
    }

/* -------------------------------------------
Macro: ASSERT_FALSE()
    Asserts that a CONDITION is false. When an assertion fails, an error is raised with the given MESSAGE.

Parameters:
    CONDITION - Condition to assert as false [Boolean]
    MESSSAGE - Message to display if (A OPERATOR B) is true [String]

Example:
    (begin example)
        ASSERT_FALSE(_frogIsDead,"The frog died");
    (end)

Author:
    Spooner
------------------------------------------- */
#define ASSERT_FALSE(CONDITION,MESSAGE) \
    if (CONDITION) then \
    { \
        ASSERTION_ERROR('Assertion (not (CONDITION)) failed!\n\n' + (MESSAGE)) \
    }

/* -------------------------------------------
Macro: ASSERT_OP()
    Asserts that (A OPERATOR B) is true. When an assertion fails, an error is raised with the given MESSAGE.

Parameters:
    A - First value [Any]
    OPERATOR - Binary operator to use [Operator]
    B - Second value [Any]
    MESSSAGE - Message to display if (A OPERATOR B)  is false. [String]

Example:
    (begin example)
        ASSERT_OP(_fish,>,5,"Too few fish!");
    (end)

Author:
    Spooner
------------------------------------------- */
#define ASSERT_OP(A,OPERATOR,B,MESSAGE) \
    if (not ((A) OPERATOR (B))) then \
    { \
        ASSERTION_ERROR('Assertion (A OPERATOR B) failed!\n' + 'A: ' + (str (A)) + '\n' + 'B: ' + (str (B)) + "\n\n" + (MESSAGE)); \
    }

/* -------------------------------------------
Macro: ASSERT_DEFINED()
    Asserts that a VARIABLE is defined. When an assertion fails, an error is raised with the given MESSAGE..

Parameters:
    VARIABLE - Variable to test if defined [String or Function].
    MESSAGE - Message to display if variable is undefined [String].

Examples:
    (begin example)
        ASSERT_DEFINED("_anUndefinedVar","Too few fish!");
        ASSERT_DEFINED({ obj getVariable "anUndefinedVar" },"Too many fish!");
    (end)

Author:
    Spooner
------------------------------------------- */
#define ASSERT_DEFINED(VARIABLE,MESSAGE) \
    if (isNil VARIABLE) then \
    { \
        ASSERTION_ERROR('Assertion (VARIABLE is defined) failed!\n\n' + (MESSAGE)); \
    }

/* -------------------------------------------
Group: Unit tests
------------------------------------------- */
#define TEST_SUCCESS(MESSAGE) MESSAGE_WITH_TITLE("Test OK",MESSAGE)
#define TEST_FAIL(MESSAGE) ERROR_WITH_TITLE("Test FAIL",MESSAGE)

/* -------------------------------------------
Macro: TEST_TRUE()
    Tests that a CONDITION is true.
    If the condition is not true, an error is raised with the given MESSAGE.

Parameters:
    CONDITION - Condition to assert as true [Boolean]
    MESSSAGE - Message to display if (A OPERATOR B) is false [String]

Example:
    (begin example)
        TEST_TRUE(_frogIsDead,"The frog is alive");
    (end)

Author:
    Killswitch
------------------------------------------- */
#define TEST_TRUE(CONDITION, MESSAGE) \
    if (CONDITION) then \
    { \
        TEST_SUCCESS('(CONDITION)'); \
    } \
    else \
    { \
        TEST_FAIL('(CONDITION) ' + (MESSAGE)); \
    }

/* -------------------------------------------
Macro: TEST_FALSE()
    Tests that a CONDITION is false.
    If the condition is not false, an error is raised with the given MESSAGE.

Parameters:
    CONDITION - Condition to test as false [Boolean]
    MESSSAGE - Message to display if (A OPERATOR B) is true [String]

Example:
    (begin example)
        TEST_FALSE(_frogIsDead,"The frog died");
    (end)

Author:
    Killswitch
------------------------------------------- */
#define TEST_FALSE(CONDITION, MESSAGE) \
    if (not (CONDITION)) then \
    { \
        TEST_SUCCESS('(not (CONDITION))'); \
    } \
    else \
    { \
        TEST_FAIL('(not (CONDITION)) ' + (MESSAGE)); \
    }

/* -------------------------------------------
Macro: TEST_OP()
    Tests that (A OPERATOR B) is true.
    If the test fails, an error is raised with the given MESSAGE.

Parameters:
    A - First value [Any]
    OPERATOR - Binary operator to use [Operator]
    B - Second value [Any]
    MESSSAGE - Message to display if (A OPERATOR B)  is false. [String]

Example:
    (begin example)
        TEST_OP(_fish,>,5,"Too few fish!");
    (end)

Author:
    Killswitch
------------------------------------------- */
#define TEST_OP(A,OPERATOR,B,MESSAGE) \
    if ((A) OPERATOR (B)) then \
    { \
        TEST_SUCCESS('(A OPERATOR B)') \
    } \
    else \
    { \
        TEST_FAIL('(A OPERATOR B)') \
    };

/* -------------------------------------------
Macro: TEST_DEFINED_AND_OP()
    Tests that A and B are defined and (A OPERATOR B) is true.
    If the test fails, an error is raised with the given MESSAGE.

Parameters:
    A - First value [Any]
    OPERATOR - Binary operator to use [Operator]
    B - Second value [Any]
    MESSSAGE - Message to display [String]

Example:
    (begin example)
        TEST_OP(_fish,>,5,"Too few fish!");
    (end)

Author:
    Killswitch, PabstMirror
------------------------------------------- */
#define TEST_DEFINED_AND_OP(A,OPERATOR,B,MESSAGE) \
    if (isNil #A) then { \
        TEST_FAIL('(A is not defined) ' + (MESSAGE)); \
    } else { \
        if (isNil #B) then { \
            TEST_FAIL('(B is not defined) ' + (MESSAGE)); \
        } else { \
            if ((A) OPERATOR (B)) then { \
                TEST_SUCCESS('(A OPERATOR B) ' + (MESSAGE)) \
            } else { \
                TEST_FAIL('(A OPERATOR B) ' + (MESSAGE)) \
    }; }; };


/* -------------------------------------------
Macro: TEST_DEFINED()
    Tests that a VARIABLE is defined.

Parameters:
    VARIABLE - Variable to test if defined [String or Function].
    MESSAGE - Message to display if variable is undefined [String].

Examples:
    (begin example)
        TEST_DEFINED("_anUndefinedVar","Too few fish!");
        TEST_DEFINED({ obj getVariable "anUndefinedVar" },"Too many fish!");
    (end)

Author:
    Killswitch
------------------------------------------- */
#define TEST_DEFINED(VARIABLE,MESSAGE) \
    if (not isNil VARIABLE) then \
    { \
        TEST_SUCCESS('(' + VARIABLE + ' is defined)'); \
    } \
    else \
    { \
        TEST_FAIL('(' + VARIABLE + ' is not defined)' + (MESSAGE)); \
    }

/* -------------------------------------------
Group: Managing Deprecation
------------------------------------------- */

/* -------------------------------------------
Macro: DEPRECATE_SYS()
    Allow deprecation of a function that has been renamed.

    Replaces an old OLD_FUNCTION (which will have PREFIX_ prepended) with a NEW_FUNCTION
    (PREFIX_ prepended) with the intention that the old function will be disabled in the future.

    Shows a warning in RPT each time the deprecated function is used, but runs the new function.

Parameters:
    OLD_FUNCTION - Full name of old function [Identifier for function that does not exist any more]
    NEW_FUNCTION - Full name of new function [Function]

Example:
    (begin example)
        // After renaming CBA_fnc_frog as CBA_fnc_fish
        DEPRECATE_SYS(CBA_fnc_frog,CBA_fnc_fish);
    (end)

Author:
    Sickboy
------------------------------------------- */
#define DEPRECATE_SYS(OLD_FUNCTION,NEW_FUNCTION) \
    OLD_FUNCTION = { \
        WARNING('Deprecated function used: OLD_FUNCTION (new: NEW_FUNCTION) in ADDON'); \
        if (isNil "_this") then { call NEW_FUNCTION } else { _this call NEW_FUNCTION }; \
    }

/* -------------------------------------------
Macro: DEPRECATE()
    Allow deprecation of a function, in the current component, that has been renamed.

    Replaces an OLD_FUNCTION (which will have PREFIX_ prepended) with a NEW_FUNCTION
    (PREFIX_ prepended) with the intention that the old function will be disabled in the future.

    Shows a warning in RPT each time the deprecated function is used, but runs the new function.

Parameters:
    OLD_FUNCTION - Name of old function, assuming PREFIX [Identifier for function that does not exist any more]
    NEW_FUNCTION - Name of new function, assuming PREFIX [Function]

Example:
    (begin example)
        // After renaming CBA_fnc_frog as CBA_fnc_fish
        DEPRECATE(fnc_frog,fnc_fish);
    (end)

Author:
    Sickboy
------------------------------------------- */
#define DEPRECATE(OLD_FUNCTION,NEW_FUNCTION) \
    DEPRECATE_SYS(DOUBLES(PREFIX,OLD_FUNCTION),DOUBLES(PREFIX,NEW_FUNCTION))

/* -------------------------------------------
Macro: OBSOLETE_SYS()
    Replace a function that has become obsolete.

    Replace an obsolete OLD_FUNCTION with a simple COMMAND_FUNCTION, with the intention that anyone
    using the function should replace it with the simple command, since the function will be disabled in the future.

    Shows a warning in RPT each time the deprecated function is used, and runs the command function.

Parameters:
    OLD_FUNCTION - Full name of old function [Identifier for function that does not exist any more]
    COMMAND_CODE - Code to replace the old function [Function]

Example:
    (begin example)
        // In Arma2, currentWeapon command made the CBA_fMyWeapon function obsolete:
        OBSOLETE_SYS(CBA_fMyWeapon,{ currentWeapon player });
    (end)

Author:
    Spooner
------------------------------------------- */
#define OBSOLETE_SYS(OLD_FUNCTION,COMMAND_CODE) \
    OLD_FUNCTION = { \
        WARNING('Obsolete function used: (use: OLD_FUNCTION) in ADDON'); \
        if (isNil "_this") then { call COMMAND_CODE } else { _this call COMMAND_CODE }; \
    }

/* -------------------------------------------
Macro: OBSOLETE()
    Replace a function, in the current component, that has become obsolete.

    Replace an obsolete OLD_FUNCTION (which will have PREFIX_ prepended) with a simple
    COMMAND_CODE, with the intention that anyone using the function should replace it with the simple
    command.

    Shows a warning in RPT each time the deprecated function is used.

Parameters:
    OLD_FUNCTION - Name of old function, assuming PREFIX [Identifier for function that does not exist any more]
    COMMAND_CODE - Code to replace the old function [Function]

Example:
    (begin example)
        // In Arma2, currentWeapon command made the CBA_fMyWeapon function obsolete:
        OBSOLETE(fMyWeapon,{ currentWeapon player });
    (end)

Author:
    Spooner
------------------------------------------- */
#define OBSOLETE(OLD_FUNCTION,COMMAND_CODE) \
    OBSOLETE_SYS(DOUBLES(PREFIX,OLD_FUNCTION),COMMAND_CODE)

/* -------------------------------------------
Macro: IS_ADMIN
    Check if the local machine is an admin in the multiplayer environment.

    Reports 'true' for logged and voted in admins.

Parameters:
    None

Example:
    (begin example)
        // print "true" if player is admin
        systemChat str IS_ADMIN;
    (end)

Author:
    commy2
------------------------------------------- */
#define IS_ADMIN_SYS(x) x##kick
#define IS_ADMIN serverCommandAvailable 'IS_ADMIN_SYS(#)'

/* -------------------------------------------
Macro: IS_ADMIN_LOGGED
    Check if the local machine is a logged in admin in the multiplayer environment.

    Reports 'false' if the player was voted to be the admin.

Parameters:
    None

Example:
    (begin example)
        // print "true" if player is admin and entered in the server password
        systemChat str IS_ADMIN_LOGGED;
    (end)

Author:
    commy2
------------------------------------------- */
#define IS_ADMIN_LOGGED_SYS(x) x##shutdown
#define IS_ADMIN_LOGGED serverCommandAvailable 'IS_ADMIN_LOGGED_SYS(#)'
