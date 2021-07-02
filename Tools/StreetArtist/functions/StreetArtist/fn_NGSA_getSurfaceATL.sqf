/*
Maintainer: Caleb Serafin
    Returns the ASL height of the top surface under the specified point.
    Does not modify the input.

Arguments:
    <POS2D || POS3D> X and Y coordinate, Z is unused can can be omitted.
    <SCALAR> Z Position ATL to start scanning terrain height. 1000m leaves 3 decimal place precision, bigger numbers lose precision. [Default=1000]

Return Value:
    <POSATL> position on surface.

Scope: Any
Environment: Any
Public: Yes
Dependencies:
    <OBJECT> A3A_NGSA_heightTester

Example:
    [getPos player] call A3A_fnc_NGSA_getSurfaceATL;
*/
params [
    ["_pos",[],[ [] ],[2,3]],
    ["_zScanHeight",1000,[0]]
];
private _xComponent = _pos#0;
private _yComponent = _pos#1;
A3A_NGSA_heightTester setPosATL [_xComponent,_yComponent,_zScanHeight];
[_xComponent,_yComponent,_zScanHeight - ((getPos A3A_NGSA_heightTester)#2)];
