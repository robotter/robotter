#ifndef BRUSH_H
#define BRUSH_H

#include <stdbool.h>

void brush_init(void);

/** @brief Set brush state
 *
 * If state is false, open provides the stopping position.
 * Otherwise it is ignored.
 */
void brush_set_state(bool on, bool open);

void brush_start(void);
void brush_stop(void);

#endif
