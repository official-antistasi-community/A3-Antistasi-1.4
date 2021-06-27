1. Quick way to convert navpoint -> road, if there is a valid road. May need to precalc this if it's sufficiently problematic.
2. Avoid placing two navpoints on the same road according to the mapping from 1. Adjacent roads is probably ok.
3. If there's no road path between two navpoints (following the fancy version of roadsConnectedTo with track/road/mainroad), then one of the navpoints should have no associated road.
4. Double wide highways might cause problems if they're wrongly cross-connected with roadsConnectedTo [x, true], but there won't be anything you can do about that. Two nav paths is fine and probably preferable.
5. There are theoretical issues with islands where the nearest road is on a dead island but >300m from a valid navpoint, but I don't think that's your problem. Marker to navpoint mapping needs a better solution in general.
6. For the field-crossing case, the ideal would be to add a roadless navpoint in the middle of the field. Similarly for roadless bridges. Therefore Z-Axis wil be required.
7. The closest road to any nabPoint is part of the same line.
8. There should be auto snapping to allow the editor to create nodes exactly on roads.
9. Road coordinates should be in ATL.
