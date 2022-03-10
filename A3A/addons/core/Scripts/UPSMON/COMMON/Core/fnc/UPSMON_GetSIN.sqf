/****************************************************************
File: UPSMON_GetSIN.sqf
Author: MONSADA

Description:
	Función que devuelve el valor negativo o positivo del seno en base a un angulo
Parameter(s):

Returns:

****************************************************************/
private["_dir","_sin","_cos"];	

_dir=_this select 0; 
if (isnil "_dir") exitWith {}; 
if (_dir<90)  then  
{
		_sin=1;
}
else 
{ 
	if (_dir<180) then 
	{
		_sin=-1;
	} 
	else 
	{ 
		if (_dir<270) then 
		{
			_sin=-1;
		}
		else 
		{
			_sin=1;
		};				
	};
};
_sin