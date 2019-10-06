params ["_marker"];

/*  Returns the current state of a garrison as a string
*   Params:
*     _marker: STRING: The name of the marker
*
*   Returns:
*     _result: STRING: One of Good, Weakened and Decimated, depending on the state of the garrison
*/

if(isNil "_marker") exitWith {diag_log "GetGarrisonStatus: No marker given!";};

private ["_ratio", "_result"];

_ratio = ["_marker"] call A3A_fnc_getGarrisonRatio;

_result = "Decimated";
if(_ratio > 0.9) then
{
  _result = "Good"
}
else
{
  if(_ratio > 0.4) then
  {
    _result = "Weakened"
  };
};

_result;
