/*
    By: Jeroen Notenbomer

    Add amounts of same namee togetter
    Use amount -1 to remove unlimited items

    Inputs:
        1: list         [["name1",amount1],["name2",amount2]]
        2: item         "name1" or ["name1",amount1] or [["name1",amount1],["name2",amount2]]

    Outputs
        list = Input1-Input2
*/

params["_list","_remove"];
_list = +_list;

if(typeName _remove isEqualTo "STRING")then{_remove = [_remove,1];};
if(typeName (_remove select 0) isEqualTo "STRING")then{_remove = [_remove]};

{
    private _index = _forEachIndex;
    private _name = _x select 0;
    private _amount = _x select 1;

    if!(_name isEqualTo "")then{//skip items with no nam
        {
            private _index2 = _forEachIndex;
            private _name2 = _x select 0;
            private _amount2 = _x select 1;

            if(_name isEqualTo _name2)exitWith{

                if(_amount == -1 || _amount2 == -1)then{
                    if(_amount == -1)then{
                        _list set [_forEachIndex, -1]; //remove unlimited item
                    };
                }else{
                    private _newAmount = (_amount2 - _amount);
                    if(_newAmount > 0)then{
                        _list set [_forEachIndex, [_name, _newAmount]];
                    }else{
                        _list set [_forEachIndex, -1];//mark for removale
                    };
                };
            };
        }forEach _list;
    };
}forEach _remove;

_list = _list - [-1];
_list; //return this
