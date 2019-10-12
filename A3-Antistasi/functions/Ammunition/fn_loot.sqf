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
lootWeapon append arifles + srifles + hguns + mguns + mlaunchers + rlaunchers + allWeaponSubmachineGun + allWeaponShotgun;

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

/////////////////
//   Helmets  ///
/////////////////
lootHelmet append armoredHeadgear;

///////////////
//   Vests  ///
///////////////
lootVest append armoredVest + civilianVest;

/////////////////////
//   Device Bags  ///
/////////////////////
private _lootDeviceBag = [];

switch (teamPlayer) do {
     case independent: {_lootDeviceBag append rebelBackpackDevice};
     default {_lootDeviceBag append occupantBackpackDevice};
};
lootDevice append _lootDeviceBag;

////////////////////////////////////
//      REBEL STARTING ITEMS     ///
////////////////////////////////////
//KEEP AT BOTTOM!!!
unlockedItems append lootBasicItem;
unlockedItems append rebelUniform;
unlockedItems append civilianUniform;
unlockedItems append civilianHeadgear;
unlockedItems append civilianGlasses;
