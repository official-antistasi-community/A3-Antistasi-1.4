# Influence change

| When                                                 |   NATO / _CSAT_   |           FIA            |
| :--------------------------------------------------- | :---------------: | :----------------------: |
|                                                      |                   |
| **Objectives** (influence goes to nearest city)      |                   |
| Roadblock created                                    |        -5         |            5             |
| City Attacked - loss                                 |         0         |           -100           |
| CSAT Punishment defended (applies to all cities)     |        -15        |            15            |
| CSAT Punishment failed (applies to all cities)       |        10         |           -10            |
| CSAT Punishment destroyed city                       |        -20        |           -20            |
| CSAT Punishment destroyed city (others cities only)  |        -10        |           -10            |
| CSAT destroys roadblock with objective               |        -5         |            0             |
| NATO destroys roadblock with objective               |         5         |            0             |
| FIA destroys roadblock with objective                |         0         |            5             |
| FIA loses roadblock/Observation post                 |         5         |            -5            |
| Airbase/seaport attack - win                         |         0         |            10            |
| Airbase/seaport attack - loss to NATO                |        10         |            0             |
| Airbase/seaport attack - loss to CSAT                |        -10        |           -10            |
| AS_SpecOps - loss                                    |       5/10        |            0             |
| AS_SpecOps - win                                     |         0         |           5/10           |
| CON_Outpost - loss                                   |       5/10        |            0             |
| CON_Outpost - win                                    |         0         |           5/10           |
| DES_Vehicle (armor) NATO - win                       |         0         |           5/10           |
| DES_Vehicle (armor) CSAT - win                       |         0         |          10/20           |
| DES_Vehicle (armor) - loss                           |      -5/-10       |          10/20           |
| LOG_Bank                                             |       10/20       |         -20/-40          |
| LOG_Supllies - win                                   | -1\*(20-skillFIA) |        15\*bonus         |
| LOG_Supllies - loss                                  |       5/10        |          -5/-10          |
| RES_Prisoners                                        |         0         |          10/20           |
| Convoy Armor - win                                   |         0         |           5/10           |
| Convoy Prisoners - win                               |         0         |          10/20           |
| Convoy Reinforcements - win                          |         0         |          10/20           |
| Convoy Reinforcements - los                          |         0         |          10/20           |
| Convoy Money - win                                   |       10/20       |         -20/-40          |
| Convoy Supplies - win                                |         0         |          15/30           |
| Convoy Supplies - loss                               |       15/30       |            0             |
| Convoy Supplies - noone won                          |      -5/-10       |         -10/-20          |
|                                                      |                   |
| **Player actions**                                   |                   |
| Release POW                                          |        -2         |            1             |
| NATO surrenders (released pow?)                      |        -2         |            0             |
| FIA surrenders (released pow?)                       |         1         |            0             |
| FIA Respawn (died while remote controlling AI) (??)  |         0         |            -1            |
| Rebuild Assets - Destroyed City - Radio towers alive |         0         |            10            |
|                                                      |                   |
| **Killing**                                          |                   |
| _Unarmed_ NATO killed by FIA                         |         0         |            -2            |
| _Armed_ NATO killed by FIA                           |        -1         |            1             |
| Not FIA kills NATO                                   |       -0.25       |            0             |
| Not FIA/NATO kills NOT NATO                          |       0.25        |            0             |
| NATO kills FIA                                       |         0         |          -0.25           |
| FIA kills occupied civ vehicle                       |         0         |            -1            |
| NATO kills FIA Garrisson                             |       0.25        |            0             |
| NATO kills group leader (player)                     |       0.25        |            0             |
| NATO kills group member                              |       0.25        |            0             |
| FIA bleed out - NATO injured                         |        0.1        |            0             |
| FIA bleed out - NATO injured                         |         0         |           0.25           |
| FIA respawn                                          |         0         |            -1            |
|                                                      |                   |
| Civ kills himself                                    |        -1         |            -1            |
| FIA kills civ                                        |         1         |            0             |
| NATO kills civ                                       |         0         |            1             |
| CSAT kills civ                                       |        -1         |            1             |
|                                                      |                   |
| Kill NATO APC                                        |        -2         |            2             |
| Kill NATO Tank                                       |        -5         |            5             |
| Kill NATO AA tank / MLRS                             |        -5         |            5             |
| Kill NATO Attack Helicopter                          |        -5         |            5             |
| Kill NATO Aircraft                                   |        -8         |            8             |
|                                                      |                   |
| **Radio tower influence** (nearest tower to city)    |                   |
| FIA                                                  |        -1         | 1 + (1 \* ports amounts) |
| NATO                                                 |         1         |            -1            |
| CSAT                                                 |        -1         |            -1            |
| Destroyed                                            |         0         |            0             |

_notes_:

1. NATO/CSAT: CSAT applies when 'When' says it in the name;
2. Unarmed means no weapons weapon on the unit; (weapon in backpack may count, not sure!);
3. x/y means <difficulty 1 value>/<difficulty 2 value> (i.e. LOG_Supllies 120s/240s holding ground).
