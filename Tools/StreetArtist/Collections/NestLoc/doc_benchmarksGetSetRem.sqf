
private _totalTime = 0;
private _startTime;
for "_bucket" from 1 to 10 do {
	_startTime = diag_tickTime;
	[str _bucket,[]] call A3A_fnc_punishment_dataRem;
	_totalTime = _totalTime + diag_tickTime - _startTime;
};
[str (1000*_totalTime),"ms"] joinString "";  // 1.95313ms  O(n)


private _totalTime = 0;
private _startTime;
private _keyPairs = [];
for "_bucket" from 1 to 10 do {
	for "_i" from 1 to 1000 do {
		_keyPairs pushBack [str _i,str _i];
	};
	_startTime = diag_tickTime;
	[str _bucket,_keyPairs] call A3A_fnc_punishment_dataSet;
	_totalTime = _totalTime + diag_tickTime - _startTime;
};
[str (1000*_totalTime),"ms"] joinString "";  // 1x1000: 722.168ms; 10x1: 1.95313ms; 10x10: 10.7422ms; 10x100: 432.617ms; 10x1000: 40690.4ms; O(n^2)  O((n-1)^(n-1))  // AKA, train smash


private _totalTime = 0;
private _startTime;
private _keyPairs = [];
for "_bucket" from 1 to 10 do {
	for "_i" from 1 to 1000 do {
		_keyPairs pushBack [str _i,str _i];
	};
	_startTime = diag_tickTime;
	[str _bucket,_keyPairs] call A3A_fnc_punishment_dataGet;
	_totalTime = _totalTime + diag_tickTime - _startTime;
};
[str (1000*_totalTime),"ms"] joinString "";  // 1x1000: 698.73ms; 10x1: 0.976563ms; 10x10: 9.27734ms; 10x100: 423.828ms; 10x1000: 38228.5ms  O((n-1)^(n-1))  // AKA, train smash


private _totalTime = 0;
private _startTime;
private _out = [];
private _bucket;
private _keyPairs;
for "_i" from 1 to 1000*100 do {
	_bucket = floor(random 10) + 1;
	_keyPairs = [[str (floor(random 1000) + 1),"0"]];
	_startTime = diag_tickTime;
	_out pushBack ([str _bucket, _var] call A3A_fnc_punishment_dataGet);
	_totalTime = _totalTime + diag_tickTime - _startTime;
};
[str (1000*_totalTime),"ms"] joinString "";  // 1_000: 48.3398ms; 1_0000: 591.797ms; 100_000: 5410.64ms  O(n)



// Everything from this point on is less than O(n)

private _startTime = diag_tickTime;
for "_bucket" from 1 to 1000 do {
	[missionNamespace getVariable [str _bucket,locationNull]] call Col_fnc_nestLoc_rem;
};
[str (1000*(diag_tickTime - _startTime)),"ms"] joinString "";  // 100x1000: 562.988ms; 1000x1000: 5624.02ms;


private _startTime = diag_tickTime;
for "_bucket" from 1 to 1000 do {
	private _varspace = [missionNamespace, str _bucket, "0", "0"] call Col_fnc_nestLoc_set;
	for "_i" from 1 to 1000 do {
		_varspace setVariable [str _i,str _i];
	};
};
[str (1000*(diag_tickTime - _startTime)),"ms"] joinString "";  // 100x1000: 302.734ms; 1000x1000: 2861.33ms;


private _startTime = diag_tickTime;
private _out = [];
for "_bucket" from 1 to 1000 do {
	private _varspace = missionNamespace getVariable [str _bucket,locationNull];
	for "_i" from 1 to 1000 do {
		_out pushBack (_varspace getVariable [str _i,str _i]);
	};
};
[str (1000*(diag_tickTime - _startTime)),"ms"] joinString "";  // 100x1000: 314.941ms; 1000x1000: 3106.93ms;


private _totalTime = 0;
private _startTime;
private _out = [];
private _bucket;
private _var;
for "_i" from 1 to 1000*1000 do {
	_bucket = floor(random 1000) + 1;
	_var = floor(random 1000) + 1;
	_startTime = diag_tickTime;
	_out pushBack ([missionNamespace, str _bucket, str _var, "0"] call Col_fnc_nestLoc_get);
	_totalTime = _totalTime + diag_tickTime - _startTime;
};
[str (1000*_totalTime),"ms"] joinString "";  // 100_000: 1857.91ms; 1_000_000: 17996.6ms;








// How can the changes be tested? Use
count (nearestLocations [[0,0,0], ["Invisible"], 100000]);
// in watch field to count of locations.

// Standard Use
// (Execute in order)
[localNamespace, "A3A_UIDPlayers", "1234567890123456", "equipment", "weapon", "hgun_Pistol_heavy_01_F"] call Col_fnc_nestLoc_get;
// └ Should return hgun_Pistol_heavy_01_F

[localNamespace, "A3A_UIDPlayers", "1234567890123456", "equipment", "weapon", "SMG_02_F"] call Col_fnc_nestLoc_set;
// └ Should return Location Invisible at -10, -10; Location count increase by 3.

[localNamespace, "A3A_UIDPlayers", "1234567890123456", "equipment", "helmet", "H_Hat_grey"] call Col_fnc_nestLoc_set;
// └ Should return Location Invisible at -10, -10; Location count should not increase.

[localNamespace, "A3A_UIDPlayers", "1234567890123456", "equipment", "weapon", "hgun_Pistol_heavy_01_F"] call Col_fnc_nestLoc_get;
// └ Should return SMG_02_F

_parent = [localNamespace, "A3A_UIDPlayers", locationNull] call Col_fnc_nestLoc_get;
[_parent] call Col_fnc_nestLoc_rem;
[localNamespace, "A3A_UIDPlayers", "1234567890123456", "equipment", "weapon", "hgun_Pistol_heavy_01_F"] call Col_fnc_nestLoc_get;
// └ Should return hgun_Pistol_heavy_01_F; Location count decrases by 3;

// Recursion
// (Execute in order)

_parent = [localNamespace, "A3A_parent", "loop back", locationNull] call Col_fnc_nestLoc_set;
[localNamespace, "A3A_parent", "recursion", _parent] call Col_fnc_nestLoc_set;
[localNamespace, "A3A_parent", "recursion", "recursion", "recursion", "recursion", "recursion", "recursion", "recursion", "recursion", "recursion", locationNull] call Col_fnc_nestLoc_get;
// └ Should return Location Invisible at -10, -10; Location count increases by 1;

_parent  = [localNamespace, "A3A_parent", locationNull] call Col_fnc_nestLoc_get;
[_parent] call Col_fnc_nestLoc_rem;
[localNamespace, "A3A_parent", "recursion", "recursion", "recursion", "recursion", "recursion", "recursion", "recursion", "recursion", "recursion", locationNull] call Col_fnc_nestLoc_get;
// └ Should return No location; Location count decreases by 1;
