#include "common_threads.h"
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

//
// Here, you have to write (almost) ALL the code. Oh no!
// How can you show that a thread does not starve
// when attempting to acquire this mutex you build?
//

typedef struct __ns_mutex_t
{
    int room1; // 请求线程列表，lock信号量为锁
    int room2; // 等待线程列表，s1信号量为锁
    sem_t s1;
    sem_t s2;
    sem_t lock;
} ns_mutex_t;

void ns_mutex_init(ns_mutex_t *m)
{
    sem_init(&m->s1, 0, 1);   // s1初始值为1，允许1个线程进入修改room2
    sem_init(&m->s2, 0, 0);   // s2初始值为0，等待获取room2能进入room3的信号
    sem_init(&m->lock, 0, 1); // lock初始值为1，一次只允许1个线程进入修改room1
    m->room1 = 0;
    m->room2 = 0;
}

void ns_mutex_acquire(ns_mutex_t *m)
{
    // 进入room1
    sem_wait(&m->lock); // 等待进入room1
    m->room1++;         // 进入room1
    sem_post(&m->lock);

    // 等待点1：room1

    // 离开room1，进入room2
    // 这里同时占有两个锁
    sem_wait(&m->s1);
    m->room2++;
    sem_wait(&m->lock);
    m->room1--;

    // 将room1中的所有线程放入room2，并打开room3的锁
    if (m->room1)
    { // 若room1内还有线程等待，开启room2的锁，本线程需要将它放入room2，然后本线程也等待在room2
        sem_post(&m->lock);
        sem_post(&m->s1);
    }
    else
    { // 若room1内无线程等待，本线程是最后一个线程，开启room3的锁，允许room2的进入room3
        sem_post(&m->lock);
        sem_post(&m->s2);
    }

    // 等待点2：room2

    //  离开room2，进入room3（也就是开始执行）
    sem_wait(&m->s2);
    m->room2--;
}

void ns_mutex_release(ns_mutex_t *m)
{
    // 本线程执行完后，放行一个来自room2的线程
    if (m->room2)
    {
        sem_post(&m->s2); // 打开room3的门
    }
    else
    {
        sem_post(&m->s1); // 恢复初始值，重新开始上述例程
    }
}

void *worker(void *arg)
{
    return NULL;
}

int main(int argc, char *argv[])
{
    printf("parent: begin\n");
    printf("parent: end\n");
    return 0;
}


