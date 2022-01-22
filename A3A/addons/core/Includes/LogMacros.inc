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
    Dependencies: SQF, VARDEF(LogLevel,4)

    License: MIT License
*/
#define _LOG_prefix "Antistasi"
#define _LOG_newLineIndicator ">>> "
#define _LOG_newLine (endl + _LOG_newLineIndicator)

//Enabling log types
#define Log_Error
#define Log_Info
#define Log_Debug
#define Log_Verbose

//A3 Debug mode logging
#if __A3_DEBUG__
    #define Log_Trace
#endif

#ifndef VARDEF
    #define VARDEF(Var, Def) (if (isNil #Var) then {Def} else {Var})
#endif

//line limit handler
#define _LOG_breakUpLogLine(LOG_LINE) call { \
    if (count LOG_LINE < 1020) exitWith {[LOG_LINE]}; \
    private _LOG_remLine = LOG_LINE; \
    private _LOG_outputArray = []; \
    while { count _LOG_remLine >= 1020 } do \
    { \
        private _LOG_cutPoint = _LOG_remLine find [" ", 980]; \
        if (_LOG_cutPoint == -1 or _LOG_cutPoint > 1020) then { _LOG_cutPoint = _LOG_remLine find [",", 980] }; \
        if (_LOG_cutPoint == -1 or _LOG_cutPoint > 1020) then { _LOG_cutPoint = 1020 }; \
        _LOG_outputArray pushBack (_LOG_remLine select [0, _LOG_cutPoint+1]); \
        _LOG_remLine = _LOG_newLineIndicator + (_LOG_remLine select [_LOG_cutPoint+1]); \
    }; \
    _LOG_outputArray pushBack _LOG_remLine; \
    _LOG_outputArray \
}

//Log standard format
#define _LOG_STANDARD_FORMAT(LEVEL, MESSAGE) ( (systemTimeUTC call A3A_fnc_systemTime_format_S) + " | " + _LOG_prefix + " | "+ LEVEL \
+ " | File: " + ( if (isNil "_fnc_scriptName") then {__FILE__ select [count __FILE__-(reverse __FILE__ find '\'), 1e6]} else {_fnc_scriptName} ) \
+ " | " + MESSAGE + ( if (!isNil "_fnc_scriptNameParent" && {_fnc_scriptNameParent isNotEqualTo _fnc_scriptName}) then { " | Called By: " + _fnc_scriptNameParent} else {""} ) )

#define _LOG_Message(LEVEL, MESSAGE) private _LOG_logLine = _LOG_STANDARD_FORMAT(LEVEL, MESSAGE); {diag_log text _x} forEach _LOG_breakUpLogLine(_LOG_logLine);
#define _LOG_ServerMessage(LEVEL, MESSAGE) \
if (isServer) then { _LOG_Message(LEVEL, MESSAGE) } else { \
private _LOG_LogLine = _LOG_STANDARD_FORMAT(LEVEL, MESSAGE) + format [" | Client: %1 [%2]", player, clientOwner]; \
_LOG_breakUpLogLine(_LOG_logLine) remoteExec ["A3A_fnc_localLog", 2]; \
};

//log macros
#ifdef Log_Error
    #define Error(Message) if (0 < VARDEF(LogLevel,4)) then { _LOG_Message("Error", Message); if !(isServer) then {_LOG_ServerMessage("Error", Message)} };
    #define Error_1(Message, A) if (0 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A]; _LOG_Message("Error", _msg); if !(isServer) then {_LOG_ServerMessage("Error", _msg)} };
    #define Error_2(Message, A,B) if (0 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B]; _LOG_Message("Error", _msg); if !(isServer) then {_LOG_ServerMessage("Error", _msg)} };
    #define Error_3(Message, A,B,C) if (0 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C]; _LOG_Message("Error", _msg); if !(isServer) then {_LOG_ServerMessage("Error", _msg)} };
    #define Error_4(Message, A,B,C,D) if (0 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C,D]; _LOG_Message("Error", _msg); if !(isServer) then {_LOG_ServerMessage("Error", _msg)} };
    #define Error_5(Message, A,B,C,D,E) if (0 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C,D,E]; _LOG_Message("Error", _msg); if !(isServer) then {_LOG_ServerMessage("Error", _msg)} };
    #define Error_6(Message, A,B,C,D,E,F) if (0 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C,D,E,F]; _LOG_Message("Error", _msg); if !(isServer) then {_LOG_ServerMessage("Error", _msg)} };
    #define Error_7(Message, A,B,C,D,E,F,G) if (0 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C,D,E,F,G]; _LOG_Message("Error", _msg); if !(isServer) then {_LOG_ServerMessage("Error", _msg)} };
    #define Error_8(Message, A,B,C,D,E,F,G,H) if (0 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C,D,E,F,G,H]; _LOG_Message("Error", _msg); if !(isServer) then {_LOG_ServerMessage("Error", _msg)} };
    #define ServerError(Message) if (0 < VARDEF(LogLevel,4)) then { _LOG_ServerMessage("Error", Message) };
    #define ServerError_1(Message, A) if (0 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A]; _LOG_ServerMessage("Error", _msg) };
    #define ServerError_2(Message, A,B) if (0 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B]; _LOG_ServerMessage("Error", _msg) };
    #define ServerError_3(Message, A,B,C) if (0 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C]; _LOG_ServerMessage("Error", _msg) };
    #define ServerError_4(Message, A,B,C,D) if (0 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C,D]; _LOG_ServerMessage("Error", _msg) };
    #define ServerError_5(Message, A,B,C,D,E) if (0 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C,D,E]; _LOG_ServerMessage("Error", _msg) };
    #define ServerError_6(Message, A,B,C,D,E,F) if (0 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C,D,E,F]; _LOG_ServerMessage("Error", _msg) };
    #define ServerError_7(Message, A,B,C,D,E,F,G) if (0 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C,D,E,F,G]; _LOG_ServerMessage("Error", _msg) };
    #define ServerError_8(Message, A,B,C,D,E,F,G,H) if (0 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C,D,E,F,G,H]; _LOG_ServerMessage("Error", _msg) };
    #define ErrorArray(Message, Array) if (0 < VARDEF(LogLevel,4)) then { private _msg = (Message + " [" + _LOG_newLine + (Array joinString _LOG_newLine) + _LOG_newLine + "]"); _LOG_Message("Error", _msg); _LOG_ServerMessage("Error", _msg) };
    #define ServerErrorArray(Message, Array) if (0 < VARDEF(LogLevel,4)) then { _LOG_ServerMessage("Error", (Message + " [" + _LOG_newLine + (Array joinString _LOG_newLine) + _LOG_newLine + "]")) };
    #define ErrorArrayFormat(Message, Frmat, Array) if (0 < VARDEF(LogLevel,4)) then { private _msg = (Message + " [" + _LOG_newLine + (Array apply {format ([Frmat] + _x)} joinString _LOG_newLine) + _LOG_newLine + "]"); _LOG_Message("Error", _msg); _LOG_ServerMessage("Error", _msg) };
    #define ServerErrorArrayFormat(Message, Frmat, Array) if (0 < VARDEF(LogLevel,4)) then { _LOG_ServerMessage("Error", (Message + " [" + _LOG_newLine + (Array apply {format ([Frmat] + _x)} joinString _LOG_newLine) + _LOG_newLine + "]")) };
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
    #define Info(Message) if (1 < VARDEF(LogLevel,4)) then { _LOG_Message("Info", Message) };
    #define Info_1(Message, A) if (1 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A]; _LOG_Message("Info", _msg) };
    #define Info_2(Message, A,B) if (1 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B]; _LOG_Message("Info", _msg) };
    #define Info_3(Message, A,B,C) if (1 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C]; _LOG_Message("Info", _msg) };
    #define Info_4(Message, A,B,C,D) if (1 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C,D]; _LOG_Message("Info", _msg) };
    #define Info_5(Message, A,B,C,D,E) if (1 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C,D,E]; _LOG_Message("Info", _msg) };
    #define Info_6(Message, A,B,C,D,E,F) if (1 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C,D,E,F]; _LOG_Message("Info", _msg) };
    #define Info_7(Message, A,B,C,D,E,F,G) if (1 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C,D,E,F,G]; _LOG_Message("Info", _msg) };
    #define Info_8(Message, A,B,C,D,E,F,G,H) if (1 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C,D,E,F,G,H]; _LOG_Message("Info", _msg) };
    #define ServerInfo(Message) if (1 < VARDEF(LogLevel,4)) then { _LOG_ServerMessage("Info", format [Message]) };
    #define ServerInfo_1(Message, A) if (1 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A]; _LOG_ServerMessage("Info", _msg) };
    #define ServerInfo_2(Message, A,B) if (1 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B]; _LOG_ServerMessage("Info", _msg) };
    #define ServerInfo_3(Message, A,B,C) if (1 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C]; _LOG_ServerMessage("Info", _msg) };
    #define ServerInfo_4(Message, A,B,C,D) if (1 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C,D]; _LOG_ServerMessage("Info", _msg) };
    #define ServerInfo_5(Message, A,B,C,D,E) if (1 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C,D,E]; _LOG_ServerMessage("Info", _msg) };
    #define ServerInfo_6(Message, A,B,C,D,E,F) if (1 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C,D,E,F]; _LOG_ServerMessage("Info", _msg) };
    #define ServerInfo_7(Message, A,B,C,D,E,F,G) if (1 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C,D,E,F,G]; _LOG_ServerMessage("Info", _msg) };
    #define ServerInfo_8(Message, A,B,C,D,E,F,G,H) if (1 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C,D,E,F,G,H]; _LOG_ServerMessage("Info", _msg) };
    #define InfoArray(Message, Array) if (1 < VARDEF(LogLevel,4)) then { _LOG_Message("Info", (Message + " [" + _LOG_newLine + (Array joinString _LOG_newLine) + _LOG_newLine + "]")) };
    #define ServerInfoArray(Message, Array) if (1 < VARDEF(LogLevel,4)) then { _LOG_ServerMessage("Info", (Message + " [" + _LOG_newLine + (Array joinString _LOG_newLine) + _LOG_newLine + "]")) };
    #define InfoArrayFormat(Message, Frmat, Array) if (1 < VARDEF(LogLevel,4)) then { _LOG_Message("Info", (Message + " [" + _LOG_newLine + (Array apply {format ([Frmat] + _x)} joinString _LOG_newLine) + _LOG_newLine + "]")) };
    #define ServerInfoArrayFormat(Message, Frmat, Array) if (1 < VARDEF(LogLevel,4)) then { _LOG_ServerMessage("Info", (Message + " [" + _LOG_newLine + (Array apply {format ([Frmat] + _x)} joinString _LOG_newLine) + _LOG_newLine + "]")) };
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
    #define Debug(Message) if (2 < VARDEF(LogLevel,4)) then { _LOG_Message("Debug", Message) };
    #define Debug_1(Message, A) if (2 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A]; _LOG_Message("Debug", _msg) };
    #define Debug_2(Message, A,B) if (2 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B]; _LOG_Message("Debug", _msg) };
    #define Debug_3(Message, A,B,C) if (2 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C]; _LOG_Message("Debug", _msg) };
    #define Debug_4(Message, A,B,C,D) if (2 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C,D]; _LOG_Message("Debug", _msg) };
    #define Debug_5(Message, A,B,C,D,E) if (2 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C,D,E]; _LOG_Message("Debug", _msg) };
    #define Debug_6(Message, A,B,C,D,E,F) if (2 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C,D,E,F]; _LOG_Message("Debug", _msg) };
    #define Debug_7(Message, A,B,C,D,E,F,G) if (2 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C,D,E,F,G]; _LOG_Message("Debug", _msg) };
    #define Debug_8(Message, A,B,C,D,E,F,G,H) if (2 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C,D,E,F,G,H]; _LOG_Message("Debug", _msg) };
    #define ServerDebug(Message) if (2 < VARDEF(LogLevel,4)) then { _LOG_ServerMessage("Debug", format [Message]) };
    #define ServerDebug_1(Message, A) if (2 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A]; _LOG_ServerMessage("Debug", _msg) };
    #define ServerDebug_2(Message, A,B) if (2 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B]; _LOG_ServerMessage("Debug", _msg) };
    #define ServerDebug_3(Message, A,B,C) if (2 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C]; _LOG_ServerMessage("Debug", _msg) };
    #define ServerDebug_4(Message, A,B,C,D) if (2 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C,D]; _LOG_ServerMessage("Debug", _msg) };
    #define ServerDebug_5(Message, A,B,C,D,E) if (2 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C,D,E]; _LOG_ServerMessage("Debug", _msg) };
    #define ServerDebug_6(Message, A,B,C,D,E,F) if (2 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C,D,E,F]; _LOG_ServerMessage("Debug", _msg) };
    #define ServerDebug_7(Message, A,B,C,D,E,F,G) if (2 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C,D,E,F,G]; _LOG_ServerMessage("Debug", _msg) };
    #define ServerDebug_8(Message, A,B,C,D,E,F,G,H) if (2 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C,D,E,F,G,H]; _LOG_ServerMessage("Debug", _msg) };
    #define DebugArray(Message, Array) if (2 < VARDEF(LogLevel,4)) then { _LOG_Message("Debug", (Message + " [" + _LOG_newLine + (Array joinString _LOG_newLine) + _LOG_newLine + "]")) };
    #define ServerDebugArray(Message, Array) if (2 < VARDEF(LogLevel,4)) then { _LOG_ServerMessage("Debug", (Message + " [" + _LOG_newLine + (Array joinString _LOG_newLine) + _LOG_newLine + "]")) };
    #define DebugArrayFormat(Message, Frmat, Array) if (2 < VARDEF(LogLevel,4)) then { _LOG_Message("Debug", (Message + " [" + _LOG_newLine + (Array apply {format ([Frmat] + _x)} joinString _LOG_newLine) + _LOG_newLine + "]")) };
    #define ServerDebugArrayFormat(Message, Frmat, Array) if (2 < VARDEF(LogLevel,4)) then { _LOG_ServerMessage("Debug", (Message + " [" + _LOG_newLine + (Array apply {format ([Frmat] + _x)} joinString _LOG_newLine) + _LOG_newLine + "]")) };
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
    #define Trace(Message) if (2 < VARDEF(LogLevel,4)) then { _LOG_Message("Trace", Message) };
    #define Trace_1(Message, A) if (2 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A]; _LOG_Message("Trace", _msg) };
    #define Trace_2(Message, A,B) if (2 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B]; _LOG_Message("Trace", _msg) };
    #define Trace_3(Message, A,B,C) if (2 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C]; _LOG_Message("Trace", _msg) };
    #define Trace_4(Message, A,B,C,D) if (2 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C,D]; _LOG_Message("Trace", _msg) };
    #define Trace_5(Message, A,B,C,D,E) if (2 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C,D,E]; _LOG_Message("Trace", _msg) };
    #define Trace_6(Message, A,B,C,D,E,F) if (2 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C,D,E,F]; _LOG_Message("Trace", _msg) };
    #define Trace_7(Message, A,B,C,D,E,F,G) if (2 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C,D,E,F,G]; _LOG_Message("Trace", _msg) };
    #define Trace_8(Message, A,B,C,D,E,F,G,H) if (2 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C,D,E,F,G,H]; _LOG_Message("Trace", _msg) };
    #define ServerTrace(Message) if (2 < VARDEF(LogLevel,4)) then { _LOG_ServerMessage("Trace", format [Message]) };
    #define ServerTrace_1(Message, A) if (2 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A]; _LOG_ServerMessage("Trace", _msg) };
    #define ServerTrace_2(Message, A,B) if (2 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B]; _LOG_ServerMessage("Trace", _msg) };
    #define ServerTrace_3(Message, A,B,C) if (2 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C]; _LOG_ServerMessage("Trace", _msg) };
    #define ServerTrace_4(Message, A,B,C,D) if (2 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C,D]; _LOG_ServerMessage("Trace", _msg) };
    #define ServerTrace_5(Message, A,B,C,D,E) if (2 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C,D,E]; _LOG_ServerMessage("Trace", _msg) };
    #define ServerTrace_6(Message, A,B,C,D,E,F) if (2 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C,D,E,F]; _LOG_ServerMessage("Trace", _msg) };
    #define ServerTrace_7(Message, A,B,C,D,E,F,G) if (2 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C,D,E,F,G]; _LOG_ServerMessage("Trace", _msg) };
    #define ServerTrace_8(Message, A,B,C,D,E,F,G,H) if (2 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C,D,E,F,G,H]; _LOG_ServerMessage("Trace", _msg) };
    #define TraceArray(Message, Array) if (2 < VARDEF(LogLevel,4)) then { _LOG_Message("Trace", (Message + " [" + _LOG_newLine + (Array joinString _LOG_newLine) + _LOG_newLine + "]")) };
    #define ServerTraceArray(Message, Array) if (2 < VARDEF(LogLevel,4)) then { _LOG_ServerMessage("Trace", (Message + " [" + _LOG_newLine + (Array joinString _LOG_newLine) + _LOG_newLine + "]")) };
    #define TraceArrayFormat(Message, Frmat, Array) if (2 < VARDEF(LogLevel,4)) then { _LOG_Message("Trace", (Message + " [" + _LOG_newLine + (Array apply {format ([Frmat] + _x)} joinString _LOG_newLine) + _LOG_newLine + "]")) };
    #define ServerTraceArrayFormat(Message, Frmat, Array) if (2 < VARDEF(LogLevel,4)) then { _LOG_ServerMessage("Trace", (Message + " [" + _LOG_newLine + (Array apply {format ([Frmat] + _x)} joinString _LOG_newLine) + _LOG_newLine + "]")) };
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
    #define Verbose(Message) if (3 < VARDEF(LogLevel,4)) then { _LOG_Message("Verbose", Message) };
    #define Verbose_1(Message, A) if (3 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A]; _LOG_Message("Verbose", _msg) };
    #define Verbose_2(Message, A,B) if (3 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B]; _LOG_Message("Verbose", _msg) };
    #define Verbose_3(Message, A,B,C) if (3 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C]; _LOG_Message("Verbose", _msg) };
    #define Verbose_4(Message, A,B,C,D) if (3 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C,D]; _LOG_Message("Verbose", _msg) };
    #define Verbose_5(Message, A,B,C,D,E) if (3 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C,D,E]; _LOG_Message("Verbose", _msg) };
    #define Verbose_6(Message, A,B,C,D,E,F) if (3 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C,D,E,F]; _LOG_Message("Verbose", _msg) };
    #define Verbose_7(Message, A,B,C,D,E,F,G) if (3 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C,D,E,F,G]; _LOG_Message("Verbose", _msg) };
    #define Verbose_8(Message, A,B,C,D,E,F,G,H) if (3 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C,D,E,F,G,H]; _LOG_Message("Verbose", _msg) };
    #define ServerVerbose(Message) if (3 < VARDEF(LogLevel,4)) then { _LOG_ServerMessage("Verbose", format [Message]) };
    #define ServerVerbose_1(Message, A) if (3 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A]; _LOG_ServerMessage("Verbose", _msg) };
    #define ServerVerbose_2(Message, A,B) if (3 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B]; _LOG_ServerMessage("Verbose", _msg) };
    #define ServerVerbose_3(Message, A,B,C) if (3 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C]; _LOG_ServerMessage("Verbose", _msg) };
    #define ServerVerbose_4(Message, A,B,C,D) if (3 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C,D]; _LOG_ServerMessage("Verbose", _msg) };
    #define ServerVerbose_5(Message, A,B,C,D,E) if (3 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C,D,E]; _LOG_ServerMessage("Verbose", _msg) };
    #define ServerVerbose_6(Message, A,B,C,D,E,F) if (3 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C,D,E,F]; _LOG_ServerMessage("Verbose", _msg) };
    #define ServerVerbose_7(Message, A,B,C,D,E,F,G) if (3 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C,D,E,F,G]; _LOG_ServerMessage("Verbose", _msg) };
    #define ServerVerbose_8(Message, A,B,C,D,E,F,G,H) if (3 < VARDEF(LogLevel,4)) then { private _msg = format [Message,A,B,C,D,E,F,G,H]; _LOG_ServerMessage("Verbose", _msg) };
    #define VerboseArray(Message, Array) if (3 < VARDEF(LogLevel,4)) then { _LOG_Message("Verbose", (Message + " [" + _LOG_newLine + (Array joinString _LOG_newLine) + _LOG_newLine + "]")) };
    #define ServerVerboseArray(Message, Array) if (3 < VARDEF(LogLevel,4)) then { _LOG_ServerMessage("Verbose", (Message + " [" + _LOG_newLine + (Array joinString _LOG_newLine) + _LOG_newLine + "]")) };
    #define VerboseArrayFormat(Message, Frmat, Array) if (3 < VARDEF(LogLevel,4)) then { _LOG_Message("Verbose", (Message + " [" + _LOG_newLine + (Array apply {format ([Frmat] + _x)} joinString _LOG_newLine) + _LOG_newLine + "]")) };
    #define ServerVerboseArrayFormat(Message, Frmat, Array) if (3 < VARDEF(LogLevel,4)) then { _LOG_ServerMessage("Verbose", (Message + " [" + _LOG_newLine + (Array apply {format ([Frmat] + _x)} joinString _LOG_newLine) + _LOG_newLine + "]")) };
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
