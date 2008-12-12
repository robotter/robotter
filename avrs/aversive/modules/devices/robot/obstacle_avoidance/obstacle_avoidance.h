/*  
 *  Copyright Droids Corporation (2007)
 * 
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *
 *  Revision : $Id: obstacle_avoidance.h,v 1.4 2008-05-14 13:27:12 zer0 Exp $
 *
 *  Fabrice DESCLAUX <serpilliere@droids-corp.org>
 *  Olivier MATZ <zer0@droids-corp.org>
 */

/* XXX this should be set in obstacle_avoidance_config.h !! */
#define MAX_POLY 3
#define MAX_PTS 10
#define MAX_RAYS 100
#define MAX_CHKPOINTS 5

#define PLAYGROUND_X_MIN 0 // 30
#define PLAYGROUND_X_MAX 300 // 270

#define PLAYGROUND_Y_MIN 0 // 30
#define PLAYGROUND_Y_MAX 210 // 180

/* point used in processing */
typedef struct _ext_point {
	int32_t x;
	int32_t y;
	int32_t weight;

	/* used for dijkstra */
	uint8_t p;
	uint8_t pt;
	uint8_t valid;

} oa_ext_point_t;

/* point used for result */
typedef struct _point {
	int16_t x;
	int16_t y;
} oa_point_t;

typedef struct _line {
	int32_t a;
	int32_t b;
	int32_t c;
} oa_line_t;

typedef struct _poly {
	oa_ext_point_t * pts;
	uint8_t l;
} oa_poly_t;




/** Init the oa structure */
void oa_init(void);

/** 
 * Set the start and destination point.
 */
void oa_start_end_points(int32_t st_x, int32_t st_y, int32_t en_x, int32_t en_y);

/**
 * Create a new obstacle polygon. Return NULL on error.
 */
oa_poly_t *oa_new_poly(uint8_t size);


/**
 * set a point of the polygon.
 */
void oa_poly_set_point(oa_poly_t *pol, int32_t x, int32_t y, uint8_t i);


/**
 * process the path from start to end. Return 0 on sucess.
 */
int8_t oa_process(void);

/**
 * get the result after a call to oa_process()
 */
oa_point_t * oa_get_path(void);

/**
 * return
 */
uint8_t is_point_in_poly(oa_poly_t *pol, int16_t x, int16_t y);
