_clientID = _this select 0;
waitUntil {sleep 1;!(isNil "hcArray")};
hcArray pushBackUnique _clientID;
diag_log format ["Antistasi: HC added to the array: %1",hcArray];