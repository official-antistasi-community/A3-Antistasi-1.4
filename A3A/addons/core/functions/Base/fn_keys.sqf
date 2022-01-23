#include "\a3\ui_f\hpp\definedikcodes.inc"

_handled = false;
if (player getVariable ["incapacitated",false]) exitWith {_handled};
if (player getVariable ["owner",player] != player) exitWith {_handled};
_key = _this select 1;

switch (_key) do {
    case DIK_Y: {
        if (isNil"garageVeh") then {
            if (_this select 2) then {
                if (player == theBoss) then {
                    [] spawn A3A_fnc_artySupport;
                };
            } else {
                closedialog 0;
                createDialog "radio_comm";
            };
        };
    };

    case DIK_HOME: {
        if (!(_this select 4)) exitWith {};
        if (isNull (uiNameSpace getVariable "H8erHUD")) exitWith {};

        private _display = uiNameSpace getVariable "H8erHUD";
        private _infoBarControl = _display displayCtrl 1001;
        
        if (ctrlShown _infoBarControl) then {
            ["KEYS", true] call A3A_fnc_disableInfoBar; 
            [localize "STR_antistasi_dialogs_toggle_info_bar_title", localize "STR_antistasi_dialogs_toggle_info_bar_body_off", false] call A3A_fnc_customHint; 
        } else {
            ["KEYS", false] call A3A_fnc_disableInfoBar; 
            [localize "STR_antistasi_dialogs_toggle_info_bar_title", localize "STR_antistasi_dialogs_toggle_info_bar_body_on", false] call A3A_fnc_customHint; 
        };
    };

    case DIK_END: {
        if (!A3A_hasACEHearing) then {
            if (soundVolume <= 0.5) then {
                0.5 fadeSound 1;
                ["Ear Plugs", "You've taken out your ear plugs.", true] call A3A_fnc_customHint;
            } else {
                0.5 fadeSound 0.1;
                ["Ear Plugs", "You've inserted your ear plugs.", true] call A3A_fnc_customHint;
            };
        };
    };
};

_handled