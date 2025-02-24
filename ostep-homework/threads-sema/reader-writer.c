#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include "common_threads.h"
#include <semaphore.h>
//
// Your code goes in the structure and functions below
//

typedef struct __rwlock_t {
    sem_t lock;
    sem_t write_lock;
    int reader_number;
} rwlock_t;

//初始化锁
void rwlock_init(rwlock_t *rw) {
    sem_init(&rw->lock, 0, 1);
    sem_init(&rw->write_lock, 0, 1);
    rw->reader_number = 0;
}

void rwlock_acquire_readlock(rwlock_t *rw) {
    sleep(1);
    sem_wait(&rw->lock);//获取访问reader_number的锁
    rw->reader_number++;
    if (rw->reader_number == 1) {
        //第一个读者获取写锁，防止该锁被写者获取
        sem_wait(&rw->write_lock);
    }
    sem_post(&rw->lock);//释放访问reader_number的锁
}

void rwlock_release_readlock(rwlock_t *rw) {
    sem_wait(&rw->lock);//获取访问reader_number的锁
    rw->reader_number--;
    if (rw->reader_number == 0) {
        //最后一个读者释放写锁
        sem_post(&rw->write_lock);
    }
    sem_post(&rw->lock);//释放访问reader_number的锁
}

void rwlock_acquire_writelock(rwlock_t *rw) {
    sleep(1);
    sem_wait(&rw->write_lock);//写者获取写锁
}

void rwlock_release_writelock(rwlock_t *rw) {
    sem_post(&rw->write_lock);//写者释放写锁
}

//
// Don't change the code below (just use it!)
// 

int loops;
int value = 0;

rwlock_t lock;

void *reader(void *arg) {
    int i;
    for (i = 0; i < loops; i++) {
        rwlock_acquire_readlock(&lock);
        printf("read %d\n", value);
        rwlock_release_readlock(&lock);
    }
    return NULL;
}

void *writer(void *arg) {
    int i;
    for (i = 0; i < loops; i++) {
        rwlock_acquire_writelock(&lock);
        value++;
        printf("write %d\n", value);
        rwlock_release_writelock(&lock);
    }
    return NULL;
}

int main(int argc, char *argv[]) {
    assert(argc == 4);
    int num_readers = atoi(argv[1]);
    int num_writers = atoi(argv[2]);
    loops = atoi(argv[3]);
    pthread_t pr[num_readers], pw[num_writers];
    rwlock_init(&lock);
    printf("begin\n");
    int i;
    for (i = 0; i < num_readers; i++)
        Pthread_create(&pr[i], NULL, reader, NULL);
    for (i = 0; i < num_writers; i++)
        Pthread_create(&pw[i], NULL, writer, NULL);

    for (i = 0; i < num_readers; i++)
        Pthread_join(pr[i], NULL);
    for (i = 0; i < num_writers; i++)
        Pthread_join(pw[i], NULL);

    printf("end: value %d\n", value);
    return 0;
}

