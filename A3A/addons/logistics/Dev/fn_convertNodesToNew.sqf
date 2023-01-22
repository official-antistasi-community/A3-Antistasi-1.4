//generate node classes from old hardpoints list
private _entries = [];
{
    private _nodes = [];
    {
        private _offsetArray = str (_x#1);
        private _seatArray = str (_x#2);

        _nodes pushBack text (format [
            "        class %1%4        {%4            offset[] = {%2};%4            seats[] = {%3};%4        };",
            "Node"+ str (_forEachIndex + 1),
            _offsetArray select [1, count _offsetArray - 2],
            _seatArray select [1, count _seatArray - 2],
            endl
        ]);
    } forEach (_x#1);

    private _nodesString = "    class Nodes" + endl + "    {" + endl + (_nodes joinString endl) + endl + "    };";

    _entries pushBack text (format [
        "class %1 : TRIPLES(ADDON,Nodes,Base) %4{%4%2%3%4};%4",
        ((_x#0) splitString "\.") joinString "_",
        ["","    canLoadWeapon = 0;"+endl] select ((_x#0) in A3A_Logistics_coveredVehicles),
        _nodesString,
        endl
    ])
} forEach A3A_Logistics_vehicleHardpoints;

text (_entries joinString endl);
