params["_filename", ""];

switch (_filename) do {
	case "zone": {
		A3A_antennasDead = [];
		A3A_banks = [];
		A3A_mrkAntennas = [];
		A3A_posAntennas = [];
		A3A_blacklistPos = [];
		A3A_posBank = [];
		A3A_hardcodedPop = true;
		A3A_hardCodedAntennas = true;

		{server setVariable [_x select 0,_x select 1]} forEach
		[["Therisa",154],["Zaros",371],["Poliakko",136],["Katalaki",95],["Alikampos",115],["Neochori",309],["Stavros",122],["Lakka",173],["AgiosDionysios",84],
		["Panochori",264],["Topolia",33],["Ekali",9],["Pyrgos",531],["Orino",45],["Neri",242],["Kore",133],["Kavala",660],["Aggelochori",395],["Koroni",32],["Gravia",291],
		["Anthrakia",143],["Syrta",151],["Negades",120],["Galati",151],["Telos",84],["Charkia",246],["Athira",342],["Dorida",168],["Ifestiona",48],["Chalkeia",214],
		["AgiosKonstantinos",39],["Abdera",89],["Panagia",91],["Nifi",24],["Rodopoli",212],["Kalithea",36],["Selakano",120],["Frini",69],["AgiosPetros",11],["Feres",92],
		["AgiaTriada",8],["Paros",396],["Kalochori",189],["Oreokastro",63],["Ioannina",48],["Delfinaki",29],["Sofia",179],["Molos",188]];


		A3A_posAntennas =
		[[14451.5,16338,0.000354767], [15346.7,15894,-3.8147e-005], [16085.1,16998,7.08781], [17856.7,11734.1,0.863045],
		[9496.2,19318.5,0.601898], [9222.87,19249.1,0.0348206], [20944.9,19280.9,0.201118], [20642.7,20107.7,0.236603],
		[18709.3,10222.5,0.716034], [6840.97,16163.4,0.0137177], [19319,9716.22,0.442627], [19351.9,9693.04,0.639175],
		[10317.3,8704.65,0.117233], [8268.76,10051.6,0.0100708], [4583.61,15401.1,0.262543],[4555.65,15383.2,0.0271606],
		[4263.82,20664.1,-0.0102234], [26274.6,22188.1,0.0139847], [26455.4,22166.3,0.0223694]];
		A3A_blacklistPos = [4, 10, 12, 15, 17];
		A3A_posBank = [[16586.6,12834.5,-0.638584], [16545.8,12784.5,-0.485485], [16633.3,12807,-0.635017], [3717.34,13391.2,-0.164862], [3692.49,13158.3,-0.0462074], [3664.31,12826.5,-0.379545], [3536.99,13006.6,-0.508585], [3266.42,12969.9,-0.549738]];
		antennas = [];
	};
	case "garrison": {};
	case "selector": {};
	default {};
};