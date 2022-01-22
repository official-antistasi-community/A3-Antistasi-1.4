/*
    By: Jeroen Notenbomer

    Add amounts of same name togetter
    Use amount (-1) to set to unlimited

    Inputs:
        1: list         [["name1",amount1],["name2",amount2]]
        2: item         "name1" or ["name1",amount1] or [["name1",amount1],["name2",amount2]]

    Outputs
        list = Input1+Input2
*/

params["_list","_add"];
_list = +_list;
if(typeName _add isEqualTo "STRING")then{_add = [_add,1];};
if(typeName (_add select 0) isEqualTo "STRING")then{_add = [_add]};

{
    private _index = _forEachIndex;
    private _name = _x select 0;
    private _amount = _x select 1;


    if!(_name isEqualTo "")then{//skip empty

        private _found = false;
        {
            private _index2 = _forEachIndex;
            private _name2 = _x select 0;
            private _amount2 = _x select 1;

            if(_name isEqualTo _name2)exitWith{
                _found = true;    //found it, now update amount
                if(_amount == -1 || _amount2 == -1)then{
                    _list set [_index2, [_name,-1]];
                }else{
                    _list set [_index2, [_name,(_amount2 + _amount)]];
                };
            };

        }forEach _list;

        if(!_found)then{
            _list pushBack [_name, _amount]; //not found add new
        };
    };
}forEach _add;

_list; //return
