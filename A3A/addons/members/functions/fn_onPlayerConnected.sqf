#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_id", "_uid", "_name", "_jip", "_owner"];

diag_log format ["[ASMS] Info: Player connected: %1", _this];

private _permissions = [_uid] call FUNC(getUIDPermissions);

if (_uid in ([] call FUNC(getExternalMemberListUIDs))) then {
// deactivated member restart script - Bob Murphy - 14.06.2020
/*	if ("restart" in _permissions) then {
		// Pass the functions to the client
		[missionNamespace, [QFUNC(createRestartDialog), FUNC(createRestartDialog)]] remoteExecCall ["setVariable", _owner];
		// Add the event handler to the player and show him a message
		[[], {
			waitUntil { ! isNull findDisplay 46 };
			(findDisplay 46) displayAddEventHandler ["KeyDown", {
				params ["_control", "_key", "_shift", "_ctrl", "_alt"];
					if (_key == 41 && _shift && _ctrl && _alt) then { // Tilde key + ctrl + alt + shift
						[] call FUNC(createRestartDialog);
					};
				}];
			systemChat "[Antistasi Members Addon] Member detected";
			systemChat "You have permissions to perform a mission restart. Push ALT + SHIFT + CTRL + [~] to open the dialog.";
		}] remoteExecCall ["spawn", _owner];
		diag_log "[ASMS] Member with restart permissions detected";
	} else { */
		[[], {
			waitUntil { ! isNull findDisplay 46 };
			systemChat "[Antistasi Members Addon] Member detected";
		}] remoteExecCall ["spawn", _owner];
		diag_log "[ASMS] Member detected";
	};
//};
