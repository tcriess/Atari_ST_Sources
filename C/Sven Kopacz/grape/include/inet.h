#if  !defined( __INET__ )
#define __INET__
#include <in.h>

extern unsigned long inet_addr(const char *cpp);
extern unsigned long inet_network(const char *cp);
extern char *inet_ntoa(unsigned long in);
extern unsigned long	inet_lnaof(struct in_addr in);
/*extern unsigned long	inet_netof(struct in_addr);*/
#endif