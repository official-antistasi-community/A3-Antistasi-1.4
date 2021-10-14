A3A_antennasDead = [];
A3A_banks = [];
A3A_mrkAntennas = [];
A3A_posAntennas = [];
A3A_blacklistPos = [];
A3A_posBank = [];
A3A_hardcodedPop = true;
A3A_hardCodedAntennas = true;

//To improve Performance, reduces pop from 13972 to 4850
{server setVariable [_x select 0,_x select 1]} forEach
[["aarre",80],["Alapihlaja",90],["Eerikkala",88],["haavisto",60],["Hailila",90],["Hanski",100],["Harju",100],["harjula",70],["hirvela",0],
["Hurppu",80],["Hyypianvuori",60],["Jarvenkyla",100],["kallio",10],["Kirkonkyla",500],["Klamila",150],["Koivuniemi",100],["Korpela",80],
["Kouki",90],["Kuusela",100],["Lansikyla",100],["Myllynmaki",60],["Nakarinmaki",90],["Niemela",60],["nopala",80],["Ojala",80],["Onnela",100],
["Pajunlahti",90],["piispa",100],["Pyterlahti",390],["Rannanen",80],["Ravijoki",90],["Riko",100],["Santaniemi",100],["Skippari",80],["suopelto",80],
["Sydankyla",150],["Tinkanen",80],["toipela",0],["uski",80],["Uutela",100],["Vilkkila",110],["Virojoki",500],["Ylapaa",80],["Ylapihlaja",80],
["Souvio",70]];

A3A_posAntennas =
[[907.35,2955.65,0], [6644.62,7275.58,0.00256348], [6242.47,13009.4,0.39426], [13061.2,6487.81,0.760155],
[1768.36,15526.1,0.00277328], [15449.2,16603.3,0]];
_blackListPos = [];
antennas = [];