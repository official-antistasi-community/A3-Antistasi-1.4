params["_detainee"];
if ([] call BIS_fnc_admin > 0 || isServer) then 
{ 
	hint format ["%1 has been found guilty of TK.\nIf you believe this is a mistake, you can forgive him with a scroll-menu action on hist body.\nHe is at the bottom left corner of the map.",name _detainee];
};