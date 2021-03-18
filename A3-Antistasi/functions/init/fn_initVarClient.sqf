/**
 * This file is called AFTER initVarServer.sqf, on both the client and server.
 */
scriptName "initVarClient.sqf";
#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
Info("initVarClient started");

//Is music enabled
musicON = false;

//True when the client is saving
savingClient = false;

//Prevents units being recruited too soon after being dismissed.
recruitCooldown = 0;

incomeRep = false;

//Should AI automatically heal teammates. Each client has their own copy of this.
autoHeal = false;

Info("initVarClient completed");
