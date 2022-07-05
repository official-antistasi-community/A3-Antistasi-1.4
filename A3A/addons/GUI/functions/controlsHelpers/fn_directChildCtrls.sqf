/*
Author: Håkon
Description:
    Returns a list of controls that are the direct children controls of a controlsGroup

Arguments: Controls group control

Return Value:
<Array<Controls>> Child controls

Scope: Any
Environment: Any
Public: Yes
Dependencies:

Example:

License: MIT License
*/
(allControls _this) select {ctrlParentControlsGroup _x isEqualTo _this};
