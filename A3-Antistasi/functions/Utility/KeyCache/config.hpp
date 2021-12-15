
// Disables startGarbageCollectors.
#define __keyCache_unitTestMode

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
