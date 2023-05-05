class CfgFunctions {
    class A3A {
		class weatherScenes {
			file = QPATHTOFOLDER(functions\scenes);
			class setWeatherScene {};
		};

        class weatherInit {
			file = QPATHTOFOLDER(functions\init);
			class weatherServerInit {};
		};

		class weatherUtility {
			file = QPATHTOFOLDER(functions\utility);
			class getWeatherValue {};
			class setRainTexture {};
		};
    };
};