/*
    Author: [Håkon]
    Description:
        SQF log macros, includes server log macros.

    ~~~~ General

        Types: Error, Info, Debug, Trace
        To log to the server prefix Server to it.
        Error client logs logs to the server in addition to client

    ~~~~ Logging Arguments

        To log arguments add _n to the end, n being amount of arguments
        maximum arguments: 8

        Syntax:
            {Type}_{N arguments}({Format}, {Arg1}...);
            Server{Type}_{N arguments}({Format}, {Arg1}...);

        Example:
            Info_2("%1 did something with %2", player, _car);
            ServerInfo_2("%1 did something with %2", player, _car);

    ~~~~ Logging Arrays

        To log an array add 'Array' after the type
        you can only one array with array log

        To format the logged array elements add 'Format' after 'Array'

        Syntax:
            {Type}Array({Message}, {Array});
            {Type}ArrayFormat({Message}, {Format}, {Array});

        Example:
            DebugArray("Valid placement Positions", _positions);
            DebugArrayFormat("BombData", "Bomb: %1 | Guidance: %2 | Optimal target types: %3", _bombdata);

    ~~~~ Log output format

        Log output: "{Time UTC} | {Prefix} | {Log level} | File: {filename} | {Message}"
        To server: "{Time UTC} | {Prefix} | {Log level} | File: {filename} | {Message} | Client {Player} [clientOwner]"

    ~~~~ Logging requirements
        ________________________________________________________
        | Logging Type    | Log Level | Only in A3 Debug mode   |
        | Error           | 1         | false                   |
        | Info            | 2         | false                   |
        | Debug           | 3         | false                   |
        | Trace           | 3         | true                    |
        | Verbose         | 4         | false                   |
        |_________________|___________|_________________________|

    ~~~~ Warning

        Array defines and strings will have there commas striped in macro calls.
        i.e. this Info("Don't, wait until i get there to hang him"); becomes "Don't wait until i get there to hang him"
        and Info(["some","elements"]); would fail to log

    Scope: Any
    Environment: Any
    Public: Yes
    Dependencies: SQF, LogLevel

    License: MIT License
*/
#define _LOG_prefix "Antistasi"

//Enabling log types
#define Log_Error
#define Log_Info
#define Log_Debug
#define Log_Verbose

//A3 Debug mode logging
#if __A3_DEBUG__
    #define Log_Trace
#endif

if (isNil "LogLevel") then {LogLevel = 2};

//Log standard format
#define LogMessage(Level, Message) diag_log text ((systemTimeUTC call A3A_fnc_systemTime_format_S) + " | " + _LOG_prefix + " | "+ Level \
+ " | File: " + (if (isNil "_fnc_scriptName") then {__FILE__ select [count __FILE__-(reverse __FILE__ find '\'), 1e6]} else {_fnc_scriptName}) \
+ " | " + Message + ( if (!isNil "_fnc_scriptNameParent" && {_fnc_scriptNameParent isNotEqualTo _fnc_scriptName}) then { " | Called By: " + _fnc_scriptNameParent} else {""} ) )

#define LogServerMessage(Level, Message) ((systemTimeUTC call A3A_fnc_systemTime_format_S) + " | " + _LOG_prefix + " | "+ Level \
+ " | File: " + (if (isNil "_fnc_scriptName") then {__FILE__ select [count __FILE__-(reverse __FILE__ find '\'), 1e6]} else {_fnc_scriptName}) \
+ " | " + Message + ( if (!isNil "_fnc_scriptNameParent" && {_fnc_scriptNameParent isNotEqualTo _fnc_scriptName}) then { " | Called By: " + _fnc_scriptNameParent} else {""} ) \
+ format [" | Client: %1 [%2]", player, clientOwner]) remoteExec ["A3A_fnc_localLog", 2]

//log macros
#ifdef Log_Error
    #define Error(Message) if (0 < LogLevel) then { LogMessage("Error", Message); if !(isServer) then {LogServerMessage("Error", Message)} }
    #define Error_1(Message, A) if (0 < LogLevel) then { private _msg = format [Message,A]; LogMessage("Error", _msg); if !(isServer) then {LogServerMessage("Error", _msg)} }
    #define Error_2(Message, A,B) if (0 < LogLevel) then { private _msg = format [Message,A,B]; LogMessage("Error", _msg); if !(isServer) then {LogServerMessage("Error", _msg)} }
    #define Error_3(Message, A,B,C) if (0 < LogLevel) then { private _msg = format [Message,A,B,C]; LogMessage("Error", _msg); if !(isServer) then {LogServerMessage("Error", _msg)} }
    #define Error_4(Message, A,B,C,D) if (0 < LogLevel) then { private _msg = format [Message,A,B,C,D]; LogMessage("Error", _msg); if !(isServer) then {LogServerMessage("Error", _msg)} }
    #define Error_5(Message, A,B,C,D,E) if (0 < LogLevel) then { private _msg = format [Message,A,B,C,D,E]; LogMessage("Error", _msg); if !(isServer) then {LogServerMessage("Error", _msg)} }
    #define Error_6(Message, A,B,C,D,E,F) if (0 < LogLevel) then { private _msg = format [Message,A,B,C,D,E,F]; LogMessage("Error", _msg); if !(isServer) then {LogServerMessage("Error", _msg)} }
    #define Error_7(Message, A,B,C,D,E,F,G) if (0 < LogLevel) then { private _msg = format [Message,A,B,C,D,E,F,G]; LogMessage("Error", _msg); if !(isServer) then {LogServerMessage("Error", _msg)} }
    #define Error_8(Message, A,B,C,D,E,F,G,H) if (0 < LogLevel) then { private _msg = format [Message,A,B,C,D,E,F,G,H]; LogMessage("Error", _msg); if !(isServer) then {LogServerMessage("Error", _msg)} }
    #define ServerError(Message) if (0 < LogLevel) then { LogServerMessage("Error", Message) }
    #define ServerError_1(Message, A) if (0 < LogLevel) then { private _msg = format [Message,A]; LogServerMessage("Error", _msg) }
    #define ServerError_2(Message, A,B) if (0 < LogLevel) then { private _msg = format [Message,A,B]; LogServerMessage("Error", _msg) }
    #define ServerError_3(Message, A,B,C) if (0 < LogLevel) then { private _msg = format [Message,A,B,C]; LogServerMessage("Error", _msg) }
    #define ServerError_4(Message, A,B,C,D) if (0 < LogLevel) then { private _msg = format [Message,A,B,C,D]; LogServerMessage("Error", _msg) }
    #define ServerError_5(Message, A,B,C,D,E) if (0 < LogLevel) then { private _msg = format [Message,A,B,C,D,E]; LogServerMessage("Error", _msg) }
    #define ServerError_6(Message, A,B,C,D,E,F) if (0 < LogLevel) then { private _msg = format [Message,A,B,C,D,E,F]; LogServerMessage("Error", _msg) }
    #define ServerError_7(Message, A,B,C,D,E,F,G) if (0 < LogLevel) then { private _msg = format [Message,A,B,C,D,E,F,G]; LogServerMessage("Error", _msg) }
    #define ServerError_8(Message, A,B,C,D,E,F,G,H) if (0 < LogLevel) then { private _msg = format [Message,A,B,C,D,E,F,G,H]; LogServerMessage("Error", _msg) }
    #define ErrorArray(Message, Array) if (0 < LogLevel) then { private _msg = (Message + " [" + endl + (Array apply {"    " + str _x} joinString endl) + endl + "]"); LogMessage("Error", _msg); LogServerMessage("Error", _msg) }
    #define ServerErrorArray(Message, Array) if (0 < LogLevel) then { LogServerMessage("Error", (Message + " [" + endl + (Array apply {"    " + str _x} joinString endl) + endl + "]")) }
    #define ErrorArrayFormat(Message, Frmat, Array) if (0 < LogLevel) then { private _msg = (Message + " [" + endl + (Array apply {format (["    " + Frmat] + _x)} joinString endl) + endl + "]"); LogMessage("Error", _msg); LogServerMessage("Error", _msg) }
    #define ServerErrorArrayFormat(Message, Frmat, Array) if (0 < LogLevel) then { LogServerMessage("Error", (Message + " [" + endl + (Array apply {format (["    " + Frmat] + _x)} joinString endl) + endl + "]")) }
#else
    #define Error(Message)
    #define Error_1(Message, A)
    #define Error_2(Message, A,B)
    #define Error_3(Message, A,B,C)
    #define Error_4(Message, A,B,C,D)
    #define Error_5(Message, A,B,C,D,E)
    #define Error_6(Message, A,B,C,D,E,F)
    #define Error_7(Message, A,B,C,D,E,F,G)
    #define Error_8(Message, A,B,C,D,E,F,G,H)
    #define ServerError(Message)
    #define ServerError_1(Message, A)
    #define ServerError_2(Message, A,B)
    #define ServerError_3(Message, A,B,C)
    #define ServerError_4(Message, A,B,C,D)
    #define ServerError_5(Message, A,B,C,D,E)
    #define ServerError_6(Message, A,B,C,D,E,F)
    #define ServerError_7(Message, A,B,C,D,E,F,G)
    #define ServerError_8(Message, A,B,C,D,E,F,G,H)
    #define ErrorArray(Message, Array)
    #define ServerErrorArray(Message, Array)
    #define ErrorArrayFormat(Message, Frmat, Array)
    #define ServerErrorArrayFormat(Message, Frmat, Array)
#endif

#ifdef Log_Info
    #define Info(Message) if (1 < LogLevel) then { LogMessage("Info", Message) }
    #define Info_1(Message, A) if (1 < LogLevel) then { private _msg = format [Message,A]; LogMessage("Info", _msg) }
    #define Info_2(Message, A,B) if (1 < LogLevel) then { private _msg = format [Message,A,B]; LogMessage("Info", _msg) }
    #define Info_3(Message, A,B,C) if (1 < LogLevel) then { private _msg = format [Message,A,B,C]; LogMessage("Info", _msg) }
    #define Info_4(Message, A,B,C,D) if (1 < LogLevel) then { private _msg = format [Message,A,B,C,D]; LogMessage("Info", _msg) }
    #define Info_5(Message, A,B,C,D,E) if (1 < LogLevel) then { private _msg = format [Message,A,B,C,D,E]; LogMessage("Info", _msg) }
    #define Info_6(Message, A,B,C,D,E,F) if (1 < LogLevel) then { private _msg = format [Message,A,B,C,D,E,F]; LogMessage("Info", _msg) }
    #define Info_7(Message, A,B,C,D,E,F,G) if (1 < LogLevel) then { private _msg = format [Message,A,B,C,D,E,F,G]; LogMessage("Info", _msg) }
    #define Info_8(Message, A,B,C,D,E,F,G,H) if (1 < LogLevel) then { private _msg = format [Message,A,B,C,D,E,F,G,H]; LogMessage("Info", _msg) }
    #define ServerInfo(Message) if (1 < LogLevel) then { LogServerMessage("Info", format [Message]) }
    #define ServerInfo_1(Message, A) if (1 < LogLevel) then { private _msg = format [Message,A]; LogServerMessage("Info", _msg) }
    #define ServerInfo_2(Message, A,B) if (1 < LogLevel) then { private _msg = format [Message,A,B]; LogServerMessage("Info", _msg) }
    #define ServerInfo_3(Message, A,B,C) if (1 < LogLevel) then { private _msg = format [Message,A,B,C]; LogServerMessage("Info", _msg) }
    #define ServerInfo_4(Message, A,B,C,D) if (1 < LogLevel) then { private _msg = format [Message,A,B,C,D]; LogServerMessage("Info", _msg) }
    #define ServerInfo_5(Message, A,B,C,D,E) if (1 < LogLevel) then { private _msg = format [Message,A,B,C,D,E]; LogServerMessage("Info", _msg) }
    #define ServerInfo_6(Message, A,B,C,D,E,F) if (1 < LogLevel) then { private _msg = format [Message,A,B,C,D,E,F]; LogServerMessage("Info", _msg) }
    #define ServerInfo_7(Message, A,B,C,D,E,F,G) if (1 < LogLevel) then { private _msg = format [Message,A,B,C,D,E,F,G]; LogServerMessage("Info", _msg) }
    #define ServerInfo_8(Message, A,B,C,D,E,F,G,H) if (1 < LogLevel) then { private _msg = format [Message,A,B,C,D,E,F,G,H]; LogServerMessage("Info", _msg) }
    #define InfoArray(Message, Array) if (1 < LogLevel) then { LogMessage("Info", (Message + " [" + endl + (Array apply {"    " + str _x} joinString endl) + endl + "]")) }
    #define ServerInfoArray(Message, Array) if (1 < LogLevel) then { LogServerMessage("Info", (Message + " [" + endl + (Array apply {"    " + str _x} joinString endl) + endl + "]")) }
    #define InfoArrayFormat(Message, Frmat, Array) if (1 < LogLevel) then { LogMessage("Info", (Message + " [" + endl + (Array apply {format (["    " + Frmat] + _x)} joinString endl) + endl + "]")) }
    #define ServerInfoArrayFormat(Message, Frmat, Array) if (1 < LogLevel) then { LogServerMessage("Info", (Message + " [" + endl + (Array apply {format (["    " + Frmat] + _x)} joinString endl) + endl + "]")) }
#else
    #define Info(Message)
    #define Info_1(Message, A)
    #define Info_2(Message, A,B)
    #define Info_3(Message, A,B,C)
    #define Info_4(Message, A,B,C,D)
    #define Info_5(Message, A,B,C,D,E)
    #define Info_6(Message, A,B,C,D,E,F)
    #define Info_7(Message, A,B,C,D,E,F,G)
    #define Info_8(Message, A,B,C,D,E,F,G,H)
    #define ServerInfo(Message)
    #define ServerInfo_1(Message, A)
    #define ServerInfo_2(Message, A,B)
    #define ServerInfo_3(Message, A,B,C)
    #define ServerInfo_4(Message, A,B,C,D)
    #define ServerInfo_5(Message, A,B,C,D,E)
    #define ServerInfo_6(Message, A,B,C,D,E,F)
    #define ServerInfo_7(Message, A,B,C,D,E,F,G)
    #define ServerInfo_8(Message, A,B,C,D,E,F,G,H)
    #define InfoArray(Message, Array)
    #define ServerInfoArray(Message, Array)
    #define InfoArrayFormat(Message, Frmat, Array)
    #define ServerInfoArrayFormat(Message, Frmat, Array)
#endif

#ifdef Log_Debug
    #define Debug(Message) if (2 < LogLevel) then { LogMessage("Debug", Message) }
    #define Debug_1(Message, A) if (2 < LogLevel) then { private _msg = format [Message,A]; LogMessage("Debug", _msg) }
    #define Debug_2(Message, A,B) if (2 < LogLevel) then { private _msg = format [Message,A,B]; LogMessage("Debug", _msg) }
    #define Debug_3(Message, A,B,C) if (2 < LogLevel) then { private _msg = format [Message,A,B,C]; LogMessage("Debug", _msg) }
    #define Debug_4(Message, A,B,C,D) if (2 < LogLevel) then { private _msg = format [Message,A,B,C,D]; LogMessage("Debug", _msg) }
    #define Debug_5(Message, A,B,C,D,E) if (2 < LogLevel) then { private _msg = format [Message,A,B,C,D,E]; LogMessage("Debug", _msg) }
    #define Debug_6(Message, A,B,C,D,E,F) if (2 < LogLevel) then { private _msg = format [Message,A,B,C,D,E,F]; LogMessage("Debug", _msg) }
    #define Debug_7(Message, A,B,C,D,E,F,G) if (2 < LogLevel) then { private _msg = format [Message,A,B,C,D,E,F,G]; LogMessage("Debug", _msg) }
    #define Debug_8(Message, A,B,C,D,E,F,G,H) if (2 < LogLevel) then { private _msg = format [Message,A,B,C,D,E,F,G,H]; LogMessage("Debug", _msg) }
    #define ServerDebug(Message) if (2 < LogLevel) then { LogServerMessage("Debug", format [Message]) }
    #define ServerDebug_1(Message, A) if (2 < LogLevel) then { private _msg = format [Message,A]; LogServerMessage("Debug", _msg) }
    #define ServerDebug_2(Message, A,B) if (2 < LogLevel) then { private _msg = format [Message,A,B]; LogServerMessage("Debug", _msg) }
    #define ServerDebug_3(Message, A,B,C) if (2 < LogLevel) then { private _msg = format [Message,A,B,C]; LogServerMessage("Debug", _msg) }
    #define ServerDebug_4(Message, A,B,C,D) if (2 < LogLevel) then { private _msg = format [Message,A,B,C,D]; LogServerMessage("Debug", _msg) }
    #define ServerDebug_5(Message, A,B,C,D,E) if (2 < LogLevel) then { private _msg = format [Message,A,B,C,D,E]; LogServerMessage("Debug", _msg) }
    #define ServerDebug_6(Message, A,B,C,D,E,F) if (2 < LogLevel) then { private _msg = format [Message,A,B,C,D,E,F]; LogServerMessage("Debug", _msg) }
    #define ServerDebug_7(Message, A,B,C,D,E,F,G) if (2 < LogLevel) then { private _msg = format [Message,A,B,C,D,E,F,G]; LogServerMessage("Debug", _msg) }
    #define ServerDebug_8(Message, A,B,C,D,E,F,G,H) if (2 < LogLevel) then { private _msg = format [Message,A,B,C,D,E,F,G,H]; LogServerMessage("Debug", _msg) }
    #define DebugArray(Message, Array) if (2 < LogLevel) then { LogMessage("Debug", (Message + " [" + endl + (Array apply {"    " + str _x} joinString endl) + endl + "]")) }
    #define ServerDebugArray(Message, Array) if (2 < LogLevel) then { LogServerMessage("Debug", (Message + " [" + endl + (Array apply {"    " + str _x} joinString endl) + endl + "]")) }
    #define DebugArrayFormat(Message, Frmat, Array) if (2 < LogLevel) then { LogMessage("Debug", (Message + " [" + endl + (Array apply {format (["    " + Frmat] + _x)} joinString endl) + endl + "]")) }
    #define ServerDebugArrayFormat(Message, Frmat, Array) if (2 < LogLevel) then { LogServerMessage("Debug", (Message + " [" + endl + (Array apply {format (["    " + Frmat] + _x)} joinString endl) + endl + "]")) }
#else
    #define Debug(Message)
    #define Debug_1(Message, A)
    #define Debug_2(Message, A,B)
    #define Debug_3(Message, A,B,C)
    #define Debug_4(Message, A,B,C,D)
    #define Debug_5(Message, A,B,C,D,E)
    #define Debug_6(Message, A,B,C,D,E,F)
    #define Debug_7(Message, A,B,C,D,E,F,G)
    #define Debug_8(Message, A,B,C,D,E,F,G,H)
    #define ServerDebug(Message)
    #define ServerDebug_1(Message, A)
    #define ServerDebug_2(Message, A,B)
    #define ServerDebug_3(Message, A,B,C)
    #define ServerDebug_4(Message, A,B,C,D)
    #define ServerDebug_5(Message, A,B,C,D,E)
    #define ServerDebug_6(Message, A,B,C,D,E,F)
    #define ServerDebug_7(Message, A,B,C,D,E,F,G)
    #define ServerDebug_8(Message, A,B,C,D,E,F,G,H)
    #define DebugArray(Message, Array)
    #define ServerDebugArray(Message, Array)
    #define DebugArrayFormat(Message, Frmat, Array)
    #define ServerDebugArrayFormat(Message, Frmat, Array)
#endif

#ifdef Log_Trace
    #define Trace(Message) if (2 < LogLevel) then { LogMessage("Trace", Message) }
    #define Trace_1(Message, A) if (2 < LogLevel) then { private _msg = format [Message,A]; LogMessage("Trace", _msg) }
    #define Trace_2(Message, A,B) if (2 < LogLevel) then { private _msg = format [Message,A,B]; LogMessage("Trace", _msg) }
    #define Trace_3(Message, A,B,C) if (2 < LogLevel) then { private _msg = format [Message,A,B,C]; LogMessage("Trace", _msg) }
    #define Trace_4(Message, A,B,C,D) if (2 < LogLevel) then { private _msg = format [Message,A,B,C,D]; LogMessage("Trace", _msg) }
    #define Trace_5(Message, A,B,C,D,E) if (2 < LogLevel) then { private _msg = format [Message,A,B,C,D,E]; LogMessage("Trace", _msg) }
    #define Trace_6(Message, A,B,C,D,E,F) if (2 < LogLevel) then { private _msg = format [Message,A,B,C,D,E,F]; LogMessage("Trace", _msg) }
    #define Trace_7(Message, A,B,C,D,E,F,G) if (2 < LogLevel) then { private _msg = format [Message,A,B,C,D,E,F,G]; LogMessage("Trace", _msg) }
    #define Trace_8(Message, A,B,C,D,E,F,G,H) if (2 < LogLevel) then { private _msg = format [Message,A,B,C,D,E,F,G,H]; LogMessage("Trace", _msg) }
    #define ServerTrace(Message) if (2 < LogLevel) then { LogServerMessage("Trace", format [Message]) }
    #define ServerTrace_1(Message, A) if (2 < LogLevel) then { private _msg = format [Message,A]; LogServerMessage("Trace", _msg) }
    #define ServerTrace_2(Message, A,B) if (2 < LogLevel) then { private _msg = format [Message,A,B]; LogServerMessage("Trace", _msg) }
    #define ServerTrace_3(Message, A,B,C) if (2 < LogLevel) then { private _msg = format [Message,A,B,C]; LogServerMessage("Trace", _msg) }
    #define ServerTrace_4(Message, A,B,C,D) if (2 < LogLevel) then { private _msg = format [Message,A,B,C,D]; LogServerMessage("Trace", _msg) }
    #define ServerTrace_5(Message, A,B,C,D,E) if (2 < LogLevel) then { private _msg = format [Message,A,B,C,D,E]; LogServerMessage("Trace", _msg) }
    #define ServerTrace_6(Message, A,B,C,D,E,F) if (2 < LogLevel) then { private _msg = format [Message,A,B,C,D,E,F]; LogServerMessage("Trace", _msg) }
    #define ServerTrace_7(Message, A,B,C,D,E,F,G) if (2 < LogLevel) then { private _msg = format [Message,A,B,C,D,E,F,G]; LogServerMessage("Trace", _msg) }
    #define ServerTrace_8(Message, A,B,C,D,E,F,G,H) if (2 < LogLevel) then { private _msg = format [Message,A,B,C,D,E,F,G,H]; LogServerMessage("Trace", _msg) }
    #define TraceArray(Message, Array) if (2 < LogLevel) then { LogMessage("Trace", (Message + " [" + endl + (Array apply {"    " + str _x} joinString endl) + endl + "]")) }
    #define ServerTraceArray(Message, Array) if (2 < LogLevel) then { LogServerMessage("Trace", (Message + " [" + endl + (Array apply {"    " + str _x} joinString endl) + endl + "]")) }
    #define TraceArrayFormat(Message, Frmat, Array) if (2 < LogLevel) then { LogMessage("Trace", (Message + " [" + endl + (Array apply {format (["    " + Frmat] + _x)} joinString endl) + endl + "]")) }
    #define ServerTraceArrayFormat(Message, Frmat, Array) if (2 < LogLevel) then { LogServerMessage("Trace", (Message + " [" + endl + (Array apply {format (["    " + Frmat] + _x)} joinString endl) + endl + "]")) }
#else
    #define Trace(Message)
    #define Trace_1(Message, A)
    #define Trace_2(Message, A,B)
    #define Trace_3(Message, A,B,C)
    #define Trace_4(Message, A,B,C,D)
    #define Trace_5(Message, A,B,C,D,E)
    #define Trace_6(Message, A,B,C,D,E,F)
    #define Trace_7(Message, A,B,C,D,E,F,G)
    #define Trace_8(Message, A,B,C,D,E,F,G,H)
    #define ServerTrace(Message)
    #define ServerTrace_1(Message, A)
    #define ServerTrace_2(Message, A,B)
    #define ServerTrace_3(Message, A,B,C)
    #define ServerTrace_4(Message, A,B,C,D)
    #define ServerTrace_5(Message, A,B,C,D,E)
    #define ServerTrace_6(Message, A,B,C,D,E,F)
    #define ServerTrace_7(Message, A,B,C,D,E,F,G)
    #define ServerTrace_8(Message, A,B,C,D,E,F,G,H)
    #define TraceArray(Message, Array)
    #define ServerTraceArray(Message, Array)
    #define TraceArrayFormat(Message, Frmat, Array)
    #define ServerTraceArrayFormat(Message, Frmat, Array)
#endif

#ifdef Log_Verbose
    #define Verbose(Message) if (3 < LogLevel) then { LogMessage("Verbose", Message) }
    #define Verbose_1(Message, A) if (3 < LogLevel) then { private _msg = format [Message,A]; LogMessage("Verbose", _msg) }
    #define Verbose_2(Message, A,B) if (3 < LogLevel) then { private _msg = format [Message,A,B]; LogMessage("Verbose", _msg) }
    #define Verbose_3(Message, A,B,C) if (3 < LogLevel) then { private _msg = format [Message,A,B,C]; LogMessage("Verbose", _msg) }
    #define Verbose_4(Message, A,B,C,D) if (3 < LogLevel) then { private _msg = format [Message,A,B,C,D]; LogMessage("Verbose", _msg) }
    #define Verbose_5(Message, A,B,C,D,E) if (3 < LogLevel) then { private _msg = format [Message,A,B,C,D,E]; LogMessage("Verbose", _msg) }
    #define Verbose_6(Message, A,B,C,D,E,F) if (3 < LogLevel) then { private _msg = format [Message,A,B,C,D,E,F]; LogMessage("Verbose", _msg) }
    #define Verbose_7(Message, A,B,C,D,E,F,G) if (3 < LogLevel) then { private _msg = format [Message,A,B,C,D,E,F,G]; LogMessage("Verbose", _msg) }
    #define Verbose_8(Message, A,B,C,D,E,F,G,H) if (3 < LogLevel) then { private _msg = format [Message,A,B,C,D,E,F,G,H]; LogMessage("Verbose", _msg) }
    #define ServerVerbose(Message) if (3 < LogLevel) then { LogServerMessage("Verbose", format [Message]) }
    #define ServerVerbose_1(Message, A) if (3 < LogLevel) then { private _msg = format [Message,A]; LogServerMessage("Verbose", _msg) }
    #define ServerVerbose_2(Message, A,B) if (3 < LogLevel) then { private _msg = format [Message,A,B]; LogServerMessage("Verbose", _msg) }
    #define ServerVerbose_3(Message, A,B,C) if (3 < LogLevel) then { private _msg = format [Message,A,B,C]; LogServerMessage("Verbose", _msg) }
    #define ServerVerbose_4(Message, A,B,C,D) if (3 < LogLevel) then { private _msg = format [Message,A,B,C,D]; LogServerMessage("Verbose", _msg) }
    #define ServerVerbose_5(Message, A,B,C,D,E) if (3 < LogLevel) then { private _msg = format [Message,A,B,C,D,E]; LogServerMessage("Verbose", _msg) }
    #define ServerVerbose_6(Message, A,B,C,D,E,F) if (3 < LogLevel) then { private _msg = format [Message,A,B,C,D,E,F]; LogServerMessage("Verbose", _msg) }
    #define ServerVerbose_7(Message, A,B,C,D,E,F,G) if (3 < LogLevel) then { private _msg = format [Message,A,B,C,D,E,F,G]; LogServerMessage("Verbose", _msg) }
    #define ServerVerbose_8(Message, A,B,C,D,E,F,G,H) if (3 < LogLevel) then { private _msg = format [Message,A,B,C,D,E,F,G,H]; LogServerMessage("Verbose", _msg) }
    #define VerboseArray(Message, Array) if (3 < LogLevel) then { LogMessage("Verbose", (Message + " [" + endl + (Array apply {"    " + str _x} joinString endl) + endl + "]")) }
    #define ServerVerboseArray(Message, Array) if (3 < LogLevel) then { LogServerMessage("Verbose", (Message + " [" + endl + (Array apply {"    " + str _x} joinString endl) + endl + "]")) }
    #define VerboseArrayFormat(Message, Frmat, Array) if (3 < LogLevel) then { LogMessage("Verbose", (Message + " [" + endl + (Array apply {format (["    " + Frmat] + _x)} joinString endl) + endl + "]")) }
    #define ServerVerboseArrayFormat(Message, Frmat, Array) if (3 < LogLevel) then { LogServerMessage("Verbose", (Message + " [" + endl + (Array apply {format (["    " + Frmat] + _x)} joinString endl) + endl + "]")) }
#else
    #define Verbose(Message)
    #define Verbose_1(Message, A)
    #define Verbose_2(Message, A,B)
    #define Verbose_3(Message, A,B,C)
    #define Verbose_4(Message, A,B,C,D)
    #define Verbose_5(Message, A,B,C,D,E)
    #define Verbose_6(Message, A,B,C,D,E,F)
    #define Verbose_7(Message, A,B,C,D,E,F,G)
    #define Verbose_8(Message, A,B,C,D,E,F,G,H)
    #define ServerVerbose(Message)
    #define ServerVerbose_1(Message, A)
    #define ServerVerbose_2(Message, A,B)
    #define ServerVerbose_3(Message, A,B,C)
    #define ServerVerbose_4(Message, A,B,C,D)
    #define ServerVerbose_5(Message, A,B,C,D,E)
    #define ServerVerbose_6(Message, A,B,C,D,E,F)
    #define ServerVerbose_7(Message, A,B,C,D,E,F,G)
    #define ServerVerbose_8(Message, A,B,C,D,E,F,G,H)
    #define VerboseArray(Message, Array)
    #define ServerVerboseArray(Message, Array)
    #define VerboseArrayFormat(Message, Frmat, Array)
    #define ServerVerboseArrayFormat(Message, Frmat, Array)
#endif
