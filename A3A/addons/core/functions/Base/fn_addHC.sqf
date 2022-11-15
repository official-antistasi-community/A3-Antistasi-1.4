#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
_clientID = _this select 0;
hcArray pushBackUnique _clientID;
Info_1("Headless Client Connected: %1.",hcArray);
