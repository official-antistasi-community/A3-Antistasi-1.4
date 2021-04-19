//includes commonly included files to clean up includes in other files
//Line number fix
#define FIX_LINE_NUMBERS2(sharp) sharp##line __LINE__ __FILE__
#define FIX_LINE_NUMBERS() FIX_LINE_NUMBERS2(#)

//callstack
#define currentScript if (isNil "_fnc_scriptName") then {__FILE__ select [count __FILE__ - (reverse __FILE__ find '\'), 1e6]} else {_fnc_scriptName}
#define dumpCallStackMSG(MSG) reverse __CALLSTACK__; diag_log text ( (systemTimeUTC call A3A_fnc_systemTime_format_S) + " | Antistasi | Callstack: " + MSG + endl + (__CALLSTACK__ apply {"    " + _x} joinString endl) ); reverse __CALLSTACK__;
#define dumpCallStack() dumpCallStackMSG("")
private __CALLSTACK__ = if (isNil "__CALLSTACK__") then { [currentScript] } else { __CALLSTACK__ + [currentScript] };

//includes
#include "LogMacros.inc"
