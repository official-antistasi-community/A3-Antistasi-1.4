private ["_badItem","_DLC","_allowedDLC"];
_allowedDLC = ["Kart","Mark","Heli","Expansion","Jets","Orange","Tanks","GlobMob","Enoch"];

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

{
switch (true) do
     {
     case (isclass (configfile >> "cfgWeapons" >> _x)):
          {
          _DLC = getText (configFile >> "cfgWeapons" >> _x >> "DLC");
          if !(_DLC in _allowedDLC) then
               {
               _badItem pushBack _x;
               };
          };
     case (isclass (configfile >> "cfgMagazines" >> _x)):
          {
          _DLC = getText (configFile >> "cfgMagazines" >> _x >> "DLC");
          if !(_DLC in _allowedDLC) then
               {
               _badItem pushBack _x;
               };
          };
     case (isclass (configfile >> "cfgVehicles" >> _x)):
          {
          _DLC = getText (configFile >> "cfgVehicles" >> _x >> "DLC");
          if !(_DLC in _allowedDLC) then
               {
               _badItem pushBack _x;
               };
          };
     case (isclass (configfile >> "cfgGlasses" >> _x)):
          {
          _DLC = getText (configFile >> "cfgGlasses" >> _x >> "DLC");
          if !(_DLC in _allowedDLC) then
               {
               _badItem pushBack _x;
               };
          };
     };
} forEach eastStaticWeapon + westStaticWeapon + independentStaticWeapon + attachmentLight + attachmentLaser + chemLight + smokeGrenade + uglSmokeGrenade + uglFlareMag + handFlare + irGrenade + lootNVG + LootItem + LootWeapon + LootAttachment + LootGrenade + lootMagazine + lootExplosive + lootBackpack + rebelUniform + civilianVest + civilianUniform + civilianGlasses + civilianHeadgear;