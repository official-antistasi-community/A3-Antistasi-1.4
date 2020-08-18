/*
This file covers:
  JNG Weapon hardpoints, for attaching statics to vehicles.
  JNL Crate loading points, for loading loot boxes and such.
  Compatible weapons for the above hardpoint system.
  Offsets for the statics/crates/anything else you want to make loadable onto vehicles.

These points are coordinates relative to the objects hitbox/mesh.
There is a command that can find the position on a vehicle that you are looking at available on the Git Repo's Wiki.
These coords generally don't have to be more that 2 decimal places for presision, more is just overkill and harms readability.

Always think of the next guy that may have to work on your code. Chances are it will be you!
*/

/*The first section is for setting the nodes that weapons and boxes should attach to.

    This has the model path for the vehicle, then 3 sections as follows; Node type, Node location and locked seats.

      The node type has 2 values, 0 and 1. 0 is for weapon nodes, i.e. where static turrets should attach to.

      The node location is a set of 3 coordinates in referance to the vehicle model, this defines where the node should be.

      The locked seat list is the set of seats that should be made unusable when the node has something on it.
      This stops people being clipped into the crate/static when it is loaded. It is populated with the seat IDs for each one to be disabled.
*/
logistics_vehicleHardpoints append [
  ["modelpath", [
    [0, [0,0,0], [1,2,3,4]],//This line would assign a weapon node at 0,0,0 on the model, and block seats 1-4 when in use.
    [1, [0,0,0], [1,2,3,4]]//This line would assign a cargo node at 0,0,0 on the model, and block seats 1-4 when in use.
  ]]
];//To make it easier to navigate, it is a good idea to keep the lines for similar vehicles together. Usually we list 4 wheeled vehicles, then 6 wheeled, then 8 wheeled, then boats. It is also good to keep multiple versions of the same vehicle together, such as covered and open versions of the same truck.

/*The next section is for adding static weapons to the weapon sets.
  The weapon sets are used to tell the game what weapons can be mounted on what vehicles and are seperated into 2 categories.
  smallVic and largeVic.
  smallVic is used for things like offroads, where low mounted weapons such as RHS's NSV cannot be used.
  largeVic is used for larger trucks where basically any weapon can be mounted and used.

  Adding weapons to these arrays is as simple as pasting the model path to the static weapon's model.
*/
jnl_smallVicWeapons append [
  "standingTurretModel"
];
jnl_largeVicWeapons append [
  "standingTurretModel",
  "sittingTurretModel"
];

/*The next section is for defining the weapons that can be mounted on a given vehicle.
  To do this we use the arrays we appended to above.
  This makes sure that the vehicle can mount all apropriate weapons from all mods loaded.

  This is done by adding array entries made up of the vehicle model path, followed by the correct array.
  The entries are usually seperated by an inline comment that says what vehicle the next entry is for, as model paths aren't always obvious.
*/
jnl_allowedWeapons append [
//Offroad
  ["offroadModelPath", jnl_smallVicWeapons],
//Truck
  ["truckModelPath", jnl_largeVicWeapons]
];

/*The last section is for defining the offsets for statics, crates and any other item you might want to load onto a vehicle.
  This is usually seperated into 3 sections; Weapons, Crates and Other.
  The first 2 are self explanatory, the 3rd is for things like quadbikes, as they can be loaded onto vehicles if they are initialised properly.
  This is filled by listing the model path, the coordinate offset(for tweaking it so that its base is centered on the node), and any angle offset it needs (in case the weapon should be facing any other direction than forward by default.), finally you list the node type that the entry should use (0 for weapons, 1 for anything else.)
*/
jnl_attachmentOffset append [
  ["modelPath",		[0, 0, 0],		[0,0,0],	0],//This would attach the model at its 0,0,0 coord to a weapon node.
  ["modelPath",		[0, 0, 0],		[0,0,0],	1]//This would attach the model at its 0,0,0 coord to a cargo node.
];

//That covers everything, you should make you file by replacing values in an already complete file rather than using this as the active files will have the propper commenting there already. Using this one would leave a tonne of unnecessary comments in the file.
