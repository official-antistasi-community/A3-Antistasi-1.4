//////////////////
// Basic Items ///
//////////////////
lootBasicItem append allMap + allToolkit + allWatch + allCompass + allMedikit + allFirstAidKit;

/////////////////
//    NVG'S   ///
/////////////////
lootNVG append allNVG;

/////////////////////
// Assigned Items ///
/////////////////////
lootItem append allUAVTerminal + lMineDetector + allGPS + allRadio + allLaserDesignator + allBinocular + laserBatteries + lootNVG;

////////////////////
//    Weapons    ///
////////////////////
lootWeapon append arifles + srifles + hguns + mguns + mlaunchers + rlaunchers;

/////////////////////////////
//   Weapon Attachments   ///
/////////////////////////////
lootAttachment append allAttachmentBipod + allAttachmentOptic + allAttachmentMuzzle + allAttachmentPointer;

////////////////////
//    Grenades   ///
////////////////////
lootGrenade append allMagGrenade + allMagShell + irGrenade + allMagSmokeShell + allMagFlare;

////////////////////
//   Magazines   ///
////////////////////
lootMagazine append allMagBullet + allMagShotgun + allMagMissile + allMagRocket + lootGrenade;

///////////////////
//  Explosives  ///
///////////////////
lootExplosive append allMine + allMineDirectional + allMineBounding;

lootExplosive deleteAt (lootExplosive find "DemoCharge_Remote_Mag");
lootExplosive deleteAt (lootExplosive find "APERSMineDispenser_Mag");
lootExplosive deleteAt (lootExplosive find "TrainingMine_Mag");
lootExplosive deleteAt (lootExplosive find "IEDLandSmall_Remote_Mag");
lootExplosive deleteAt (lootExplosive find "IEDUrbanSmall_Remote_Mag");
lootExplosive deleteAt (lootExplosive find "IEDLandBig_Remote_Mag");
lootExplosive deleteAt (lootExplosive find "IEDUrbanBig_Remote_Mag");

/*if (hasRHS and !hasIFA) then
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
		};*/

///////////////////
//   Backpacks  ///
///////////////////
lootBackpack append allBackpackEmpty;

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
