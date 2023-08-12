class SPE_ST_OpelBlitz : TRIPLES(ADDON,Nodes,Base) //Removable Canopy on both Covered and Open variant.
{
        class Nodes
    {
        class Node1
        {
            offset[] = {0,-0.8,-0.77};
            seats[] = {1,2,7,10};
        };
        class Node2
        {
            offset[] = {0,-1.6,-0.77};
            seats[] = {5,6,7};
        };
        class Node3
        {
            offset[] = {0,-2.4,-0.77};
            seats[] = {3,4,5,6};
        };
        class Node4
        {
            offset[] = {0,-3.2,-0.77};
            seats[] = {8,9};
        };
    };
};

class SPE_OpelBlitz : SPE_ST_OpelBlitz {};
class SPE_OpelBlitz_Open : SPE_ST_OpelBlitz {};
class SPE_ST_OpelBlitz_Open : SPE_ST_OpelBlitz {};
class SPE_FFI_OpelBlitz : SPE_ST_OpelBlitz {};
class SPE_FFI_OpelBlitz_Open : SPE_ST_OpelBlitz {};

class SPE_US_M3_Halftrack_Unarmed : TRIPLES(ADDON,Nodes,Base)
{
        class Nodes
    {
        class Node1
        {
            offset[] = {0,-0.4,-1.02};
            seats[] = {0,1,2,3,4,11};
        };
        class Node2
        {
            offset[] = {0,-1.2,-1.02};
            seats[] = {3,4,5,6}; //3,4 cause overlap
        };
        class Node3
        {
            offset[] = {0,-2,-1.02};
            seats[] = {7,8,9,10};
        };
    };
};
class SPE_FR_M3_Halftrack_Unarmed : SPE_US_M3_Halftrack_Unarmed {};

class SPE_US_M3_Halftrack : TRIPLES(ADDON,Nodes,Base)
{
        class Nodes
    {
        class Node1
        {
            offset[] = {0,-1.1,-1.01};
            seats[] = {3,4,5,6};
        };
        class Node2
        {
            offset[] = {0,-1.9,-1.01};
            seats[] = {1,7,8,9};
        };
    };
};
class SPE_FR_M3_Halftrack : SPE_US_M3_Halftrack {};