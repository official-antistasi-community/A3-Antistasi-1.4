params [["_headerText", ""], ["_bodyText", ""], ["_isSilent", false]];

private _logo = "<img color='#ffffff' image='functions\UI\images\logo.paa' align='center' size='2' />";
private _separator = "<br/>";
private _header = format["<t size='1.2' color='#e5b348' shadow='1' shadowColor='#000000'>%1</t><br/><img color='#ffffff' image='functions\UI\images\img_line_ca.paa' align='center' size='0.60' />", _headerText];
private _body = format["<t size='1' color='#ffffff' shadow='1' shadowColor='#000000'>%1</t><br/><br/><img color='#ffffff' image='functions\UI\images\img_line_ca.paa' align='center' size='0.60' />", _bodyText];

if (_isSilent) then {
	hintSilent parseText format ["%1%2%3%4%5%6%7", _logo, _separator, _separator, _header, _separator,_separator, _body];
} else {
	hint parseText format ["%1%2%3%4%5%6%7", _logo, _separator, _separator, _header, _separator,_separator, _body];
};