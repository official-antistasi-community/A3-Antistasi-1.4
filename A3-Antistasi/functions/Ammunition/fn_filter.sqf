private ["_badItem","_DLC","_allowedDLC"];
_allowedDLC = ["Kart","Mark","Heli","Expansion","Jets","Orange","Tanks","GlobMob","Enoch"];
_badItem = [];
if ("Kart" call BIS_fnc_getParamValue isEqualTo 0) then
     {
     _allowedDLC deleteAt (_allowedDLC find "Kart");
     };

if ("Mark" call BIS_fnc_getParamValue isEqualTo 0) then
     {
     _allowedDLC deleteAt (_allowedDLC find "Mark");
     };

if ("Heli" call BIS_fnc_getParamValue isEqualTo 0) then
     {
     _allowedDLC deleteAt (_allowedDLC find "Heli");
     };

if ("Expansion" call BIS_fnc_getParamValue isEqualTo 0) then
     {
     _allowedDLC deleteAt (_allowedDLC find "Expansion");
     };

if ("Jets" call BIS_fnc_getParamValue isEqualTo 0) then
     {
     _allowedDLC deleteAt (_allowedDLC find "Jets");
     };

if ("Orange" call BIS_fnc_getParamValue isEqualTo 0) then
     {
     _allowedDLC deleteAt (_allowedDLC find "Orange");
     };

if ("Tanks" call BIS_fnc_getParamValue isEqualTo 0) then
     {
     _allowedDLC deleteAt (_allowedDLC find "Tanks");
     };

if ("GlobMob" call BIS_fnc_getParamValue isEqualTo 0) then
     {
     _allowedDLC deleteAt (_allowedDLC find "GlobMob");
     };

if ("Enoch" call BIS_fnc_getParamValue isEqualTo 0) then
     {
     _allowedDLC deleteAt (_allowedDLC find "Enoch");
     };
diag_log format ["%1: [Antistasi] | INFO | Filter | Allowed DLC: %2",servertime,_allowedDLC];

{
switch (true) do
     {
     case (isClass (configfile >> "cfgWeapons" >> _x)):
          {
          diag_log format ["%1: [Antistasi] | INFO | Filter | Checking if %2 is DLC Content",servertime,_x];
          if (isText (configfile >> "cfgWeapons" >> _x >> "DLC")) then
               {
               _DLC = getText (configfile >> "cfgWeapons" >> _x >> "DLC");
               diag_log format ["%1: [Antistasi] | INFO | Filter | Detected DLC flag: %2",servertime,_DLC];
               if !(_DLC in _allowedDLC) then
                    {
                    _badItem pushBack _x;
                    diag_log format ["%1: [Antistasi] | INFO | Filter | Adding %2 to removal list.",servertime,_x];
                    };
               };
          };
     case (isClass (configfile >> "cfgMagazines" >> _x)):
          {
          if (isText (configfile >> "cfgMagazines" >> _x >> "DLC")) then
               {
               _DLC = getText (configfile >> "cfgMagazines" >> _x >> "DLC");
               if !(_DLC in _allowedDLC) then
                    {
                    _badItem pushBack _x;
                    };
               };
          };
     case (isClass (configfile >> "cfgVehicles" >> _x)):
          {
          if (isText (configfile >> "cfgVehicles" >> _x >> "DLC")) then
               {
               _DLC = getText (configfile >> "cfgVehicles" >> _x >> "DLC");
               if !(_DLC in _allowedDLC) then
                    {
                    _badItem pushBack _x;
                    };
               };
          };
     case (isClass (configfile >> "cfgGlasses" >> _x)):
          {
          if (isText (configfile >> "cfgGlasses" >> _x >> "DLC")) then
               {
               _DLC = getText (configfile >> "cfgGlasses" >> _x >> "DLC");
               if !(_DLC in _allowedDLC) then
                    {
                    _badItem pushBack _x;
                    };
               };
          };
     };
} forEach eastStaticWeapon + westStaticWeapon + independentStaticWeapon + attachmentLight + attachmentLaser + chemLight + smokeGrenade + uglSmokeGrenade + uglFlareMag + handFlare + irGrenade + lootNVG + LootItem + LootWeapon + LootAttachment + LootGrenade + lootMagazine + lootExplosive + lootBackpack + rebelUniform + civilianVest + civilianUniform + civilianGlasses + civilianHeadgear;
diag_log format ["%1: [Antistasi] | INFO | Filter | Items flagged for Removal: %2",servertime,(count _badItem)];

eastStaticWeapon = eastStaticWeapon - _badItem;
westStaticWeapon = westStaticWeapon - _badItem;
independentStaticWeapon = independentStaticWeapon - _badItem;
attachmentLight = attachmentLight - _badItem;
attachmentLaser = attachmentLaser - _badItem;
chemLight = chemLight - _badItem;
smokeGrenade = smokeGrenade - _badItem;
uglSmokeGrenade = uglSmokeGrenade - _badItem;
uglFlareMag = uglFlareMag - _badItem;
handFlare = handFlare - _badItem;
irGrenade = irGrenade - _badItem;
lootNVG = lootNVG - _badItem;
lootItem = lootItem - _badItem;
lootWeapon = lootWeapon - _badItem;
lootAttachment = lootAttachment - _badItem;
lootGrenade = lootGrenade - _badItem;
lootMagazine = lootMagazine - _badItem;
lootExplosive = lootExplosive - _badItem;
lootBackpack = lootBackpack - _badItem;
rebelUniform = rebelUniform - _badItem;
civilianVest = civilianVest - _badItem;
civilianUniform = civilianUniform - _badItem;
civilianGlasses = civilianGlasses - _badItem;
civilianHeadgear = civilianHeadgear - _badItem;
