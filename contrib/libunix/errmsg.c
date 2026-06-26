#include <mlvalues.h>
#include <alloc.h>

/* extern int errno; */ 
#include <errno.h>
//extern int sys_nerr;
//extern char *sys_errlist[];

extern int error_table[];

#include <string.h>

char * unix_error_message()
{
  return strerror(errno);
}

