params [["_time", 0]];
cutText ["You decided to rest for some time","BLACK",5];
sleep 10;
skiptime _time;
forceWeatherChange;
cutText ["Time to go","BLACK IN",10];
