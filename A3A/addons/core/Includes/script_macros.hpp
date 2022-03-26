#include "script_macros_common.hpp"

#undef QFUNC
#undef QEFUNC
#define QFUNC(fncName) QUOTE(DFUNC(fncName))
#define QEFUNC(comp,fncName) QUOTE(DEFUNC(comp,fncName))

#undef PREP
#undef PREPSUB
#define PREP(fncName) DFUNC(fncName) = compile preprocessFileLineNumbers QPATHTOF(functions\DOUBLES(fn,fncName).sqf)
#define PREPSUB(folder,fncName) DFUNC(fncName) = compile preprocessFileLineNumbers QPATHTOF(folder\DOUBLES(fn,fncName).sqf)

#undef VARDEF
#define VARDEF(Var, Def) (if (isNil #Var) then {Def} else {Var})
