//Each element is: [model name, [nodes]]
//Nodes are build like this: [Available(internal use,  always 1), Hardpoint location, Seats locked when node is in use]
A3A_logistics_vehicleHardpoints append [
    ["\rds_a2port_civ\S1203\S1203",[[1,[0.24,-0.8,-1],[3,4]]]]
];
//all vehicles with jnl loading nodes where the nodes are not located in the open, this can be because its inside the vehicle or it has a cover over the loading plane.
A3A_logistics_coveredVehicles append ["RDS_S1203_Civ_01"];
