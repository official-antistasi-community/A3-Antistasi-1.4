params ["_leadVehicle", "_helicopter", "_target", "_speed"];

_helicopter limitSpeed _speed;
_helicopter move ((getPos _leadVehicle) vectorAdd [0,0,30]);

while {alive _helicopter && {_leadVehicle distance2D _target > 20}} do
{
  sleep 0.5;
  _helicopter move ((getPosWorld _leadVehicle) vectorAdd [0,0,30]);
};

if(!alive _helicopter) exitWith {};

sleep 3;

while {alive _helicopter && {!(unitReady _helicopter)}} do
{
  sleep 1;
};

if(alive _helicopter) then
{
  _helicopter land "LAND";
};
