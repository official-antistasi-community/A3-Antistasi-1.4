private["_item","_array","_return"];
_array = _this select 0;
_item = _this select 1;

_return = 0;
{
	if((_x select 0) isEqualTo _item)exitWith{_return = (_x select 1)};
}forEach _array;

_return;