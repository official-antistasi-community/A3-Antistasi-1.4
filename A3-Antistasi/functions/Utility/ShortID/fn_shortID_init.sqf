
/*
Maintainer: Caleb Serafin
    You can configure the range and distribution of short ID data here.
    It's based on counters. A client has 2^32. A headless-client has 2^40. A server has 2^46.
    Counters are initialised to random values to mitigate clientOwner collisions.

Scope: Any
Environment: Any
Public: No

Example:
    call A3A_fnc_shortID_init;
*/
A3A_shortID_counter1Modulo = 2^24;

if (isServer || !hasInterface) then {
    if (isServer) then {
        A3A_shortID_clientID = 1 * 2^23;                    // 1 isServerLike bit
        A3A_shortID_clientID = A3A_shortID_clientID + 2^22; // 1 isServer bit
        A3A_shortID_counter2Modulo = 2^22;                  // 22 Counter bits
    } else {  // Headless client.
        A3A_shortID_clientID = 1 * 2^23;                                            // 1 isServerLike bit
        A3A_shortID_clientID = A3A_shortID_clientID + 0 * 2^22;                     // 1 isServer bit
        A3A_shortID_clientID = A3A_shortID_clientID + (clientOwner mod 2^6) * 2^16; // 6 ID bits
        A3A_shortID_counter2Modulo = 2^16;                                          // 16 Counter bits
    };
} else {
    A3A_shortID_clientID = 0 * 2^23;                                            // 1 isServerLike bit
    A3A_shortID_clientID = A3A_shortID_clientID + (clientOwner mod 2^15) * 2^8; // 15 ID bits
    A3A_shortID_counter2Modulo = 2^8;                                           // 8 Counter bits
};

A3A_shortID_counter1 = floor random A3A_shortID_counter1Modulo;
A3A_shortID_counter2 = floor random A3A_shortID_counter2Modulo;
