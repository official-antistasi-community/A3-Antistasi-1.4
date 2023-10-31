    class STALKER_Base_RHS
    {
        requiredAddons[] = {"rhsgref_main", "rhssaf_c_vehicles", "rhs_c_tanks", "RHS_US_A2Port_Armor", "SCE_Uniforms"};
        logo = QPATHTOFOLDER(Templates\Templates\STALKER\images\flag_ukraine_co.paa); // before people go "WOOO WHEN UKRAINE FACTION", no! STALKER is set in ukraine around 2000-2010
        flagTexture = QPATHTOFOLDER(Templates\Templates\STALKER\images\flag_ukraine_co.paa);
        basepath = QPATHTOFOLDER(Templates\Templates\STALKER);
        priority = 62;
        climate[] = {"temperate","tropical","arid","arctic"};
    };

    class STALKER_Military_RHS : STALKER_Base_RHS
    {
        side = "Occ";
        flagTexture = QPATHTOFOLDER(Pictures\Markers\marker_military_ca.paa);
        name = "Military";
        file = "STALKER_AI_Military_RHS";
        description = "[STALKER] A phenomena of blinding light illuminates the sky high above the CNPP. The incident lasts two full hours before subsiding, witnesses reported it disappeared as if power suddenly failed. The Ukrainian military was subsequently dispatched into the zone.";
    };
    class STALKER_ClearSky_RHS : STALKER_Military_RHS
    {
        flagTexture = QPATHTOFOLDER(Pictures\Markers\marker_clearsky_ca.paa);
        name = "Clear Sky";
        file = "STALKER_AI_ClearSky_RHS";
        description = "[STALKER] Clear Sky was formed after a split occurred among members of the research team that caused the Zone to emerge in the first place. Disputes concerning cleaning up the aftermath of the failed experiment caused approximately half of the scientists to leave.";
    };

    class STALKER_Civ_Zombie_RHS : STALKER_Civ_Zombie
    {
        requiredAddons[] = {"rhsgref_main", "rhssaf_c_vehicles", "rhs_c_tanks", "RHS_US_A2Port_Armor", "WBK_ZombieCreatures"};
        file = "STALKER_Civ_Zombie_RHS";
    };
    
    class STALKER_Monolith_RHS : STALKER_Base_RHS
    {
        side = "Inv";
        flagTexture = QPATHTOFOLDER(Pictures\Markers\marker_monolith_ca.paa);
        name = "Monolith";
        file = "STALKER_AI_Monolith_RHS";
        description = "[STALKER] Monolith soldiers were 'recruited' as the guardians of the C-Consciousness to repel stalkers. They are vastly superior than the Military since they are funded by shady governments looking for a stake in 'The Zone', although they are completely under the control of the C-Consciousness.";
    };
    class STALKER_Freedom_RHS : STALKER_Monolith_RHS
    {
        flagTexture = QPATHTOFOLDER(Pictures\Markers\marker_freedom_ca.paa);
        name = "Freedom";
        file = "STALKER_AI_Freedom_RHS";
        description = "[STALKER] After Strelok disables the Brain Scorcher, Freedom units head towards the Center of the Zone but encounter Duty. As a result, the Freedom Expeditionary Unit, led by Loki, creates a camp in the Yanov station.";
    };

    class STALKER_Loners_RHS : STALKER_Base_RHS
    {
        side = "Reb";
        flagTexture = QPATHTOFOLDER(Pictures\Markers\marker_loners_ca.paa);
        name = "Loners";
        file = "STALKER_Reb_Loners_RHS";
        description = "[STALKER] Loners are independent, claiming allegiance to no faction. Give them the promise of a glorious artefact however, and they may just destroy the other factions to find your promise...";
    };
    class STALKER_Ecologists_RHS : STALKER_Loners_RHS
    {
        flagTexture = QPATHTOFOLDER(Pictures\Markers\marker_ecologists_ca.paa);
        name = "Ecologists";
        file = "STALKER_Reb_Ecologists_RHS";
        description = "[STALKER] Ecologists are scientists who worked for the Ukrainian government. Now they question if they should research the zone for their own gain.";
    };

    class STALKER_Duty_RHS : STALKER_Base_RHS
    {
        side = "Riv";
        flagTexture = QPATHTOFOLDER(Pictures\Markers\marker_duty_ca.paa);
        name = "Duty";
        file = "STALKER_Riv_Duty_RHS";
        description = "[STALKER] Led by Captain Tachenko, this faction was originally integrated with the military. After a resounding failure during the second disaster, the Captain cut off communication with headquarters and announced the formation of a paramilitary group.";
    };
    class STALKER_Bandits_RHS : STALKER_Duty_RHS
    {
        flagTexture = QPATHTOFOLDER(Pictures\Markers\marker_bandits_ca.paa);
        name = "Bandits";
        file = "STALKER_Riv_Bandits_RHS";
        description = "[STALKER] Led by Yoga, this faction has notoriously been a pain for the Loners to deal with. Almost everyone hates them.";
    };