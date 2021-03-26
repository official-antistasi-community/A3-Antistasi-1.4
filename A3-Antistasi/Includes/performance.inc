/*
    Author: [Håkon]
    Description:
        Performance logging macros

        Counter: Single elapsed time in ms
            startCounter(X) - Starts counting
            stopCounter(X)  - Stops counting and logs elapsed time
        Batch:   Colection of times with notes over elapsed time
            startBatch(X)   - Starts Counting
            markBatch(X,C)  - Marks elapsed time with note C
            stopBatch(X)    - Stios counting and logs the marks in the batch

        Note: all arguments for macros MUST be strings

        How to use:
        Before this is included define diag_performance as 1
            #define diag_performance 1
            #include "performance.inc"

        Then use the macros to start stop counters and batches, and markBatch to make a mark on a batch

    Scope: Any
    Environment: Any
    Public: Yes
    Dependencies:

    Example:

        startCounter("Test");
        //some block of code run
        stopCounter("Test"); //logs time code block used

        startBatch("Test");
        //some code
        markBatch("Test", "some done"); //note <<some done: {elapsed time}>> added to batch
        //more code
        markBatch("Test", "more code done"); //note <<more code done: {elapsed time}>> added to batch
        stopBatch("Test"); // batch is logged neatly

    License: MIT License
*/
#ifndef diag_performance
    #define diag_performance 0
#endif

#if diag_performance
    if (isNil "HR_performanceCounters") then {HR_performanceCounters = createHashMap};

    #define startCounter(X) HR_performanceCounters set [X, diag_tickTime]
    #define stopCounter(X) private _performanceCounters_time = diag_tickTime; private _performanceCounters_base = HR_performanceCounters deleteAt X; \
    if (isNil "_performanceCounters_base") then {diag_log text ("Performance Counter | Error flag not found: " + X)} else { \
    diag_log text ("Performance Counter | " + X + " | Time: " + str ((_performanceCounters_time - _performanceCounters_base) * 1000 ) + "ms")}

    #define startBatch(X) HR_performanceCounters set [X+"_Batch", []]; HR_performanceCounters set [X+"_StartTime", diag_tickTime]
    #define markBatch(X, C) (HR_performanceCounters getOrDefault [X+"_Batch", []]) pushBack [C, diag_tickTime]
    #define stopBatch(X) private _batch = HR_performanceCounters deleteAt (X+"_Batch"); private _startTime = HR_performanceCounters deleteAt (X + "_StartTime");\
    if (isNil "_batch" || {isNil "_startTime"}) then {diag_log text ("Performance Batch | Error flag not found: " + X)} else { \
    diag_log text ("Performance Batch | " + X + " | [" + endl + (_batch apply { "    " + (_x select 0) + ": " + str ( ((_x select 1) - _startTime) * 1000 ) + " ms" + endl} joinString "") + "]")}
#else
    #define startCounter(X)
    #define stopCounter(X)

    #define startBatch(X)
    #define markBatch(X, C)
    #define stopBatch(X)
#endif
