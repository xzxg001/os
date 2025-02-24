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

static SemHandle sem_sync_A;
static SemHandle sem_sync_B;

static int global_counter = 0;

void TaskA_Entry()
{
    while (1)
    {
        // 任务 A 先获取信号量 A，然后获取信号量 B
        PRT_SemPend(sem_sync_A, OS_WAIT_FOREVER);
        PRT_Printf("TaskA\n");
        for (volatile int j = 0; j < 10000000; j++) {
            // 空循环
        }
        
        PRT_SemPend(sem_sync_B, OS_WAIT_FOREVER);

        // 对资源进行操作
        

        

        // 释放信号量 B，再释放信号量 A
        PRT_SemPost(sem_sync_B);
        PRT_SemPost(sem_sync_A);
    }
}

void TaskB_Entry()
{
    while (1)
    {
        // 任务 B 先获取信号量 B，然后获取信号量 A
        PRT_SemPend(sem_sync_B, OS_WAIT_FOREVER);
        PRT_Printf("TaskB\n");
        for (volatile int j = 0; j < 10000000; j++) {
            // 空循环
        }
        
        PRT_SemPend(sem_sync_A, OS_WAIT_FOREVER);

        


        // 释放信号量 A，再释放信号量 B
        PRT_SemPost(sem_sync_A);
        PRT_SemPost(sem_sync_B);
    }
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

    // 创建信号量 A 和信号量 B
    U32 ret_A = PRT_SemCreate(1, &sem_sync_A);
    U32 ret_B = PRT_SemCreate(1, &sem_sync_B);

    if (ret_A != OS_OK || ret_B != OS_OK)
    {
        PRT_Printf("failed to create synchronization sem\n");
        return 1;
    }

    // 创建任务 A
    struct TskInitParam param_A = {0};
    param_A.taskEntry = (TskEntryFunc)TaskA_Entry;
    param_A.taskPrio = 0;
    param_A.stackSize = 0x1000;
    TskHandle tskHandle_A;
    ret_A = PRT_TaskCreate(&tskHandle_A, &param_A);
    if (ret_A)
    {
        return ret_A;
    }
    ret_A = PRT_TaskResume(tskHandle_A);
    if (ret_A)
    {
        return ret_A;
    }

    // 创建任务 B
    struct TskInitParam param_B = {0};
    param_B.taskEntry = (TskEntryFunc)TaskB_Entry;
    param_B.taskPrio = 0;
    param_B.stackSize = 0x1000;
    TskHandle tskHandle_B;
    ret_B = PRT_TaskCreate(&tskHandle_B, &param_B);
    if (ret_B)
    {
        return ret_B;
    }
    ret_B = PRT_TaskResume(tskHandle_B);
    if (ret_B)
    {
        return ret_B;
    }

    // 启动调度
    OsActivate();

    return 0;
}
