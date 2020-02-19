params ["_caller", "_squadLeader", "_hasIntel", "_searchAction"];

/*  Searches a squadleader for intel
*   Params:
*       _caller : OBJECT : The unit which is searching
*       _squadLeader : OBJECT : The unit (or body) which holds the intel
*       _searchAction : NUMBER : The ID of the action which started this script
*
*   Returns:
*       Nothing
*/

[_squadLeader, _searchAction] remoteExec ["removeAction", [teamPlayer, civilian], _squadLeader];
private _timeForSearch = 10 + random 15;
private _side = _squadLeader getVariable "side";

_caller setVariable ["searchTime",time + _timeForSearch];
_caller setVariable ["animsDone",false];
_caller setVariable ["success",false];
_caller setVariable ["cancelSearch",false];

_caller playMoveNow selectRandom medicAnims;
private _cancelAction = _caller addAction ["Cancel Search", {(_this select 1) setVariable ["cancelSearch",true]},nil,6,true,true,"","(isPlayer _this)"];

_caller addEventHandler
[
    "AnimDone",
    {
        private _caller = _this select 0;
        if
        (
            ([_caller] call A3A_fnc_canFight) &&                        //Caller is still able to fight
            {(time <= (_caller getVariable ["searchTime",time])) &&     //Time is not yet finished
            {!(_caller getVariable ["cancelSearch",false]) &&           //Search hasn't been cancelled
            {(isNull objectParent _caller)}}}                           //Caller has not entered a vehicle
        ) then
        {
            _caller playMoveNow selectRandom medicAnims;
        }
        else
        {
            _caller removeEventHandler ["AnimDone", _thisEventHandler];
            _caller setVariable ["animsDone",true];
            if
            (
                ([_caller] call A3A_fnc_canFight) &&                //Can fight
                {!(_caller getVariable ["cancelSearch",false]) &&   //Not cancelled
                {(isNull objectParent _caller)}}                     //Not in vehicle
            ) then
            {
                _caller setVariable ["success",true];
            };
        };
    }
];

waitUntil {sleep 0.5; _caller getVariable ["animsDone", false]};

_caller setVariable ["searchTime",nil];
_caller setVariable ["animsDone",nil];
_caller removeAction _cancelAction;

private _wasCancelled = _caller getVariable ["cancelSearch", false];
_caller setVariable ["cancelSearch", nil];

if(_wasCancelled) exitWith
{
    hint "Search cancelled";
};

if(_caller getVariable ["success", false]) then
{
    _caller setVariable ["success", nil];
    private _hasIntel = _squadLeader getVariable ["hasIntel", false];
    if(_hasIntel) then
    {
        hint "Search completed, intel found!";
        ["Small", _side] spawn A3A_fnc_selectIntel;
    }
    else
    {
        hint "Search completed, but you found nothing!";
    };
}
else
{
    [_squadLeader, "Small_Intel"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_squadLeader];
};
