private _filename = "fn_salvageRope.sqf";
//TODO: Remove before final release
if (isRemoteExecutedJIP) then {[3, format ["Salvage Rope Action added on JIP client: %1", player], _filename, true] call A3A_fnc_log;};


//Deploy action
canDeployWinch = {
	private _vehicle = cursorTarget;
	if(_vehicle isKindOf "Ship") then {	
		vehicle player == player && player distance _vehicle < 10 && isNil {_vehicle getVariable "Rope"} && [_vehicle, boxX] call jn_fnc_logistics_canLoad != -3;
	} else {
		false;
	};
}; 

DeployWinch = {
	if (captive player) then {player setCaptive false};
	params ["_player"];
	private _vehicle = cursorTarget;
	_vehicle setVariable ["Rope", (ropeCreate [_vehicle, [0,-2.8,-0.8], _player, [0,0,0], 10]), true];
	_vehicle setVariable ["RopeUnit", _player, true];
	[_player, _vehicle] spawn adjustRope;
};

adjustRope = {
	params ["_player", "_vehicle"];
	while {!isNil {_vehicle getVariable "Rope"}} do {
		private _rope = _vehicle getVariable "Rope";
		private _dist = _vehicle distance _player;
		private _optimalDist = _dist + 3;
		private _maxDist = _dist + 7;
		if ((ropeLength _rope) < _dist) then {
			ropeUnwind [_rope, 10, _optimalDist];
		} else {
			if ((ropeLength _rope) > _maxDist) then {
				ropeUnwind [_rope, 10, _optimalDist];
			};
		};
		sleep 0.1;
	};
}; 

//Stow action
canStow = {
	private _vehicle = cursorTarget;
	if (isNull _vehicle) exitWith {false};
	private _ropeExist = if (!isNil {_vehicle getVariable "Rope"}) then {true} else {false};
	private _ropeOwner = if ((_vehicle getVariable "RopeUnit") == player) then {true} else {false};
	if ((_vehicle getVariable "RopeUnit") isEqualTo []) then {_ropeOwner = true}; //overide if none is on the rope end
	vehicle player == player && player distance _vehicle < 10 && _ropeExist && _ropeOwner;
};

stowRope = {
	params ["_player"];
	private _vehicle = cursorTarget;
	ropeDestroy (_vehicle getVariable "Rope");
	_vehicle setVariable ["Rope",nil,true];
	_vehicle setVariable ["RopeUnit",nil,true];
	
};

//Attach action
canAttach = {
	_cargo = cursorTarget;
	if(!isNull _cargo) then {
		player != _cargo && _cargo getVariable ["SalvageCrate", false] && player distance _cargo <= 10 && ((ropeAttachedTo player) getVariable "RopeUnit") == player;
	} else {
		false;
	};
};

attachRope = {
	private _cargo = cursorTarget;
	private ["_vehicle"];
	_vehicle = ropeAttachedTo player;
	_vehicle setVariable ["RopeUnit",_vehicle,true]; //to stop stow action from showing while recovering crate
	[player, false] remoteExec ["setCaptive"];
	[] spawn A3A_fnc_statistics;
	private _distance = _vehicle distance _cargo;
	private _unwind = _distance - 0.5;
	private _time = 5 + (_unwind*2);
	ropeDestroy (_vehicle getVariable "Rope");
	_vehicle setVariable ["Rope2", (ropeCreate [_vehicle, [0,-2.8,-0.8], _cargo, [0,0,0], _distance]), true];
	sleep 1;
	ropeUnwind [ropes _vehicle select 0, 0.5, -(_unwind), true];
	_vehicle lockCargo true;
	sleep _time;
	ropeDestroy (_vehicle getVariable "Rope2");
	[_vehicle, _cargo] call jn_fnc_logistics_load;
	_cargo call jn_fnc_logistics_addAction;
	_cargo setVariable ["SalvageCrate",nil,true];
	_vehicle setVariable ["Rope2",nil,true];
	_vehicle setVariable ["Rope",nil,true];
	_vehicle setVariable ["RopeUnit",nil,true];
};


//adding of actions
addplayerWinchActions = {
	player addAction ["Deploy Winch", {
		[player] call DeployWinch;
	}, nil, 0, false, true, "", "[] call canDeployWinch"];

	player addAction ["Stow Winch", {
		[player] call stowRope;
	}, nil, 0, false, true, "", "call canStow"];

	player addAction ["Attach Rope", {
		[player] spawn attachRope;
	}, nil, 0, false, true, "", "call canAttach"];

	if (isMultiplayer) then {
		player addEventHandler ["Respawn",{
			player setVariable ["SalvageRopeAction",false];
		}];
	};
};

[] spawn {
	private _missionComplete = false;
	while {!_missionComplete} do {
			if (!isNull player && isplayer player) then {
			if !(player getVariable ["SalvageRopeAction",false]) then {
				[] call addplayerWinchActions;
				player setVariable ["SalvageRopeAction",true];
			};
		};
		sleep 2;
		_missionComplete = "LOG" call BIS_fnc_taskCompleted;
	};
};
