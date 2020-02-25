params ["_startPos" , "_endPos", "_avoid"];

if(isNil "roadDataDone") exitWith {
	diag_log "Pathfinding: Road data base not loaded, aborting pathfinding!";
	[];
};

private _deltaTime = time;


_startNav = [_startPos] call A3A_fnc_findNearestNavPoint;
_endNav = [_endPos] call A3A_fnc_findNearestNavPoint;

diag_log format ["Pathfinding: Start %1 at %2 End %3 at %4", _startNav, str _startPos, _endNav, str _endPos];

allMarker = [];
createNavMarker = compile preprocessFileLineNumbers "NavGridTools\createNavMarker.sqf";


if(!(_startNav isEqualType 1 && _endNav isEqualType 1)) exitWith {
	//Hint: Improve the search!
	[];
};


//Start A* here
_openList = [];
_closedList = [];

_targetNavPos = [_startNav] call A3A_fnc_getNavPos;
_startNavPos = [_endNav] call A3A_fnc_getNavPos;

//_end = ["mil_triangle", _targetNavPos, "ColorBlue"] call createNavMarker;
//_end setMarkerText "Start";
//_start = ["mil_triangle", _startNavPos, "ColorBlue"] call createNavMarker;
//_start setMarkerText "Target";

private _lastNav = -1;

//Search for end to start, due to nature of script
_openList pushBack [_endNav, 0, [_startNavPos, _targetNavPos] call A3A_fnc_calculateH, "End"];


while {(!(_lastNav isEqualType [])) && {count _openList > 0}} do
{
    //Select node with lowest score
    _next = objNull;
    //private _debug = "List is<br/>";
    if((count _openList) == 1) then
    {
      _next = _openList deleteAt 0;
    }
    else
    {
      private _nextValue = 0;
      {
        _xValue = ((_x select 1) + (_x select 2));
        //_debug = format ["%1Object: %2 Value: %3<br/>", _debug, (_x select 0), _xValue];

        if((!(_next isEqualType [])) || {_xValue < _nextValue}) then
        {
          _next = _x;
          _nextValue = _xValue;
        };
      } forEach _openList;
      _openList = _openList - [_next];
      //_debug = format ["%1Choose: %2 Value: %3", _debug, (_next select 0), _nextValue];
    };

    //hint _debug;

    //Close node
    _closedList pushBack _next;


    //Gather next nodes
    _nextNodes = [_next select 0] call A3A_fnc_getNavConnections;
    _nextPos = [_next select 0] call A3A_fnc_getNavPos;

    //["mil_dot", _nextPos, "ColorRed"] call createNavMarker;

    {
        _conNav = _x;
        _conName = _conNav select 0;

        //Found the end
        if(_conName == _startNav) exitWith {_lastNav = _next};

        _conPos = [_conName] call A3A_fnc_getNavPos;

        //Not in closed list
        if((_closedList findIf {(_x select 0) == _conName}) == -1) then
        {
          _openListIndex = _openList findIf {(_x select 0) == _conName};

          //Not in open list
          if(_openListIndex == -1) then
          {
            _h = [_conPos, _targetNavPos] call A3A_fnc_calculateH;
            _openList pushBack [_conName, ((_next select 1) + (_nextPos distance _conPos)), _h, (_next select 0)];
            //private _marker = ["mil_dot", _conPos, "ColorBlue"] call createNavMarker;
            //_marker setMarkerText str (_h + (_next select 1) + (_nextPos distance _conPos));
          }
          else
          {
            //In open list
            _conData = _openList deleteAt _openListIndex;
            //Is it a shorter way to this node?
            if((_conData select 1) > ((_next select 1) + (_nextPos distance _conPos))) then
            {
              _conData set [1, ((_next select 1) + (_nextPos distance _conPos))];
              _conData set [3, (_next select 0)];
            };
            _openList pushBack _conData;
          };
        };
    } forEach _nextNodes;
};

private _wayPoints = [];
if(_lastNav isEqualType []) then
{
  //Way found, reverting way through path
  _wayPoints = [_startPos, _targetNavPos];

  while {_lastNav isEqualType []} do
  {
    _lastPos = [_lastNav select 0] call A3A_fnc_getNavPos;
    _wayPoints pushBack _lastPos;
    //["mil_dot", _lastPos, "ColorGreen"] call createNavMarker;
    _lastNavIndex = _lastNav select 3;
    if(_lastNavIndex isEqualType 1) then
    {
      _closedListIndex = _closedList findIf {(_x select 0) == _lastNavIndex};
      _lastNav = _closedList select _closedListIndex;
    }
    else
    {
      _lastNav = -1;
    };
  };
  //_wayPoints pushBack _endPos;
  _wayPoints = _wayPoints + [_startNavPos, _endPos];
  //_wayPoints = [_startPos, _startNavPos];

  _deltaTime = time - _deltaTime;
  diag_log format ["Pathfinding: Successful finished pathfinding in %1 seconds", _deltaTime];
}
else
{
  _deltaTime = time - _deltaTime;
  diag_log format ["Pathfinding: Could not find a way, search took %1 seconds", _deltaTime];
};

[] spawn
{
  sleep 15;
  {
      deleteMarker _x;
  } forEach allMarker;
};

_wayPoints;
