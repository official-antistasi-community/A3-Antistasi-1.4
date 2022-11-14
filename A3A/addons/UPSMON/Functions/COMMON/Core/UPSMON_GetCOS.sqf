/****************************************************************
File: UPSMON_GetSIN.sqf
Author: MONSADA

Description:
	Función que devuelve el valor negativo o positivo del coseno en base a un angulo
Parameter(s):

Returns:

****************************************************************/
private["_dir","_cos"];	
	
_dir=_this select 0; 
if (isnil "_dir") exitWith {}; 
if (_dir<90)  then  
{
	_cos=1;
} 
else 
{ 
	if (_dir<180) then 
	{
		_cos=1;
	}
	else 
	{ 
		if (_dir<270) then 
		{
			_cos=-1;
		}
		else 
		{
			_cos=-1;
		};				
	};
};
_cos