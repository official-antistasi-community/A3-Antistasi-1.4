// Disables startGarbageCollectors.
//#define __keyCache_unitTestMode
// Directory path of test files from mission root.
#define __keyCache_testDirectoryPath "functions\Utility\KeyCache\Tests\"

// Default Time to live for translations.
#define __keyCache_defaultTTL 120

// Store and access varaibles in localNamespace. Minor lookup overhead is added.
#define __keyCache_security_publicVariableOverwriteMitigation
#ifdef __keyCache_security_publicVariableOverwriteMitigation
    #define __keyCache_setVar(Var, Value) localNamespace setVariable [#Var, Value];
    #define __keyCache_getVar(Var) (localNamespace getVariable #Var)
#else
    #define __keyCache_setVar(Var, Value) Var = Value;
    #define __keyCache_getVar(Var) Var
#endif


#define __reflect(Character) Character
#define __sharp __reflect(#)
#define __fixLineNumbers __sharp##line __LINE__ __FILE__

// Logging
#include "..\..\..\Includes\common.inc"
#define __log_error(Message) ServerError(Message)
#define __log_info(Message) ServerInfo(Message)
#define __hint_info(Title, Body) [Title, Body] call A3A_fnc_customHint;
