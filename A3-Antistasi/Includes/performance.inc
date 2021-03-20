#ifndef debugEnabled
    #define debugEnabled 0
#endif

#if debugEnabled
    if (isNil "HR_performanceCounters") then {HR_performanceCounters = createHashMap};

    #define startCounter(X) HR_performanceCounters set [X, diag_tickTime]
    #define stopCounter(X) private _performanceCounters_time = diag_tickTime; private _performanceCounters_base = HR_performanceCounters deleteAt X; \
    if (isNil "_performanceCounters_base") then {diag_log text ("Performance Counter | Error flag not found: " + X)} else { \
    diag_log text ("Performance Counter | " + X + " | Time: " + str ((_performanceCounters_time - _performanceCounters_base) * 1000 ) + "ms")}

    #define startBatch(X) HR_performanceCounters set [X, []]; HR_performanceCounters set [X+"_StartTime", diag_tickTime]
    #define markBatch(X, C) (HR_performanceCounters getOrDefault [X, []]) pushBack [C, diag_tickTime]
    #define stopBatch(X) private _batch = HR_performanceCounters deleteAt X; private _startTime = HR_performanceCounters deleteAt (X + "_StartTime");\
    diag_log text ("Performance Batch | " + X + " | [" + endl + (_batch apply { "    " + (_x select 0) + ": " + str ( ((_x select 1) - _startTime) * 1000 ) + " ms" + endl} joinString "") + "]")
#else
    #define startCounter(X)
    #define stopCounter(X)

    #define startBatch(X)
    #define markBatch(X, C)
    #define stopBatch(X)
#endif
