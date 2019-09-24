	params ["_mrkName"];

	private _return = allMapMarkers select { ((_x splitString "_") select 0) == _mrkName };

	_return
