//generate cargo class from old attachmentOffset list
private _entries = [];
{
    private _model = (_x#0);
    private _offset = str (_x#1);
    private _rotation = str (_x#2);
    private _weaponsIndex = A3A_Logistics_weapons findIf {(_x#0) isEqualTo _model};
    private _blackListText = if (_weaponsIndex isEqualTo -1) then {""} else { //cleaner to proccess this here than inline
        private _str = str (A3A_Logistics_weapons#_weaponsIndex#1);
        _str select [1, count _str -2]; //remove brackets
    };

    _entries pushBack text (format [
        "class %1 : TRIPLES(ADDON,Cargo,Base)%7{%7%2%3%4%5%6%7};%7",
        ((_x#0) splitString "\.") joinString "_",
        "    offset[] = {" + (_offset select [1, count _offset - 2]) + "};" + endl,
        "    rotation[] = {" + (_rotation select [1, count _rotation - 2]) + "};" + endl,
        "    size = "+ str (_x#3) + ";",
        ["", endl + "    recoil = " + str (_x#4) + ";"] select (count _x > 4),
        ["", endl + "    isWeapon = 1;" + endl + "    blackList[] = {" + _blackListText + "};"] select (-1 != _weaponsIndex),
        endl
    ]);
} forEach A3A_Logistics_attachmentOffset;

text (_entries joinString endl);
