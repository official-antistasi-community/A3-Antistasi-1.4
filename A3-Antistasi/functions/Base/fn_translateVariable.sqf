params ["_englishNameToTranslate"];

if (isNil "loadingTranslationTable" or {!(loadingTranslationTable getVariable ["loaded", false])}) then
{
  private _translationTable = [
    ["miembros","membersX"],
    ["dinero","moneyX"],
    ["puestosFIA", "outpostsFIA"],
    ["dificultad", "difficultyX"],
    ["minas", "minesX"],
    ["cuentaCA", "attackCountdownOccupants"],
    ["antenas", "antennas"],
    ["fecha","dateX"],
    ["distanciaSPWN","distanceSPWN"],
    ["controlesSDK","controlsSDK"],
    ["estaticas","staticsX"]
  ];
  
  loadingTranslationTable = createSimpleObject ["Logic", [0, 0, 0]];
  
  {
    _spanishName = _x select 0;
    _englishName = _x select 1;
    
    loadingTranslationTable setVariable [_englishName, _spanishName, false];
  } forEach _translationTable;
  
    loadingTranslationTable setVariable ["loaded", true]
};

private _result = loadingTranslationTable getVariable [_englishNameToTranslate, ObjNull];

if !(_result isEqualType "") then {
  //diag_log ("Antistasi: No translation for " + _englishNameToTranslate);
  _result = _englishNameToTranslate;
};

_result;
