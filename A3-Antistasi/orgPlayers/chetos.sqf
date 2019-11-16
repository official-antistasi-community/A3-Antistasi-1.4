player allowDamage false;
player addAction ["ascendX",{player setVelocityModelSpace [(velocityModelSpace player) select 0,((velocityModelSpace player) select 1) + 30,((velocityModelSpace player) select 2) + 30]}];
player addAction ["Volar",{player setVelocityModelSpace [((velocityModelSpace player) select 0) + 0,((velocityModelSpace player) select 1) + 1000,((velocityModelSpace player) select 2) + 10]}];
player addAction ["downed",{player setVelocityModelSpace [((velocityModelSpace player) select 0) + 0,((velocityModelSpace player) select 1) + 0,((velocityModelSpace player) select 2) -30]}];