
// Required by "util/delay.h"
#define F_CPU  ((unsigned long)QUARTZ_FREQ)

/** @name Define Aversive macros.
 * 
 * Including <tt>aversive.h</tt> requires an <tt>autoconf.h</tt>, but we have
 * not such a file.
 * 
 * These declarations are copied from <tt>aversive.h</tt> to define symbols
 * used by the bootloader.
 */
//@{

#ifndef sei
#define sei() __asm__ __volatile__ ("SEI\n") /** enable interrupts */
#endif
/** simple software reset, but doesn't initialize the registers */
#ifndef reset
#define reset()                      \
do {				     \
  __asm__ __volatile__ ("ldi r30,0\n");  \
  __asm__ __volatile__ ("ldi r31,0\n");  \
  __asm__ __volatile__ ("ijmp\n");  \
} while(0)
#endif

//@}

