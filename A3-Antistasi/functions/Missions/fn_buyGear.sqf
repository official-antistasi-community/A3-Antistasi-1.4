_crate = _this select 0;
_gearType = _this select 1;
_cost = _this select 2;

_resourcesFIA = server getVariable "resourcesFIA";

if (_resourcesFIA < _cost) exitWith {
	_dealer = player; // TODO: This should be the dealer NPC
	[_dealer,"sideChat","Get lost ya cheap wanker!"] remoteExec ["A3A_fnc_commsMP",[teamPlayer,civilian]]; // TODO: Only exec on targets near the dealer?
};

// TODO: Port rest of the script from XXX\Municion\buyGear.sqf