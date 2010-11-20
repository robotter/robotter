
#include <avr/io.h>


/* handle alternative names */

#ifndef SPMCSR
#ifndef SPMCR
#  error Cannot find SPMCSR value.
#endif
#define SPMCSR SPMCR
#endif

#ifndef SPMEN
#ifndef SELFPRGEN
#  error Cannot find SPMEN value.
#endif
#define SPMCSR SPMCR
#endif

#ifndef WDTCSR
#ifndef WDTCR
#  error Cannot find WDTCSR value.
#endif
#define WDTCSR WDTCR
#endif

#ifndef WDCE
#ifndef WDTOE
#  error Cannot find WDCE value.
#endif
#define WDCE WDTOE
#endif

/* SPM_PAGESIZE is required to be a power of 2. */
#if (SPM_PAGESIZE != 16 && SPM_PAGESIZE != 32 && SPM_PAGESIZE != 64 && SPM_PAGESIZE != 128 && SPM_PAGESIZE != 256)
#  error Unsupported SPM_PAGESIZE.
#endif


	.text
.global	boot_pgm_copy
	.type	boot_pgm_copy, @function
boot_pgm_copy:
  /* The main method:

  boot_pgm_copy(uint16_t dest, uint16_t src, uint8_t size)

  dest and src are destination addresses. size is a number of pages.

  The following conditions must be fulfilled:
   - dest and src are aligned on SPM_PAGESIZE;
   - size is not null;
   - source and destination areas don't overlap;
   - source and destination areas are not out-of-range;
   - destination area doesn't include the page with the present code;
   - no EEPROM writing is running;
   - watchdog timeout is enabled.

  For devices with more than 64KB of flash, dest refers to the higher 64KB (eg.
  if dest is 0x0400, data will be written to 0x10400).

  Registers mapping
    r26,r27  dest (param)
    r24,r25  src (param)
    r22      size (param)

    r16-r18  local constants
    r20,r21  temp variables

    r30,r31  Z-register / Z-pointer
    r28,r29  X-register (store SPMCSR if needed, then WDTCSR)

  */

  /* use dest in higher 64KB, if available */
#ifdef RAMPZ
  ldi r20,(1<<RAMPZ0)
  out _SFR_IO_ADDR(RAMPZ),r20
#endif

  ; values written to SPMCSR
  ldi r16,(1<<SPMEN)
  ldi r17,(1<<PGERS)
  ldi r18,(1<<PGWRT)+(1<<SPMEN)

  ; on some devices, SPMCSR cannot be set/read using out/in
.if (_SFR_IO_ADDR(SPMCSR) < 64)
/* direct access */
.macro out_SPMCSR reg
  out _SFR_IO_ADDR(SPMCSR),\reg
.endm
.macro in_SPMCSR reg
  in \reg,_SFR_IO_ADDR(SPMCSR)
.endm
.else
/* indirection: stopre SPMCSR in X-register */
  ldi r28,SPMCSR
.macro out_SPMCSR reg
  st X,\reg
.endm
.macro in_SPMCSR reg
  ld \reg,X
.endm
.endif


  ; loop over page count
loop_pages:

  ;; Fill the page buffer
  ; only the word part of Z-pointer is used to fill the page buffer
  ; thus, we do not have to update it between lpm and spm operations

  ; loop over SPM_PAGESIZE size
loop_pagesize:
  ; set Z-pointer with address to read (src)
  movw r30,r24
  ; pgm_read_word_near(), in the temporary register
  lpm r0, Z+
  lpm r1, Z
  ; fill page buffer operation
  out_SPMCSR r16
  spm

  ; src += 2 
  adiw r24,2
  ; while( src % SPM_PAGESIZE != 0 )
  mov r20,r24
#if (SPM_PAGESIZE != 256)
  andi r20,SPM_PAGESIZE-1
#endif
  brne loop_pagesize

  ; set Z-pointer to dest
  movw r30,r26

  ; erase the page
  out_SPMCSR r17
  rcall spm_and_busy_wait

  ; write the page
  out_SPMCSR r18
  rcall spm_busy_wait

  ; dest += SPM_PAGESIZE
#if (SPM_PAGESIZE == 256)
  inc r27
#elif (SPM_PAGESIZE < 64)
  adiw r26,SPM_PAGESIZE
#else
  ; OR-ing first is safe because dest is aligned on SPM_PAGESIZE
  ori r26,SPM_PAGESIZE-1
  adiw r26,1
#endif

  ; while( --size )
  dec r22
  brne loop_pages


  ; NOTE boot_rww_enable() not needed, we reset just after this.

  ;; Enable watchdog, minimum timeout
  ; WDTCSR in X-register
  ldi r28,WDTCSR
  ; start timed sequence (should be OR-ed to current value)
  ldi r20,(1<<WDCE)+(1<<WDE)
  st X,r20
  ; set prescaler (all prescaler bits to 0)
  ;XXX r20 might be reused (is it ok to set WDCE again?)
  ldi r20,(1<<WDE)+0
  st X,r20
  ; wait for watchdog reset
  rjmp .

/* END */

  ; SPM operation followed by boot_spm_busy_wait()
spm_busy_wait:
  spm
  in_SPMCSR r20
  sbrc r20,0
  rjmp spm_wait_2
  ret


/* check size: code must fit in a single page */
.iflt (SPM_PAGESIZE - (.-boot_pgm_copy))
.print "ERROR: Code does not fit in a single SPM page"
.err
.endif

