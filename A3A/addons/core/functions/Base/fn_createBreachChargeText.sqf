#define LINE_BREAK      "<br></br>"

private _array = _this;
private _text = "";

for "_count" from 0 to ((count _array) - 1) do
{
    private _charge = _array select _count;
    private _name = getText (configFile >> "CfgMagazines" >> (_charge select 0) >> "displayName");
    private _amount = _charge select 1;
    _text = format ["%1%2%3x %4", _text, LINE_BREAK, _amount, _name];
    if(_count != ((count _array) - 1)) then
    {
        _text = format ["%1 OR", _text];
    };
};

_text;
