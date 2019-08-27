params ["_mrkName"];

private _return = allMapMarkers select { ((_x splitString "_") select 0) isEqualTo _mrkName };
_return
