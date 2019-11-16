private ["_transport","_diff","_time"];

_transport = _this select 0;

_time = time + 60;
_orgpos = (getposASL _transport) select 2;

While {alive _transport && _time > time} do 
{
	_transport flyInHeight UPSMON_paraflyinheight;
	sleep 0.1;
};