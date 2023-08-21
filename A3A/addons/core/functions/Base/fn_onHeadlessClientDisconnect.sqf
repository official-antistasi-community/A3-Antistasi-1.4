#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

private _owner = param [4];

if (_owner in hcArray) then
{
	Info_2("Headless client ID %1 disconnected from HC array %2", _owner, hcArray);
	if ({owner _x == _owner} count allUnits > 0) then
	{
		A3A_HCErrorHandle = [] spawn {
			while {true} do
			{
				[petros,"hint","A Headless Client has been disconnected. This will cause malfunctions. Head back to HQ for saving ASAP and ask and Admin for a restart", "Headless Client"] remoteExec ["A3A_fnc_commsMP"];
				sleep 30;
			};
		};
	}
	else
	{
		hcArray = hcArray - [_owner];
	};
};

//STR_A3A_fn_base_hcdics_hc - needs implementation in line 14
//STR_A3A_fn_base_hcdics_warning - needs implementation in line 14
