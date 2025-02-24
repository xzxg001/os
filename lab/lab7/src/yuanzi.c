#include "prt_typedef.h"
#include "prt_tick.h"
#include "prt_task.h"
#include "prt_sem.h"

extern U32 PRT_Printf(const char *format, ...);
extern void PRT_UartInit(void);
extern U32 OsActivate(void);
extern U32 OsTskInit(void);
extern U32 OsSemInit(void);
extern void CoreTimerInit(void);
extern U32 OsHwiInit(void);

static SemHandle sem_sync;

// 共享资源
int shared_resource = 0;

void Test1TaskEntry()
{   // 加锁
     PRT_SemPend(sem_sync, OS_WAIT_FOREVER);
    PRT_Printf("task 1 run ...\n");
    shared_resource = 1;
    // 等待一段时间，模拟任务2尝试获取共享资源
    for (volatile int j = 0; j < 10000000; j++) {
            // 空循环
        }
    
    // 修改共享资源
    PRT_Printf("task 1 catch\n");
    // 打印共享资源
    PRT_Printf("Task 1: shared_resource = %d\n", shared_resource);

    // 释放锁
     PRT_SemPost(sem_sync);

    // 任务完成
}

void Test2TaskEntry()
{   // 加锁
     PRT_SemPend(sem_sync, OS_WAIT_FOREVER);
    PRT_Printf("task 2 run ...\n");

    shared_resource = 2;
    // 等待一段时间，模拟任务1尝试获取共享资源
    for (volatile int j = 0; j < 10000000; j++) {
            // 空循环
        }
    
    // 修改共享资源
    PRT_Printf("task 2 catch\n");

    // 打印共享资源
    PRT_Printf("Task 2: shared_resource = %d\n", shared_resource);
    // 释放锁
     PRT_SemPost(sem_sync);
    // 任务完成
}

S32 main(void)
{
    // 任务模块初始化
    OsTskInit();
    OsSemInit();
    OsHwiInit();
    CoreTimerInit();
    PRT_UartInit();

  
    PRT_Printf("███╗   ███╗██╗███╗   ██╗██╗███████╗██╗   ██╗██╗     ███████╗██████╗     ██████╗ ██╗   ██╗██╗  ██╗███╗   ██╗██╗   ██╗███████╗██████╗\n");
    PRT_Printf("████╗ ████║██║████╗  ██║██║██╔════╝██║   ██║██║     ██╔════╝██╔══██╗    ██╔══██╗╚██╗ ██╔╝██║  ██║████╗  ██║██║   ██║██╔════╝██╔══██╗\n");
    PRT_Printf("██╔████╔██║██║██╔██╗ ██║██║█████╗  ██║   ██║██║     █████╗  ██████╔╝    ██████╔╝ ╚████╔╝ ███████║██╔██╗ ██║██║   ██║█████╗  ██████╔╝\n");
    PRT_Printf("██║╚██╔╝██║██║██║╚██╗██║██║██╔══╝  ██║   ██║██║     ██╔══╝  ██╔══██╗    ██╔══██╗  ╚██╔╝  ██╔══██║██║╚██╗██║██║   ██║██╔══╝  ██╔══██╗\n");
    PRT_Printf("██║ ╚═╝ ██║██║██║ ╚████║██║███████╗╚██████╔╝███████╗███████╗██║  ██║    ██████╔╝   ██║   ██║  ██║██║ ╚████║╚██████╔╝███████╗██║  ██║\n");
    PRT_Printf("╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═╝╚══════╝ ╚═════╝ ╚══════╝╚══════╝╚═╝  ╚═╝    ╚═════╝    ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝\n");

    PRT_Printf("Task 1 and Task 2 sharing a critical section...\n");

    U32 ret;
    ret = PRT_SemCreate(1, &sem_sync); // 初始化信号量为1，表示可用
    if (ret != OS_OK) {
        PRT_Printf("failed to create synchronization semaphore\n");
        return 1;
    }

    struct TskInitParam param = {0};

    // Task 1
    param.taskEntry = (TskEntryFunc)Test1TaskEntry;
    param.taskPrio = 0;
    param.stackSize = 0x1000;

    TskHandle tskHandle1;
    ret = PRT_TaskCreate(&tskHandle1, &param);
    if (ret) {
        return ret;
    }

    ret = PRT_TaskResume(tskHandle1);
    if (ret) {
        return ret;
    }

    // Task 2
    param.taskEntry = (TskEntryFunc)Test2TaskEntry;
    param.taskPrio = 0;

    TskHandle tskHandle2;
    ret = PRT_TaskCreate(&tskHandle2, &param);
    if (ret) {
        return ret;
    }

    ret = PRT_TaskResume(tskHandle2);
    if (ret) {
        return ret;
    }

    // 启动调度
    OsActivate();

    return 0;
}
