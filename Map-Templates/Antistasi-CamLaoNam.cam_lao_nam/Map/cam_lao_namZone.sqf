A3A_antennasDead = [];
A3A_banks = [];
A3A_mrkAntennas = [];
A3A_posAntennas = [];
A3A_blacklistPos = [];
A3A_posBank = [];
A3A_hardcodedPop = true;
A3A_hardCodedAntennas = true;


//Reduced Pop for performance 16761 to 15350, minimum Pop per Town set to 100 to ensure Vehicle spawning
{server setVariable [_x select 0,_x select 1]} forEach
[["haiphong",500],["hanoi",1000],["hue",2000],["saigon",700],["sihanoukville",200],["nodallho",100],["bru",100],["attapeu",100],
["dakrong",100],["lumphat",100],["cuchi",100],["baria",100],["danang",600],["kenglat",100],["laichau",100],["paknoi",100],
["phuan",100],["xomram",120],["xomgia",100],["tongmoo",100],["donlac",100],["cangon",100],["nalai",100],["baichai",100],
["bachdang",100],["ketthuc",100],["vongxo",100],["banbon",100],["nongkhiaw",100],["horhog",100],["langmau",100],
["baria2",100],["anhoa",100],["binhminh",100],["buoisang",100],["hoalien",100],["lacmy",100],["cacan",100],["tanhop",100],
["hanoi2",300],["gansong",100],["zokcarbora",100],["banhtrung",100],["yentinh",100],["thunglungcao",100],["baibiendep",100],
["phoduc",100],["baove",100],["ngatu",100],["binhyen",100],["bosong",100],["marble",180],["niemtin",100],
["krosang",100],["banlen",100],["comngon",100],["saigonport",100],["cauhai",100]];


A3A_posAntennas =
[[2247.39,3986.44,0.00225067], [6918.17,5419.54,0], [2947.57,8719.32,0.00744534], [3971.88,10207.1,0], [11382.5,5747.82,8.39233e-005],
[8700.25,10425.1,-0.00531006], [4898.78,13640.6,-0.120941], [3272.04,15538.2,0], [15266.2,4664.97,0.000167847], [13743.9,8425.6,-0.171967],
[14864.6,6866.28,-0.00304413], [16101.4,3639.34,-0.115108], [16074.1,7125.38,0.000450134], [5279.59,16872.8,0.446297], [16120.6,7510.5,0.00740814],
[16798.7,6349.54,-0.134335], [17358.3,5560.4,-0.15237], [16567.1,7649.92,-6.48499e-005], [16915.2,7431.9,-9.53674e-006], [11481,14497.6,0.093338],
[9002.38,16557.6,0.00338745], [16704,9187.21,-6.29425e-005], [14135,12825.5,0.106886], [16193.1,10991.2,-0.0359497], [16956.7,10360.2,-6.67572e-005],
[18696.2,8463.42,-0.26639], [20109.3,6538.61,9.53674e-007], [20062.7,7258.82,0.0105629], [14532.3,16441.8,-0.00198364], [14754.2,18335.2,0.000380516]];
_blackListPos = [11, 15, 17, 21, 24, 27];
antennas = [];