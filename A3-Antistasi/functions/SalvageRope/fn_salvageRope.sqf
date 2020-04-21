params ["_target", "_caller", "_actionId"];
if !(isNil "_caller") then {
	if (isNil {_target getVariable "ropeActive"}) then {
		//deploys rope
		_target setVariable ["ropeActive", true, true];
		_target setVariable ["Rope", (ropeCreate [_target, [0,-2.8,-0.8], _caller, [0,0,0], 50]), true];
		_target addAction [
			"Put away winch", 
			{
				params ["_target", "_caller", "_iD"];
				[_target, _caller, _iD] call A3A_fnc_SalvageRope;
			},
			[], 
			1.5,  
			true,  
			true,  
			"", 
			"!(_this in _target)", 
			3
		];
		_target removeAction _actionId;
	} else {
		//stows rope
		if !(isNil {_target getVariable "Rope"}) then {
			ropeDestroy (_target getVariable "Rope");
			_target setVariable ["ropeActive", nil, true];
			_target removeAction _actionId;
		};
		_target addAction [
			"deploy winch", 
			{
				params ["_target", "_caller", "_iD"];
				[_target, _caller, _iD] call A3A_fnc_SalvageRope;
			},
			[], 
			1.5,  
			true,  
			true,  
			"", 
			"!(_this in _target)", 
			3
		];
	};
} else {
	//if no winch action exist on object
	_target addAction [
			"deploy winch", 
			{
				params ["_target", "_caller", "_iD"];
				[_target, _caller, _iD] call A3A_fnc_SalvageRope;
			},
			[], 
			1.5,  
			true,  
			true,  
			"", 
			"!(_this in _target)", 
			3
		];
};