params ["_navData"];

_br = toString [13,10];
_text = "navGrid = [";
_counter = 0;

for "_i" from 0 to ((count _navData) - 2) do
{
  if(_counter < 5) then
  {
    _counter = _counter + 1;
    _text = [_text, str (_navData select _i), ", "] joinString "";
  }
  else
  {
    _counter = 0;
    _text = [_text, str (_navData select _i), ", ", _br] joinString "";
  };
};

_text = [_text, str (_navData select ((count _navData) - 1)), "];"] joinString "";

_text;
