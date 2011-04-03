
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
#define SPMEN SELFPRGEN
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

  .section .roblocop,"ax"
roblocop_address = ((FLASHEND+1)-SPM_PAGESIZE)
.global	roblocop_pgm_copy
  .size roblocop_pgm_copy, SPM_PAGESIZE
  .align 1
	.type	roblocop_pgm_copy, @function
roblocop_pgm_copy:
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
    r24,r25  dest (param)
    r22,r23  src (param), moved to r26
    r20      size (param)

    r26,r27  src (actually used value)

    r18      parameter value for .L_safe_spm
    r19      temp variable

    r30,r31  Z-register / Z-pointer

  */

  ; move src to a register suitable for adiw
  movw r26,r22

#ifdef RAMPZ
  ldi r19,1
  sts RAMPZ,r19
#endif

  ; loop over page count
.L_loop_pages:

  ;; Fill the page buffer

  ; loop over SPM_PAGESIZE size
.L_loop_pagesize:

  ; set Z-pointer with address to read (src)
  movw r30,r26
  ; pgm_read_word_near(), in the temporary register
  lpm r0, Z+
  lpm r1, Z

  ; set Z-pointer to dest, but with the incremented part from src
#if (SPM_PAGESIZE == 256)
  movw r30,r24
  mov r30,r26
  ; also possible, but not recommanded (last bit should be 0):
  ;mov r31,r25
#else
  andi r30,SPM_PAGESIZE-2  ; keep src offset, last bit set to 0
  or r30,r24  ; add page part from dest
  mov r31,r25
#endif
  ; fill page buffer operation
  ldi r18,(1<<SPMEN)
  rcall .L_safe_spm

  ; src += 2
  adiw r26,2

  ; while( src % SPM_PAGESIZE != 0 )
#if (SPM_PAGESIZE == 256)
  cpi r26,0
#else
  mov r18,r26
  andi r18,SPM_PAGESIZE-1
#endif
  brne .L_loop_pagesize

  ; set Z-pointer to dest
  movw r30,r24
  ; erase the page
  ldi r18,(1<<PGERS)+(1<<SPMEN)
  rcall .L_safe_spm
  ; write the page
  ldi r18,(1<<PGWRT)+(1<<SPMEN)
  rcall .L_safe_spm

  ; dest += SPM_PAGESIZE
#if (SPM_PAGESIZE == 256)
  inc r25
#elif (SPM_PAGESIZE < 64)
  adiw r24,SPM_PAGESIZE
#else
  ; OR-ing first is safe because dest is aligned on SPM_PAGESIZE
  ori r24,SPM_PAGESIZE-1
  adiw r24,1
#endif

  ; while( --size )
  dec r20
  brne .L_loop_pages

  ; Enable watchdog to reset
  ldi r19,(1<<WDE)
.if (_SFR_IO_ADDR(WDTCSR) < 64)
  out _SFR_IO_ADDR(WDTCSR),r19
.else
  sts WDTCSR,r19
.endif
.L_wdt_wait:
  rjmp .L_wdt_wait

/* END */

  ; SPM operation followed by boot_spm_busy_wait()
  ; SPMCSR value must be stored in r18
.L_safe_spm:
.if (_SFR_IO_ADDR(SPMCSR) < 64)
  in r19,_SFR_IO_ADDR(SPMCSR)
.else
  lds r19,SPMCSR
.endif
  sbrc r19,SPMEN
  rjmp .L_safe_spm
.if (_SFR_IO_ADDR(SPMCSR) < 64)
  out _SFR_IO_ADDR(SPMCSR),r18
.else
  sts SPMCSR,r18
.endif
  spm
  ret


/* check size: code must fit in a single page */
.iflt (SPM_PAGESIZE - (.-roblocop_pgm_copy))
.print "ERROR: Code does not fit in a single SPM page"
.err
.endif

