class Tasks {
    class TestTask {
        Category = "Test"; // what Category the task bellongs to
        Func = QFUNC(testTask); // the task information needed to run the task
        Params = QFUNC(testTask_p); // determines the parameters for a task, if no valid ones can be genereated return false
        Version = 1; //version number of task, update when compatibility is broken between last version and new update
        Weight = 1;

        /* Make the task a part of a chain of tasks to only run after other task have been succeded
        class chain {
            name = "TestChain"; // the chain name this task belongs to
            stage = 1; // the stage in the chain this task is available
            lastStage = 1; // if this task should be considered a task end stage (restart chain)
            blockProgress = 1; // stop task from increasing the chain stage
        };
        */
    };

    //Legacy tasks
    class L_AS_Official {
        Category = "AS"; // what Category the task bellongs to
        Func = QFUNC(AS_Official); // the task information needed to run the task
        Params = QFUNC(AS_Official_p); // determines the parameters for a task, if no valid ones can be genereated return false
        Version = 1; //version number of task, update when compatibility is broken between last version and new update
        Weight = 1;
    };
};
