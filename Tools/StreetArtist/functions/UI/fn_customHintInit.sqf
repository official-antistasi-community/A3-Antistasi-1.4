/*
Function:
    A3A_fnc_customHintInit

Description:
   Adds EH to detect key/mouse presses to hide hints.
   Defines many important variables for customHintXXX and shader_ratioToHex.
   Starts loops for key detection/hint rendering.

Scope:
    <LOCAL> Execute on each player ONCE to add necessary EHs and variables.

Environment:
    <ANY>

Returns:
    <ANY> nil

Examples:
// in function definitions
    class customHintInit { preInit = 1; };

Author: Caleb Serafin
License: MIT License, Copyright (c) 2019 Barbolani & The Official AntiStasi Community
*/

private _filename = "fn_customHintInit.sqf";

if (!hasInterface) exitWith {}; // Disabled for server & HC.
// These var names don't need to be limited to 16chars for performance as they are not public.
A3A_customHint_MSGs = [];  // Operates as a upside-down stack (new messages pushed-Back are displayed.)
A3A_customHint_previousMSGs = [];
A3A_customHint_updateTime = 0;
A3A_customHint_cachedStructuredText = parseText "";
A3A_customHint_playPing = false;
A3A_const_emptyText = parseText "";
A3A_customHint_const_logo = parseText ("<img size='"+str(2.1*A3A_NGSA_baseTextSize)+"' color='#ffa71f1f' shadowOffset='0.063' image='a3\ui_f\data\Logos\arma3_shadow_ca.paa'/><t size='"+str(1.89*A3A_NGSA_baseTextSize)+"' color='#ffa71f1f' font='PuristaSemiBold' >Street Artist</t>");
//A3A_customHint_const_divider = composeText [lineBreak,parseText "<img size='0.25' color='#e6b24a' image='a3\ui_f\data\GUI\RscCommon\RscProgress\progressbar_ca.paa' />",lineBreak];
A3A_customHint_const_divider = composeText [lineBreak,parseText ("<t size='"+str(0.1*A3A_NGSA_baseTextSize)+"'> </t>"),lineBreak];

A3A_customHint_hexChars = ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"];

addMissionEventHandler ["EachFrame", {
    if (A3A_customHint_updateTime <= serverTime -15) then {
        A3A_customHint_updateTime = serverTime;
        [] call A3A_fnc_customHintRender;
    };
}];

nil;

