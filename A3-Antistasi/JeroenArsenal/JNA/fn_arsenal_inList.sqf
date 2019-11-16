

private["_list","_item","_return"];
_item = _this select 0;
_list = _this select 1;
_return = false;
{
	if(_item isEqualTo (_x select 0))exitwith{_return = true;};
}foreach _list;
_return;