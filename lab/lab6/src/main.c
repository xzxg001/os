#include "prt_typedef.h"
#include "prt_tick.h"
#include "prt_task.h"

extern U32 PRT_Printf(const char *format, ...);
extern void PRT_UartInit(void);
extern void CoreTimerInit(void);
extern U32 OsHwiInit(void);
extern U32 OsActivate(void);
extern U32 OsTskInit(void);

void Test1TaskEntry()
{
  

    U32 cnt = 5;
    while (cnt > 0) {
        // PRT_TaskDelay(200);
        PRT_Printf("task 1 run ...\n");
        //int a=PRT_TickGetCount();
        //PRT_Printf("%u\n",a);
        cnt--;
         int delay_time = 1000000;  // 根据自己机器计算能力不同调整该值
        while(delay_time>0){
            PRT_TickGetCount();  //消耗时间，防止延时代码被编译器优化
            delay_time--;
        }
    }
  
}

void Test2TaskEntry()
{
    //int a=PRT_TickGetCount();
      //  PRT_Printf("%u\n",a);
    U32 cnt = 5;
    while (cnt > 0) {
        // PRT_TaskDelay(100);
        PRT_Printf("task 2 run ...\n");
        cnt--;
     int delay_time = 1000000;  // 根据自己机器计算能力不同调整该值
        while(delay_time>0){
            PRT_TickGetCount();  //消耗时间，防止延时代码被编译器优化
            delay_time--;
        }
    }
    
}

S32 main(void)
{

    // 初始化GIC
    OsHwiInit();
    // 启用Timer
    CoreTimerInit();
    // 任务系统初始化
    OsTskInit();

    PRT_UartInit();

    PRT_Printf("███╗   ███╗██╗███╗   ██╗██╗███████╗██╗   ██╗██╗     ███████╗██████╗     ██████╗ ██╗   ██╗██╗  ██╗███╗   ██╗██╗   ██╗███████╗██████╗\n");
    PRT_Printf("████╗ ████║██║████╗  ██║██║██╔════╝██║   ██║██║     ██╔════╝██╔══██╗    ██╔══██╗╚██╗ ██╔╝██║  ██║████╗  ██║██║   ██║██╔════╝██╔══██╗\n");
    PRT_Printf("██╔████╔██║██║██╔██╗ ██║██║█████╗  ██║   ██║██║     █████╗  ██████╔╝    ██████╔╝ ╚████╔╝ ███████║██╔██╗ ██║██║   ██║█████╗  ██████╔╝\n");
    PRT_Printf("██║╚██╔╝██║██║██║╚██╗██║██║██╔══╝  ██║   ██║██║     ██╔══╝  ██╔══██╗    ██╔══██╗  ╚██╔╝  ██╔══██║██║╚██╗██║██║   ██║██╔══╝  ██╔══██╗\n");
    PRT_Printf("██║ ╚═╝ ██║██║██║ ╚████║██║███████╗╚██████╔╝███████╗███████╗██║  ██║    ██████╔╝   ██║   ██║  ██║██║ ╚████║╚██████╔╝███████╗██║  ██║\n");
    PRT_Printf("╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═╝╚══════╝ ╚═════╝ ╚══════╝╚══════╝╚═╝  ╚═╝    ╚═════╝    ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝\n");
    
    PRT_Printf("ctr-a h: print help of qemu emulator. ctr-a x: quit emulator.\n\n");

    U32 ret;
    struct TskInitParam param = {0};

    // task 1
    // param.stackAddr = 0;
    param.taskEntry = (TskEntryFunc)Test1TaskEntry;
    param.taskPrio = 0;
    // param.name = "Test1Task";
    param.stackSize = 0x1000; //固定4096，参见prt_task_init.c的OsMemAllocAlign

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
    // param.stackAddr = 0;
    param.taskEntry = (TskEntryFunc)Test2TaskEntry;
    param.taskPrio = 0;
    // param.name = "Test2Task";
    param.stackSize = 0x1000; //固定4096，参见prt_task_init.c的OsMemAllocAlign

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

    // while(1);
    return 0;

}
