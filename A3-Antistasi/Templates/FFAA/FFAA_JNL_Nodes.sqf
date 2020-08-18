//JNL mounting nodes for cargo and statics.
logistics_vehicleHardpoints append [ // needs to be redone
//4x4s
//pegaso open
  ["\ffaa_et_pegaso\ffaa_et_pegaso.p3d",[
    [1,[0,-1,-0.5],[3,4,5,6,7]],
    [1,[0,-2.75,-0.5],[1,2,8,9,10]]
  ]],
//6x6s
//m250 (all variants share a model)
  ["\ffaa_et_pegaso\ffaa_et_m250_blindado.p3d",[
    [1,[-0,0.50,-0.5],[8,9,10,11,12,13]],
    [1,[-0,-1.25,-0.5],[4,5,6,7]],
    [1,[-0,-3,-0.5],[]]
  ]]
//8x8s

//Boats

];

//Offsets for adding new statics/boxes to the JNL script.
logistics_attachmentOffset append [];

//all vehicles with jnl loading nodes where the nodes are not located in the open, this can be because its inside the vehicle or it has a cover over the loading plane.
logistics_coveredVehicles append [];

//if you want a weapon to be loadable you need to add it to this as a array of [model, [blacklist specific vehicles]], 
//if the vehicle is in the coveredVehicles array dont add it to the blacklist in this array.
logistics_weapons append [];
