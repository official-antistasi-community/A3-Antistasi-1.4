class CfgSounds
{
	sounds[] = {};
    class fire
    {
        name="fire";
        sound[]={EQPATHTOFOLDER(core,Music\fire.ogg),db+12,1.0};
        titles[]={};
    };

    class StrikeImpact
    {
        name = "StrikeImpact";
        sound[] = {EQPATHTOFOLDER(core,Sounds\Misc\StrikeImpact.ogg), db+45, 1};
        titles[] = {};
    };

    class StrikeSound
    {
        name = "StrikeSound";
        sound[] = {EQPATHTOFOLDER(core,Sounds\Misc\StrikeSound.ogg), db+10, 1};
        titles[] = {};
    };

    class StrikeThunder
    {
        name = "StrikeThunder";
        sound[] = {EQPATHTOFOLDER(core,Sounds\Misc\thunder_01.wss), db+10, 1};
        titles[] = {};
    };

    class EarthquakeHeavy
    {
        name = "EarthquakeHeavy";
        sound[] = {EQPATHTOFOLDER(core,Sounds\Misc\earthquake4.wss), db + 45, 1};
        titles[] = {};
    };

    class EarthquakeMore
    {
        name = "EarthquakeMore";
        sound[] = {EQPATHTOFOLDER(core,Sounds\Misc\earthquake3.wss), db + 45, 1};
        titles[] = {};
    };

    class EarthquakeLess
    {
        name = "EarthquakeLess";
        sound[] = {EQPATHTOFOLDER(core,Sounds\Misc\earthquake2.wss), db + 45, 1};
        titles[] = {};
    };

    class EarthquakeLight
    {
        name = "EarthquakeLight";
        sound[] = {EQPATHTOFOLDER(core,Sounds\Misc\earthquake1.wss), db + 45, 1};
        titles[] = {};
    };
};
