%module pyrtd

%include carrays.i
%include cpointer.i
%include cdata.i

%pointer_functions(char,imgdat)
%array_class(char,imgArr)

%inline %{
  void* ptr_add_int(char *p, int offset) { return ((void*)p)+offset; }
%} 

%{
#include <rtd/rtdSem.h>
#include <rtd/rtdImageEvent.h>
#include <sys/shm.h>
%}

%include "/usr/include/rtd/rtdSem.h"
%include "/usr/include/rtd/rtdImageEvent.h"

%inline %{
  int rtdShmFill2(int index, char *data, rtdShm *shmPtr, int shmSize) {
    char* ptr = (char *)shmat(shmPtr->shmId[index], NULL, 0);
    int ret = memcpy(ptr, data+1, shmSize) == NULL;
    shmdt(ptr);
    return ret;
  }
  void* voidWrap(char* buf) {
    return (void*) buf;
  }
  %}
