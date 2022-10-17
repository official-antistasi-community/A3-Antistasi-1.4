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
            stopBatch(X,C)    - Stios counting and logs the marks in the batch

        Note: X must be none string, C must be string

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

        startCounter(Test);
        //some block of code run
        stopCounter("Test"); //logs time code block used

        startBatch(Test);
        //some code
        markBatch(Test, "some done"); //note <<some done: {elapsed time}>> added to batch
        //more code
        markBatch(Test, "more code done"); //note <<more code done: {elapsed time}>> added to batch
        stopBatch(Test, "Last comment"); // batch is logged neatly

    License: MIT License
*/
#ifndef diag_performance
    #define diag_performance 0
#endif

#if diag_performance

    #define startCounter(X) HR_performanceCounter_##X = diag_tickTime;
    #define stopCounter(X) \
        private _HR_perf_counter_time = diag_tickTime; \
        if (isNil {HR_performanceCounter_##X}) then { \
            diag_log text ("Performance Counter | Error flag not found: " + #X) \
        } else { \
            diag_log text ("Performance Counter | " + #X + " | Time: " + str ((_HR_perf_counter_time - HR_performanceCounter_##X) * 1000 ) + " ms") \
        }; \
        HR_performanceCounter_##X = nil;

    #define startBatch(X) HR_performanceBatch_##X = []; HR_performanceBatch_##X##_startTime = diag_tickTime;
    #define markBatch(X, C) if (!isNil {HR_performanceBatch_##X}) then {HR_performanceBatch_##X pushBack [C, diag_tickTime]};
    #define stopBatch(X, C) \
        private _HR_perf_CurTime = diag_tickTime; \
        if (isNil {HR_performanceBatch_##X} || {isNil {HR_performanceBatch_##X##_startTime}}) then { \
            diag_log text ("Performance Batch | Error flag not found: " + #X) \
        } else { \
            HR_performanceBatch_##X pushBack [C, _HR_perf_CurTime]; \
            private _deltaTime = HR_performanceBatch_##X##_startTime; \
            diag_log text ("Performance Batch | " + #X + " | Time: " + str ((_Hr_perf_CurTime - HR_performanceBatch_##X##_startTime) * 1000) +" ms | [" + endl + (HR_performanceBatch_##X apply { \
                _deltaTime = (_x select 1) - _deltaTime; \
                "    " + (_x select 0) + ": " + str (_deltaTime * 1000 ) + " ms" + endl \
            } joinString "") + "]") \
        }; \
        HR_performanceBatch_##X = nil; \
        HR_performanceBatch_##X##_startTime = nil;
#else
    #define startCounter(X)
    #define stopCounter(X)

    #define startBatch(X)
    #define markBatch(X, C)
    #define stopBatch(X, C)
#endif
