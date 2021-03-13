/*
    Author: [Håkon]
    Description:
        SQF log macros, includes server log macros.

        Types: Error, Info, Debug, Trace
        to log to the server prefix Server to it.
        to log arguments add _n to the end, n being amount of arguments
        maximum arguments: 8

        Log output: "{Time UTC} | {Prefix} | {Log level} | File: {filename} | {Message}"
        To server: "{Time UTC} | {Prefix} | {Log level} | File: {filename} | {Message} | Client {Player} [clientOwner]"

    Scope: Any
    Environment: Any
    Public: Yes
    Dependencies: SQF

    Example:
        Trace_2("somelog to client | Var1: %1 | Var2: %2", _a, _b);
        ServerInfo("Some log to the server");

    License: MIT License
*/
#define _LOG_prefix "Antistasi"

//Enabling log types
#define Log_Error
#define Log_Info
#ifdef __A3_DEBUG__
    #define Log_Debug
    #define Log_Trace
#endif

//filename parser
private _LOG_file = {
    private _fileName = reverse _this;
    private _index = _fileName find "\";
    reverse (_fileName select [0,_index]);
};
private _time = systemTimeUTC;
private _timeText = str (_time#0) +"-"+ str (_time#1) +"-"+ str (_time#2) +" "+ str (_time#3) +":"+ str (_time#4) +":"+ str (_time#5) +":"+ str (_time#6);

//log macros
#ifdef Log_Error
    #define Error(Message) diag_log text (_timeText + " | " + _LOG_prefix + " | Error | File: " + (__FILE__ call _LOG_file) + " | " + Message)
    #define Error_1(Message, A) diag_log text (_timeText + " | " + _LOG_prefix + " | Error | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A])
    #define Error_2(Message, A,B) diag_log text (_timeText + " | " + _LOG_prefix + " | Error | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B])
    #define Error_3(Message, A,B,C) diag_log text (_timeText + " | " + _LOG_prefix + " | Error | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C])
    #define Error_4(Message, A,B,C,D) diag_log text (_timeText + " | " + _LOG_prefix + " | Error | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D])
    #define Error_5(Message, A,B,C,D,E) diag_log text (_timeText + " | " + _LOG_prefix + " | Error | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E])
    #define Error_6(Message, A,B,C,D,E,F) diag_log text (_timeText + " | " + _LOG_prefix + " | Error | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E,F])
    #define Error_7(Message, A,B,C,D,E,F,G) diag_log text (_timeText + " | " + _LOG_prefix + " | Error | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E,F,G])
    #define Error_8(Message, A,B,C,D,E,F,G,H) diag_log text (_timeText + " | " + _LOG_prefix + " | Error | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E,F,G,H])
    #define ServerError(Message) (text (_timeText + " | " + _LOG_prefix + " | Error | File: " + (__FILE__ call _LOG_file) + " | " + Message + format [" | Client: %1 [%2]", player, clientOwner])) remoteExec ["diag_log", 2]
    #define ServerError_1(Message, A) (text (_timeText + " | " + _LOG_prefix + " | Error | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A] + format [" | Client: %1 [%2]", player, clientOwner])) remoteExec ["diag_log", 2]
    #define ServerError_2(Message, A,B) (text (_timeText + " | " + _LOG_prefix + " | Error | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B] + format [" | Client: %1 [%2]", player, clientOwner])) remoteExec ["diag_log", 2]
    #define ServerError_3(Message, A,B,C) (text (_timeText + " | " + _LOG_prefix + " | Error | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C] + format [" | Client: %1 [%2]", player, clientOwner])) remoteExec ["diag_log", 2]
    #define ServerError_4(Message, A,B,C,D) (text (_timeText + " | " + _LOG_prefix + " | Error | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D] + format [" | Client: %1 [%2]", player, clientOwner])) remoteExec ["diag_log", 2]
    #define ServerError_5(Message, A,B,C,D,E) (text (_timeText + " | " + _LOG_prefix + " | Error | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E] + format [" | Client: %1 [%2]", player, clientOwner])) remoteExec ["diag_log", 2]
    #define ServerError_6(Message, A,B,C,D,E,F) (text (_timeText + " | " + _LOG_prefix + " | Error | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E,F] + format [" | Client: %1 [%2]", player, clientOwner])) remoteExec ["diag_log", 2]
    #define ServerError_7(Message, A,B,C,D,E,F,G) (text (_timeText + " | " + _LOG_prefix + " | Error | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E,F,G] + format [" | Client: %1 [%2]", player, clientOwner])) remoteExec ["diag_log", 2]
    #define ServerError_8(Message, A,B,C,D,E,F,G,H) (text (_timeText + " | " + _LOG_prefix + " | Error | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E,F,G,H] + format [" | Client: %1 [%2]", player, clientOwner])) remoteExec ["diag_log", 2]
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
#endif

#ifdef Log_Info
    #define Info(Message) diag_log text (_timeText + " | " + _LOG_prefix + " | Info | File: " + (__FILE__ call _LOG_file) + " | " + Message)
    #define Info_1(Message, A) diag_log text (_timeText + " | " + _LOG_prefix + " | Info | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A])
    #define Info_2(Message, A,B) diag_log text (_timeText + " | " + _LOG_prefix + " | Info | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B])
    #define Info_3(Message, A,B,C) diag_log text (_timeText + " | " + _LOG_prefix + " | Info | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C])
    #define Info_4(Message, A,B,C,D) diag_log text (_timeText + " | " + _LOG_prefix + " | Info | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D])
    #define Info_5(Message, A,B,C,D,E) diag_log text (_timeText + " | " + _LOG_prefix + " | Info | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E])
    #define Info_6(Message, A,B,C,D,E,F) diag_log text (_timeText + " | " + _LOG_prefix + " | Info | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E,F])
    #define Info_7(Message, A,B,C,D,E,F,G) diag_log text (_timeText + " | " + _LOG_prefix + " | Info | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E,F,G])
    #define Info_8(Message, A,B,C,D,E,F,G,H) diag_log text (_timeText + " | " + _LOG_prefix + " | Info | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E,F,G,H])
    #define ServerInfo(Message) (text (_timeText + " | " + _LOG_prefix + " | Info | File: " + (__FILE__ call _LOG_file) + " | " + Message + format [" | Client: %1 [%2]", player, clientOwner])) remoteExec ["diag_log", 2]
    #define ServerInfo_1(Message, A) (text (_timeText + " | " + _LOG_prefix + " | Info | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A] + format [" | Client: %1 [%2]", player, clientOwner])) remoteExec ["diag_log", 2]
    #define ServerInfo_2(Message, A,B) (text (_timeText + " | " + _LOG_prefix + " | Info | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B] + format [" | Client: %1 [%2]", player, clientOwner])) remoteExec ["diag_log", 2]
    #define ServerInfo_3(Message, A,B,C) (text (_timeText + " | " + _LOG_prefix + " | Info | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C] + format [" | Client: %1 [%2]", player, clientOwner])) remoteExec ["diag_log", 2]
    #define ServerInfo_4(Message, A,B,C,D) (text (_timeText + " | " + _LOG_prefix + " | Info | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D] + format [" | Client: %1 [%2]", player, clientOwner])) remoteExec ["diag_log", 2]
    #define ServerInfo_5(Message, A,B,C,D,E) (text (_timeText + " | " + _LOG_prefix + " | Info | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E] + format [" | Client: %1 [%2]", player, clientOwner])) remoteExec ["diag_log", 2]
    #define ServerInfo_6(Message, A,B,C,D,E,F) (text (_timeText + " | " + _LOG_prefix + " | Info | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E,F] + format [" | Client: %1 [%2]", player, clientOwner])) remoteExec ["diag_log", 2]
    #define ServerInfo_7(Message, A,B,C,D,E,F,G) (text (_timeText + " | " + _LOG_prefix + " | Info | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E,F,G] + format [" | Client: %1 [%2]", player, clientOwner])) remoteExec ["diag_log", 2]
    #define ServerInfo_8(Message, A,B,C,D,E,F,G,H) (text (_timeText + " | " + _LOG_prefix + " | Info | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E,F,G,H] + format [" | Client: %1 [%2]", player, clientOwner])) remoteExec ["diag_log", 2]
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
#endif

#ifdef Log_Debug
    #define Debug(Message) diag_log text (_timeText + " | " + _LOG_prefix + " | Debug | File: " + (__FILE__ call _LOG_file) + " | " + Message)
    #define Debug_1(Message, A) diag_log text (_timeText + " | " + _LOG_prefix + " | Debug | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A])
    #define Debug_2(Message, A,B) diag_log text (_timeText + " | " + _LOG_prefix + " | Debug | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B])
    #define Debug_3(Message, A,B,C) diag_log text (_timeText + " | " + _LOG_prefix + " | Debug | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C])
    #define Debug_4(Message, A,B,C,D) diag_log text (_timeText + " | " + _LOG_prefix + " | Debug | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D])
    #define Debug_5(Message, A,B,C,D,E) diag_log text (_timeText + " | " + _LOG_prefix + " | Debug | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E])
    #define Debug_6(Message, A,B,C,D,E,F) diag_log text (_timeText + " | " + _LOG_prefix + " | Debug | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E,F])
    #define Debug_7(Message, A,B,C,D,E,F,G) diag_log text (_timeText + " | " + _LOG_prefix + " | Debug | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E,F,G])
    #define Debug_8(Message, A,B,C,D,E,F,G,H) diag_log text (_timeText + " | " + _LOG_prefix + " | Debug | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E,F,G,H])
    #define ServerDebug(Message) (text (_timeText + " | " + _LOG_prefix + " | Debug | File: " + (__FILE__ call _LOG_file) + " | " + Message + format [" | Client: %1 [%2]", player, clientOwner])) remoteExec ["diag_log", 2]
    #define ServerDebug_1(Message, A) (text (_timeText + " | " + _LOG_prefix + " | Debug | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A] + format [" | Client: %1 [%2]", player, clientOwner])) remoteExec ["diag_log", 2]
    #define ServerDebug_2(Message, A,B) (text (_timeText + " | " + _LOG_prefix + " | Debug | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B] + format [" | Client: %1 [%2]", player, clientOwner])) remoteExec ["diag_log", 2]
    #define ServerDebug_3(Message, A,B,C) (text (_timeText + " | " + _LOG_prefix + " | Debug | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C] + format [" | Client: %1 [%2]", player, clientOwner])) remoteExec ["diag_log", 2]
    #define ServerDebug_4(Message, A,B,C,D) (text (_timeText + " | " + _LOG_prefix + " | Debug | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D] + format [" | Client: %1 [%2]", player, clientOwner])) remoteExec ["diag_log", 2]
    #define ServerDebug_5(Message, A,B,C,D,E) (text (_timeText + " | " + _LOG_prefix + " | Debug | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E] + format [" | Client: %1 [%2]", player, clientOwner])) remoteExec ["diag_log", 2]
    #define ServerDebug_6(Message, A,B,C,D,E,F) (text (_timeText + " | " + _LOG_prefix + " | Debug | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E,F] + format [" | Client: %1 [%2]", player, clientOwner])) remoteExec ["diag_log", 2]
    #define ServerDebug_7(Message, A,B,C,D,E,F,G) (text (_timeText + " | " + _LOG_prefix + " | Debug | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E,F,G] + format [" | Client: %1 [%2]", player, clientOwner])) remoteExec ["diag_log", 2]
    #define ServerDebug_8(Message, A,B,C,D,E,F,G,H) (text (_timeText + " | " + _LOG_prefix + " | Debug | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E,F,G,H] + format [" | Client: %1 [%2]", player, clientOwner])) remoteExec ["diag_log", 2]
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
#endif

#ifdef Log_Trace
    #define Trace(Message) diag_log text (_timeText + " | " + _LOG_prefix + " | Trace | File: " + (__FILE__ call _LOG_file) + " | " + Message)
    #define Trace_1(Message, A) diag_log text (_timeText + " | " + _LOG_prefix + " | Trace | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A])
    #define Trace_2(Message, A,B) diag_log text (_timeText + " | " + _LOG_prefix + " | Trace | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B])
    #define Trace_3(Message, A,B,C) diag_log text (_timeText + " | " + _LOG_prefix + " | Trace | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C])
    #define Trace_4(Message, A,B,C,D) diag_log text (_timeText + " | " + _LOG_prefix + " | Trace | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D])
    #define Trace_5(Message, A,B,C,D,E) diag_log text (_timeText + " | " + _LOG_prefix + " | Trace | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E])
    #define Trace_6(Message, A,B,C,D,E,F) diag_log text (_timeText + " | " + _LOG_prefix + " | Trace | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E,F])
    #define Trace_7(Message, A,B,C,D,E,F,G) diag_log text (_timeText + " | " + _LOG_prefix + " | Trace | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E,F,G])
    #define Trace_8(Message, A,B,C,D,E,F,G,H) diag_log text (_timeText + " | " + _LOG_prefix + " | Trace | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E,F,G,H])
    #define ServerTrace(Message) (text (_timeText + " | " + _LOG_prefix + " | Trace | File: " + (__FILE__ call _LOG_file) + " | " + Message + format [" | Client: %1 [%2]", player, clientOwner])) remoteExec ["diag_log", 2]
    #define ServerTrace_1(Message, A) (text (_timeText + " | " + _LOG_prefix + " | Trace | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A] + format [" | Client: %1 [%2]", player, clientOwner])) remoteExec ["diag_log", 2]
    #define ServerTrace_2(Message, A,B) (text (_timeText + " | " + _LOG_prefix + " | Trace | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B] + format [" | Client: %1 [%2]", player, clientOwner])) remoteExec ["diag_log", 2]
    #define ServerTrace_3(Message, A,B,C) (text (_timeText + " | " + _LOG_prefix + " | Trace | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C] + format [" | Client: %1 [%2]", player, clientOwner])) remoteExec ["diag_log", 2]
    #define ServerTrace_4(Message, A,B,C,D) (text (_timeText + " | " + _LOG_prefix + " | Trace | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D] + format [" | Client: %1 [%2]", player, clientOwner])) remoteExec ["diag_log", 2]
    #define ServerTrace_5(Message, A,B,C,D,E) (text (_timeText + " | " + _LOG_prefix + " | Trace | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E] + format [" | Client: %1 [%2]", player, clientOwner])) remoteExec ["diag_log", 2]
    #define ServerTrace_6(Message, A,B,C,D,E,F) (text (_timeText + " | " + _LOG_prefix + " | Trace | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E,F] + format [" | Client: %1 [%2]", player, clientOwner])) remoteExec ["diag_log", 2]
    #define ServerTrace_7(Message, A,B,C,D,E,F,G) (text (_timeText + " | " + _LOG_prefix + " | Trace | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E,F,G] + format [" | Client: %1 [%2]", player, clientOwner])) remoteExec ["diag_log", 2]
    #define ServerTrace_8(Message, A,B,C,D,E,F,G,H) (text (_timeText + " | " + _LOG_prefix + " | Trace | File: " + (__FILE__ call _LOG_file) + " | " + format [Message,A,B,C,D,E,F,G,H] + format [" | Client: %1 [%2]", player, clientOwner])) remoteExec ["diag_log", 2]
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
#endif
