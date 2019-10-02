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
lootItem append allUAVTerminal + allMineDetector + allGPS + allRadio + allLaserDesignator + allBinocular + laserBatteries + lootNVG;

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

lootExplosive deleteAt (lootExplosive find "APERSMineDispenser_Mag");
lootExplosive deleteAt (lootExplosive find "TrainingMine_Mag");
lootExplosive deleteAt (lootExplosive find "IEDLandSmall_Remote_Mag");
lootExplosive deleteAt (lootExplosive find "IEDUrbanSmall_Remote_Mag");
lootExplosive deleteAt (lootExplosive find "IEDLandBig_Remote_Mag");
lootExplosive deleteAt (lootExplosive find "IEDUrbanBig_Remote_Mag");

///////////////////
//   Backpacks  ///
///////////////////
lootBackpack append allBackpackEmpty;
