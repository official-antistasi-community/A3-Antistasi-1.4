/*
Maintainer: DoomMetal
    Converts an amount of time into a localized string.

Arguments:
    <FLOAT> Time (in seconds unless 3rd argument is true)
    <STRING> Format (optional, defaults to lowest short form depending on amount of time)
    <BOOL> If true, time is interpreted as hours, if false time is intepreted as seconds (optional, default: false)

Return Value:
    <STRING> Formatted and localized time.

Scope: Clients (because localization)
Environment: Any
Public: Yes
Dependencies:
    <STRING> STR_antistasi_dialogs_generic_<day, days, hour, hours etc...>

Example:
    No format specified:
        [150] call A3A_fnc_formatTime; // "2m 30s"
        [98765.52] call A3A_fnc_formatTime; // "1d 3h 26m"
    With format specified:
        [15.63, "HM", true] call A3A_fnc_formatTime; // "15 hours 37 minutes"
        [28.63, "DHMS", true] call A3A_fnc_formatTime; // "1 day 4 hours 37 minutes 48 seconds"
*/

#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()

params [["_time", 0], ["_format", ""], ["_inHours", false]];

// If time is specified in hours, convert to seconds
if (_inHours) then {_time = _time * 3600};

// Split values
_days = floor (_time / 86400);
_hours = floor ((_time - _days * 86400) / 3600);
_minutes = floor ((_time - _days * 86400 - _hours * 3600) / 60);
_seconds = floor (_time - _days * 86400 - _hours * 3600 - _minutes * 60);

// If format is not specified select one that hopefully makes sense
if (_format isEqualTo "") then {
  if (_days < 1) then {
    if (_hours < 1) then {
      if (_minutes < 1) then {
        _format = "s";
      } else {
        _format = "ms";
      };
    } else {
      _format = "hms";
    };
  } else {
    _format = "dhm";
  };
};

// Okay, I know this looks silly but hear me out; Not all languages can make words plural by just appending a character
// In English you can just add an 's', but in for example in Czech you have "1 minute" = "1 minuta" but "3 minutes" = "3 minuty"
// So in an attempt to make this localization proof it is done this way
_strDays = if (_days == 1) then {localize "STR_antistasi_dialogs_generic_day"} else {localize "STR_antistasi_dialogs_generic_days"};
_strHours = if (_hours == 1) then {localize "STR_antistasi_dialogs_generic_hour"} else {localize "STR_antistasi_dialogs_generic_hours"};
_strMinutes = if (_minutes == 1) then {localize "STR_antistasi_dialogs_generic_minute"} else {localize "STR_antistasi_dialogs_generic_minutes"};
_strSeconds = if (_seconds == 1) then {localize "STR_antistasi_dialogs_generic_second"} else {localize "STR_antistasi_dialogs_generic_seconds"};
_strDaysShort = localize "STR_antistasi_dialogs_generic_days_short";
_strHoursShort = localize "STR_antistasi_dialogs_generic_hours_short";
_strMinutesShort = localize "STR_antistasi_dialogs_generic_minutes_short";
_strSecondsShort = localize "STR_antistasi_dialogs_generic_seconds_short";

// Format selection
private _timeString = "";
switch (_format) do
{
  // Short form: days hours mintues seconds
  case ("dhms"):
  {
    _timeString = [str _days + _strDaysShort, str _hours + _strHoursShort, str _minutes + _strMinutesShort, str _seconds + _strSecondsShort] joinString " ";
  };

  // Short form: days hours minutes
  case ("dhm"):
  {
    _timeString = [str _days + _strDaysShort, str _hours + _strHoursShort, str _minutes + _strMinutesShort] joinString " ";
  };

  // Short form: hours minutes seconds
  case ("hms"):
  {
    _hours = _hours + _days * 24;
    _timeString = [str _hours + _strHoursShort, str _minutes + _strMinutesShort, str _seconds + _strSecondsShort] joinString " ";
  };

  // Short form: hours minutes
  case ("hm"):
  {
    _hours = _hours + _days * 24;
    _timeString = [str _hours + _strHoursShort, str _minutes + _strMinutesShort] joinString " ";
  };

  // Short form: minutes seconds
  case ("ms"):
  {
    _hours = _hours + _days * 24;
    _minutes = _minutes + _hours * 60;
    _timeString = [str _minutes + _strMinutesShort, str _seconds + _strSecondsShort] joinString " ";
  };

  // Short form: seconds
  case ("s"):
  {
    _hours = _hours + _days * 24;
    _minutes = _minutes + _hours * 60;
    _seconds = _seconds + _minutes * 60;
    _timeString = str _seconds + _strSecondsShort;
  };

  // Long form: Days Hours Minutes Seconds
  case ("DHMS"):
  {
    _timeString = [_days, _strDays, _hours, _strHours, _minutes, _strMinutes, _seconds, _strSeconds] joinString " ";
  };

  // Long form: Days Hours Minutes
  case ("DHM"):
  {
    _timeString = [_days, _strDays, _hours, _strHours, _minutes, _strMinutes] joinString " ";
  };

  // Long form: Hours Minutes Seconds
  case ("HMS"):
  {
    _hours = _hours + _days * 24;
    _timeString = [_hours, _strHours, _minutes, _strMinutes, _seconds, _strSeconds] joinString " ";
  };

  // Long form: Hours Minutes
  case ("HM"):
  {
    _hours = _hours + _days * 24;
    _timeString = [_hours, _strHours, _minutes, _strMinutes] joinString " ";
  };

  // Long form: Minutes Seconds
  case ("MS"):
  {
    _hours = _hours + _days * 24;
    _minutes = _minutes + _hours * 60;
    _timeString = [_minutes, _strMinutes, _seconds, _strSeconds] joinString " ";
  };

  // Long form: Seconds
  case ("S"):
  {
    _hours = _hours + _days * 24;
    _minutes = _minutes + _hours * 60;
    _seconds = _seconds + _minutes * 60;
    _timeString = [_seconds, _strSeconds] joinString " ";
  };

  default
  {
    Error_1("Format does not exist: %1", _format);
  };
};

_timeString;
