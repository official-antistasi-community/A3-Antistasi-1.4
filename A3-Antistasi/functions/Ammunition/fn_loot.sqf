//////////////////
// Basic Items ///
//////////////////
lootBasicItem append allMap + allToolkit + allWatch + allCompass + allMedikit + allFirstAidKit;

/////////////////////////////
//   Weapon Attachments   ///
/////////////////////////////
lootAttachment append allAttachmentBipod + allAttachmentOptic + allAttachmentMuzzle + allAttachmentPointer;

///////////////////
//  Explosives  ///
///////////////////
lootExplosives append allMineBounding + allMineDirectional + allMineBounding;

lootExplosives deleteAt (lootExplosives find "DemoCharge_Remote_Mag");
lootExplosives deleteAt (lootExplosives find "APERSMineDispenser_Mag");
lootExplosives deleteAt (lootExplosives find "TrainingMine_Mag");
lootExplosives deleteAt (lootExplosives find "IEDLandSmall_Remote_Mag");
lootExplosives deleteAt (lootExplosives find "IEDUrbanSmall_Remote_Mag");
lootExplosives deleteAt (lootExplosives find "IEDLandBig_Remote_Mag");
lootExplosives deleteAt (lootExplosives find "IEDUrbanBig_Remote_Mag");

/////////////////////
// Assigned Items ///
/////////////////////
lootItems append allMineDetector + allGPS + allRadio;

/////////////////
// Binoculars ///
/////////////////
lootBinocular append allLaserDesignator + allBinocular + laserBatteries;

/////////////////
//    NVG'S   ///
/////////////////
lootNVG append allNVG;

/////////////////////////////
//   Smoke, Chem, Flare   ///
/////////////////////////////
lootSignalMag append allMagSmokeShell + allMagFlare;

////////////////////
//   Magazines   ///
////////////////////
lootMagazine append allMagBullet + allMagShotgun + allMagMissile + allMagRocket;

////////////////////
//    Grenades   ///
////////////////////
lootGrenades append allMagGrenade + allMagShell + irGrenade;

////////////////////
//    Weapons    ///
////////////////////
lootWeapons append arifles + srifles + hguns + mguns + mlaunchers + rlaunchers;

////////////////////////////////////
//       REBEL LOOT ITEMS        ///
////////////////////////////////////
itemsAAF append lootBipod + lootOptic + lootSilencer + lootPointer + lootNVG + lootBinocular;

////////////////////////////////////
//     PLACED EXPLOSIVES LOOT    ///
////////////////////////////////////
minesAAF append lootExplosives;

if (hasRHS and !hasIFA) then
	{
	minesAAF =
		[
		"rhsusf_m112_mag",
		"rhsusf_mine_m14_mag",
		"rhs_mine_M19_mag",
		"rhs_mine_tm62m_mag",
		"rhs_mine_pmn2_mag"
		];
	}
	else
		{
		if (hasIFA) then
			{
			minesAAF =
				[
				"LIB_PMD6_MINE_mag",
				"LIB_TM44_MINE_mag",
				"LIB_US_TNT_4pound_mag"
				];
			};
		};

////////////////////////////////////
//      REBEL STARTING ITEMS     ///
////////////////////////////////////
//These items will be unlocked when the mission starts
diag_log format ["%1: [Antistasi] | INFO | initVar | Creating Unlocked Items Lists",servertime];
unlockedItems append lootBasicItem;
unlockedItems append rebelUniform;
unlockedItems append civilianUniform;
unlockedItems append civilianHeadgear;
unlockedItems append civilianVest;
unlockedItems append civilianGlasses;
