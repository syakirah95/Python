#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<sys/types.h>
#include<sys/ipc.h>
#include<sys/shm.h>

#define SHSIZE 100

int main(int argc,char *argv[])
{
    int smid;
    key_t key;
    char *shm;
    char *s;

    key = 9876;

smid = shmget (key,SHSIZE,0666);
if(smid < 0)
{
   perror("shmget");
   exit(1);
}

shm = shmat(smid, NULL, 0);

if(shm == (char *) -1)
{
   perror("shmat");
   exit(1);
}

for(s = shm; *s !=0; s++)
    printf("%c",*s);

   *shm = '*';

  return 0;
} 
