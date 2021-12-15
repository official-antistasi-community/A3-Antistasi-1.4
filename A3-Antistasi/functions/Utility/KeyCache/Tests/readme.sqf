/*
Run in order.
Make sure previous test finishes before starting next.
If the previous test failed, it's likely that the following will too.
*/

// Recommended
call compileScript ["functions\Utility\KeyCache\Tests\unitTest_garbageCollector_basicPromotion.sqf"];
call compileScript ["functions\Utility\KeyCache\Tests\unitTest_garbageCollector_timedPromotion.sqf"];
call compileScript ["functions\Utility\KeyCache\Tests\unitTest_garbageCollector_basicDeletion.sqf"];
// Will take ≈10 minutes. Game will still run at 60fps.
call compileScript ["functions\Utility\KeyCache\Tests\stressTest_garbageCollector_short.sqf"];

// Not recommenced for common testing
// Will take ≈2 hours 46 minutes. Game will still run at 60fps.
call compileScript ["functions\Utility\KeyCache\Tests\stressTest_garbageCollector_long.sqf"];
