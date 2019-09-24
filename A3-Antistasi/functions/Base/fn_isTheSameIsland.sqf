//This code detects if QRFs which are sent are within the same island and prevents vehicles wanting to drive through water to reinforce a position.
//Before this code was changed it was only functioning for Tanoa - now the code can be used with every map containing multipe island when the correct markers are placed.

if (count islands == 0) exitwith {true};

private _site1 = _this select 0;
private _posSite1 = if (_site1 isEqualType "") then {getMarkerPos _site1} else {_this select 0};

private _site2 = _this select 1;
private _posSite2 = if (_site2 isEqualType "") then {getMarkerPos _site2} else {_this select 1};

private _return = false;

{if(_posSite1 inArea _x) then {if(_posSite2 inArea _x) then {_return = true}}} forEach islands;
_return
