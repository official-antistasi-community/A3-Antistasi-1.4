#include "script_macros_common.hpp"

#undef QFUNC
#undef QEFUNC
#define QFUNC(fncName) QOUTE(DFUNC(fncName))
#define QEFUNC(comp,fncName) QOUTE(DEFUNC(comp,fncName))

#undef PREP
#define PREP(fncName) DFUNC(fncName) = compile preprocessFileLineNumbers QPATHTOF(functions\DOUBLES(fn,fncName).sqf)
#define PREPSUB(folder,fncName) DFUNC(fncName) = compile preprocessFileLineNumbers QPATHTOF(folder\DOUBLES(fn,fncName).sqf)

#define VARDEF(Var, Def) (if (isNil #Var) then {Def} else {Var})
