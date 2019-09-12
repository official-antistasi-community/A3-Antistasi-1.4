//Calculates the estimated road length from _pos to _target
//The value describes what behavior the script will have

//Behavior:
//A lower value will make estimated way shorter, resulting in better score for nodes that are not far away from the start point
//This will yield better results for paths where the obvious way is not correct
//A higher value will make estimated way longer, resulting in better score for nodes that are not far away from the end point
//This will yield better results for paths where the obvious way is correct

//Better results means faster results with less touched nodes
//Hint by Wurzel: 1.2 returns fair results in both cases. I recommend some value around it

params ["_pos", "_target"];

private _distance = _pos distance _target;
_distance = _distance * 1.2;

_distance;
