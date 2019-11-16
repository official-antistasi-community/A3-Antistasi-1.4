/****************************************************************
File: UPSMON_distancePosSqr.sqf
Author: KRONZKY

Description:

Parameter(s):

Returns:

****************************************************************/
round(((((_this select 0) select 0)-((_this select 1) select 0))^2 + (((_this select 0) select 1)-((_this select 1) select 1))^2)^0.5)