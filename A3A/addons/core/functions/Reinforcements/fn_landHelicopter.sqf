//params ["_helicopter", "_helipad"];

_pos = (getPosASL pad);
_dir = getDir pad;
_dirVector = vectorDir pad;
_dirVector2D = +_dirVector;
_dirVector2D set [2, 0];
_upVector = vectorUp pad;

_heliPos = getPosASL heli;
_heliSpeed = velocity heli;

_heliHeigth = (_heliPos select 2) - (_pos select 2);

//That has to be based on the velocity
_prePos = _pos vectorAdd (([0,0,1] vectorMultiply (_heliHeigth + 5)) vectorAdd (_dirVector2D vectorMultiply -15));
_secPos = _pos vectorAdd (([0,0,1] vectorMultiply _heliHeigth) vectorAdd (_dirVector2D vectorMultiply - 5));
_midDir = [0,0,1] vectorAdd (_dirVector2D vectorMultiply 2);
_midUp = _dirVector2D vectorAdd ([0,0,1] vectorMultiply 2);

//Needs to be based on velocity
tArray = [time, time + 3, time + 5, time + 20];
posArray = [_heliPos, _prePos, _secPos, _pos];
speedArray = [_heliSpeed, (_dirVector2D vectorMultiply 10), [0,0,-3], [0,0,0]];
dirArray = [vectorDir heli, _midDir, _dirVector2D, _dirVector];
upArray = [vectorUp heli, _midUp, [0,0,1], _upVector];
counter = 1;



{
    _x disableAI "MOVE";
} forEach (crew heli);

onEachFrame
{
  _t1 = tArray select (counter - 1);
  _t2 = tArray select counter;
  _interval = linearConversion [_t1, _t2, time, 0, 1];

  _curPos = posArray select (counter - 1);
  _nextPos = posArray select counter;

  _curSpeed = speedArray select (counter - 1);
  _nextSpeed = speedArray select counter;

  _curDir = dirArray select (counter - 1);
  _nextDir = dirArray select counter;

  _curUp = upArray select (counter - 1);
  _nextUp = upArray select counter;

  heli setVelocityTransformation
  [
    _curPos,
    _nextPos,
    _curSpeed,
    _nextSpeed,
    _curDir,
    _nextDir,
    _curUp,
    _nextUp,
    _interval
  ];

  if((((getPosASL heli) select 2) - ((getPosASL pad) select 2)) < 10) then
  {
    heli engineOn false;
  };

  if(time > (tArray select counter)) then
  {
    counter = counter + 1;
    if(counter >= count tArray) then
    {
      onEachFrame {};
    };
  };
};
