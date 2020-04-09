params["_detainee"];
if ([] call BIS_fnc_admin > 0 || isServer) then 
{ 
	["Punishment", format ["%1 has been found guilty of TK.<br/><br/>If you believe this is a mistake, you can forgive him with a scroll-menu action on hist body.<br/><br/>He is at the bottom left corner of the map.",name _detainee]] call A3A_fnc_customHint;
};