_clientID = _this select 0;
waitUntil {sleep 1;!(isNil "hcArray")};
hcArray pushBackUnique _clientID;
diag_log format ["%1: [Antistasi] | INFO | Headless Client Connected: %2.",servertime, hcArray];