//Original Author: Barbolani
//Edited and updated by the Antstasi Community Development Team

params ["_markerX"];

private _posMarker = getMarkerPos _markerX;
private _arrayCities = citiesX select {(getMarkerPos _x) distance _posMarker < 3000};

_arrayCities - [_markerX]
