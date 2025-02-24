#include "prt_typedef.h"
#include "prt_sem.h"
#include "prt_task.h"

extern U32 PRT_Printf(const char *format, ...);
extern void PRT_UartInit(void);
extern U32 OsActivate(void);
extern U32 OsTskInit(void);
extern U32 OsSemInit(void);

static SemHandle mutex; // 用于保护临界区的互斥信号量
static SemHandle empty; // 表示可用的空间数量
static SemHandle full;  // 表示可用产品的数量

#define BUFFER_SIZE 5
static int buffer[BUFFER_SIZE]; // 缓冲区
static int in = 0; // 生产者插入的位置
static int out = 0; // 消费者读取的位置

void producer()
{
    int item = 0;
    while (1)
    {
        // 生产一个产品
        item++;

        // 等待空闲空间
        PRT_SemPend(empty, OS_WAIT_FOREVER);
        // 获取互斥锁
        PRT_SemPend(mutex, OS_WAIT_FOREVER);

        // 将产品放入缓冲区
        buffer[in] = item;
        in = (in + 1) % BUFFER_SIZE;

        // 释放互斥锁
        PRT_SemPost(mutex);
        // 发送产品信号
        PRT_SemPost(full);

        // 模拟生产过程的延时
        for (volatile int j = 0; j < 1000000; j++) {
            // 空循环
        }
    }
}

void consumer()
{
    int item = 0;
    while (1)
    {
        // 等待可用产品
        PRT_SemPend(full, OS_WAIT_FOREVER);
        // 获取互斥锁
        PRT_SemPend(mutex, OS_WAIT_FOREVER);

        // 从缓冲区中取出产品
        item = buffer[out];
        out = (out + 1) % BUFFER_SIZE;

        // 释放互斥锁
        PRT_SemPost(mutex);
        // 发送空闲空间信号
        PRT_SemPost(empty);

        // 消费产品
        PRT_Printf("Consumer consumed item: %d\n", item);

        // 模拟消费过程的延时
        for (volatile int j = 0; j < 1000000; j++) {
            // 空循环
        }
    }
}

S32 main(void)
{
    OsTskInit();
    OsSemInit();
    PRT_UartInit();

    // 创建信号量
    U32 ret_mutex = PRT_SemCreate(1, &mutex);
    U32 ret_empty = PRT_SemCreate(BUFFER_SIZE, &empty);
    U32 ret_full = PRT_SemCreate(0, &full);

    if (ret_mutex != OS_OK || ret_empty != OS_OK || ret_full != OS_OK)
    {
        PRT_Printf("Failed to create semaphores.\n");
        return 1;
    }

    // 创建生产者任务
    struct TskInitParam producer_param = {0};
    producer_param.taskEntry = (TskEntryFunc)producer;
    producer_param.taskPrio = 30;
    producer_param.stackSize = 0x1000;
    TskHandle producer_handle;
    U32 ret_producer = PRT_TaskCreate(&producer_handle, &producer_param);
    if (ret_producer != OS_OK)
    {
        return ret_producer;
    }
    U32 ret_resume_producer = PRT_TaskResume(producer_handle);
    if (ret_resume_producer != OS_OK)
    {
        return ret_resume_producer;
    }

    // 创建消费者任务
    struct TskInitParam consumer_param = {0};
    consumer_param.taskEntry = (TskEntryFunc)consumer;
    consumer_param.taskPrio = 35;
    consumer_param.stackSize = 0x1000;
    TskHandle consumer_handle;
    U32 ret_consumer = PRT_TaskCreate(&consumer_handle, &consumer_param);
    if (ret_consumer != OS_OK)
    {
        return ret_consumer;
    }
    U32 ret_resume_consumer = PRT_TaskResume(consumer_handle);
    if (ret_resume_consumer != OS_OK)
    {
        return ret_resume_consumer;
    }

    // 启动调度
    OsActivate();

    return 0;
}
