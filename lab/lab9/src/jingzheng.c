#include "prt_typedef.h"

#include "prt_tick.h"

#include "prt_task.h"

#include "prt_sem.h"


extern U32 PRT_Printf(const char *format, ...);

extern void PRT_UartInit(void);

extern U32 OsActivate(void);

extern U32 OsTskInit(void);

extern U32 OsSemInit(void);
//extern void PRT_UartInit(void);
//extern void CoreTimerInit(void);


static SemHandle sem_sync;

static int global_counter = 0;
static int global_counter_false = 0;
void Test1TaskEntry()

{   int i=1000;
    while(i--){
    global_counter_false++;
    PRT_SemPend(sem_sync, OS_WAIT_FOREVER);
    global_counter++;
    PRT_SemPost(sem_sync); 
    PRT_Printf("%d",global_counter) ;
    PRT_Printf("%d",global_counter_false) ;
    PRT_Printf("task 1 run ...\n");
    }

}


void Test2TaskEntry()

{
    int i=1000;
    while(i--){
    global_counter_false++;
    PRT_SemPend(sem_sync, OS_WAIT_FOREVER);
    global_counter++;
    PRT_SemPost(sem_sync);  
    PRT_Printf("%d",global_counter) ;
    PRT_Printf("%d",global_counter_false) ;
    PRT_Printf("task 1 run ...\n");
    }

}

S32 main(void)
{
    // 任务模块初始化
    OsTskInit();
    OsSemInit();
    //OsHwiInit();
    PRT_UartInit();

    PRT_Printf("███╗   ███╗██╗███╗   ██╗██╗███████╗██╗   ██╗██╗     ███████╗██████╗     ██████╗ ██╗   ██╗██╗  ██╗███╗   ██╗██╗   ██╗███████╗██████╗\n");
    PRT_Printf("████╗ ████║██║████╗  ██║██║██╔════╝██║   ██║██║     ██╔════╝██╔══██╗    ██╔══██╗╚██╗ ██╔╝██║  ██║████╗  ██║██║   ██║██╔════╝██╔══██╗\n");
    PRT_Printf("██╔████╔██║██║██╔██╗ ██║██║█████╗  ██║   ██║██║     █████╗  ██████╔╝    ██████╔╝ ╚████╔╝ ███████║██╔██╗ ██║██║   ██║█████╗  ██████╔╝\n");
    PRT_Printf("██║╚██╔╝██║██║██║╚██╗██║██║██╔══╝  ██║   ██║██║     ██╔══╝  ██╔══██╗    ██╔══██╗  ╚██╔╝  ██╔══██║██║╚██╗██║██║   ██║██╔══╝  ██╔══██╗\n");
    PRT_Printf("██║ ╚═╝ ██║██║██║ ╚████║██║███████╗╚██████╔╝███████╗███████╗██║  ██║    ██████╔╝   ██║   ██║  ██║██║ ╚████║╚██████╔╝███████╗██║  ██║\n");
    PRT_Printf("╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═╝╚══════╝ ╚═════╝ ╚══════╝╚══════╝╚═╝  ╚═╝    ╚═════╝    ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝\n");
    
    U32 ret;

    ret = PRT_SemCreate(1, &sem_sync);

    if (ret != OS_OK) {
        PRT_Printf("failed to create synchronization sem\n");
        return 1;
    }

    struct TskInitParam param = {0};

    // task 1
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

    // task 2
    param.taskEntry = (TskEntryFunc)Test2TaskEntry;
    param.taskPrio = 0;
    param.stackSize = 0x1000;

    TskHandle tskHandle2;

    ret = PRT_TaskCreate(&tskHandle2, &param);

    if (ret) {
        return ret;
    }

    ret = PRT_TaskResume(tskHandle2);

    if (ret) {
        return ret;
    }
    //CoreTimerInit();
    // 启动调度
    OsActivate();



    return 0;
}
