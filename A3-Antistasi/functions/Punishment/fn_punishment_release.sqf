params["_detainee"];

_punishment_vars = _detainee getVariable ["punishment_vars", [0,0,[0,0],[scriptNull,scriptNull]]];		//[timeTotal,offenceTotal,_lastOffenceData,[wardenHandle,sentenceHandle]]
_punishmentPlatform = _detainee getVariable ["punishment_platform",objNull];
_lastOffenceData = _punishment_vars select 2;
_punishment_warden = (_punishment_vars select 3) select 0;
_punishment_sentence = (_punishment_vars select 3) select 1;

if !(scriptDone _punishment_warden || isNull _punishment_warden) then {terminate _punishment_warden;};
if !(scriptDone _punishment_sentence || isNull _punishment_sentence) then {terminate _punishment_sentence;};

_detainee switchMove "";
_detainee setPos posHQ;
deleteVehicle _punishmentPlatform;

_punishment_timeTotal = 0;
_punishment_offenceTotal = 0.1;
_lastOffenceData set [1,0];		//[lastTime,overhead]
_punishment_vars = [_punishment_timeTotal,_punishment_offenceTotal,_lastOffenceData,[scriptNull,scriptNull]];;		//[timeTotal,offenceTotal,_lastOffenceData,[wardenHandle,sentenceHandle]]
_detainee setVariable ["punishment_vars", _punishment_vars, true];		//[timeTotal,offenceTotal,[wardenHandle,sentenceHandle]]
_detainee setVariable ["punishment_coolDown",0,true];