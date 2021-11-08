
// Disables startGarbageCollectors.
//#define __keyCache_unitTestMode

// Store and access varaibles in localNamespace. Minor lookup overhead is added.
#define __keyCache_security_publicVariableInjection


#ifdef __keyCache_security_publicVariableInjection
    #define __keyCache_setVar(Var, Value) localNamespace setVariable [#Var, Value];
    #define __keyCache_getVar(Var) (localNamespace getVariable #Var)
#else
    #define __keyCache_setVar(Var, Value) Var = Value;
    #define __keyCache_getVar(Var) Var
#endif
