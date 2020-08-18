//JNL mounting nodes for cargo and statics.
logistics_vehicleHardpoints append [
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
//Add to the weapon sets
jnl_smallVicWeapons append [];
jnl_largeVicWeapons append [];
//Weapon lists for each vehicle.
jnl_allowedWeapons append [];
//Offsets for adding new statics/boxes to the JNL script.
jnl_attachmentOffset append [];
