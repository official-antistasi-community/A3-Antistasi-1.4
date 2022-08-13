#include "script_macros_common.hpp"

#undef PREP
#undef PREPSUB
#define PREP(fncName) FUNC(fncName) = compile preprocessFileLineNumbers QPATHTOF(functions\DOUBLES(fn,fncName).sqf)
#define PREPSUB(folder,fncName) FUNC(fncName) = compile preprocessFileLineNumbers QPATHTOF(folder\DOUBLES(fn,fncName).sqf)

#undef VARDEF
#define VARDEF(Var, Def) (if (isNil #Var) then {Def} else {Var})

#define ADDONLOADED(addon) EADDONLOADED(A3A,addon)
#define EADDONLOADED(prefix,addon)(isClass (configFile/QUOTE(CfgPatches)/QDOUBLES(prefix,addon)))
