#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

/*
Returns the permissions of the given UID
*/

params [ ["_uid", "", [""]] ];

private _list = [] call FUNC(getExternalMemberListUIDs);

private _return = [];
if (_uid in _list) then {
	_return = ["kick", "ban", "restart"];
};

_return
