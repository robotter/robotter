
#define ROBOTTER_DEVICE_ID  0

/** @brief Rough timeout before booting at startup, in ms
 * Actual precision is about 262144/freq (33ms at 8Mhz).
 */
#define ROBLOS_BOOT_TIMEOUT   1000

/// Code executed at startup.
#define ROBLOS_INIT
  
//#define ROBLOS_DISABLE_PROG_PAGE
//#define ROBLOS_DISABLE_EXECUTE
//#define ROBLOS_DISABLE_MEM_CRC
//#define ROBLOS_DISABLE_FUSE_READ

