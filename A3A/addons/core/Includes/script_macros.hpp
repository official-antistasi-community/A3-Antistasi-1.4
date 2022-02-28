#include "script_macros_common.hpp"

#undef VARDEF
#define VARDEF(Var, Def) (if (isNil #Var) then {Def} else {Var})
