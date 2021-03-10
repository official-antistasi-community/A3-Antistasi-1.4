//JNL mounting nodes for cargo and statics.
A3A_logistics_vehicleHardpoints append [
  //4x4s
  //pegaso open
  ["\ffaa_et_pegaso\ffaa_et_pegaso.p3d",[
    [1,             [0,-0.6,-0.55],         [2,3,4]],
    [1,             [0,-1.4,-0.55],         [5,6]],
    [1,             [0,-2.2,-0.55],         [7,8]],
    [1,             [0,-3,-0.55],           [1,9]],
    [1,             [0,-3.8,-0.55],         [10,11]]
  ]],
  //6x6s
  //m250 (all variants share a model)
  ["\ffaa_et_pegaso\ffaa_et_m250_blindado.p3d",[
    [1,             [-0.1,0.9,-0.6],        [10,12,13]],
    [1,             [-0.1,0.1,-0.6],        [11]],
    [1,             [-0.1,-0.7,-0.6],       [8,9]],
    [1,             [-0.1,-1.5,-0.6],       [6,7]],
    [1,             [-0.1,-2.3,-0.6],       [4,5]],
    [1,             [-0.1,-3.1,-0.6],       [14,15]]
  ]]
  //8x8s

//Boats

];

//Offsets for adding new statics/boxes to the JNL script.
A3A_logistics_attachmentOffset append [];

//all vehicles with jnl loading nodes where the nodes are not located in the open, this can be because its inside the vehicle or it has a cover over the loading plane.
A3A_logistics_coveredVehicles append [];

//if you want a weapon to be loadable you need to add it to this as a array of [model, [blacklist specific vehicles]],
//if the vehicle is in the coveredVehicles array dont add it to the blacklist in this array.
A3A_logistics_weapons append [];
