private _markerX = _this select 0;
private _posMarker = getMarkerPos _markerX;

private _arrayCities = (citiesX select {getMarkerPos _x distance _posMarker < 3000}) - [_markerX];

_arrayCities