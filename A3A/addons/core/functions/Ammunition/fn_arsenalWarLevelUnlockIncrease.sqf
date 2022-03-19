


if (isNil "A3A_arsenalIncrease") then { A3A_arsenalIncrease = 5 };

if (isClass (configfile >> "CBA_Extended_EventHandlers")) then {
	["A3A_arsenalIncrease", "SLIDER", ["Arsenal Increase Unlock", "Arsenal increase per war level"], ["Antistasi","Arsenal"], [0, 10, 5, 0], true, {
        A3A_arsenalIncrease = round _this;
    }] call CBA_fnc_addSetting;

};






