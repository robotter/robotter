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
 *  Revision : $Id: obstacle_avoidance.h,v 1.5 2009-03-15 21:51:18 zer0 Exp $
 *
 *  Main code and algorithm: Fabrice DESCLAUX <serpilliere@droids-corp.org>
 *  Integration in Aversive: Olivier MATZ <zer0@droids-corp.org>
 */

/*
 * The algorithm is based on the "visible point" algorithm.
 * There are 3 inputs:
 *   - the play ground (basically the table, here a rectangle)
 *   - the objects to avoid, represented by polygones 
 *   - start/stop points (A, B)
 *
 * The algorithm will first find every ray formed by 2 points that can
 * "see" each others. Basically, if a polygon is between two points,
 * they cannot see each others. A side of a polygon is composed by 2
 * points that can se each others.
 *
 * From all these rays, we can create a graph. We affect for each ray
 * a weight with its own length.
 *
 * The algorithm executes Dijkstra to find the shortest path to go
 * from A to B.
 */

/*
 * As we run on 4Ko ram uC, we have static structures arrays to store:
 *  - MAX_POLY => represent the maximum polygons to avoid in the area.
 *  - MAX_PTS => maximize the sum of every polygons vertices.
 *  - MAX_RAYS => maximum number of rays. 
 *  - MAX_CHKPOINTS => maximum accepted checkpoints in the resulting path.
 *  - PLAYGROUND XXX => dimensions of the playground.
 */

#ifndef _OBSTACLE_AVOIDANCE_H_
#define _OBSTACLE_AVOIDANCE_H_

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

        /* Used to determine if the destination point is reachable */
	uint8_t valid;

} oa_ext_point_t;

/* point used for result */
typedef struct _point {
	int16_t x;
	int16_t y;
} oa_point_t;

/* A line is represented by the equation:
 *   a*x + b*y + c = 0
 *  
 *  This is better than classic a*x + b = y :
 *  here we can handle vertical (a*x + 0*y + c = 0)
 *  and horizontal lines (0*x + b*y + c = 0) */
typedef struct _line {
	int32_t a;
	int32_t b;
	int32_t c;
} oa_line_t;

typedef struct _poly {
	oa_ext_point_t * pts;
	uint8_t l;
} oa_poly_t;


struct obstacle_avoidance {
	oa_poly_t polys[MAX_POLY];  /* tab of polygons (obstacles) */
	oa_ext_point_t points[MAX_PTS]; /* tab of points, referenced by polys */
	
	uint8_t ray_n;
	uint8_t cur_poly_idx;
	uint8_t cur_pt_idx;

	uint16_t weight[MAX_RAYS];
	union {
		uint8_t rays[MAX_RAYS*2];
		oa_point_t res[MAX_CHKPOINTS];
	} u;
};

/* To save memory space here is the moemory representation of
 *   polygons/points:
 *
 *   We have an array of points (oa_ext_point_t points):  
 *  _____ _____ _____ _____ _____ _____ _____ _____ _____
 * |     |     |     |     |     |     |     |     |     |
 * | p0  | p1  | p0  | p1  | p2  | p3  | p0  | p1  | p2  |
 * |_____|_____|_____|_____|_____|_____|_____|_____|_____|
 *
 *
 *  ^            ^                       ^
 *  |            |                       |
 *  -polygon 0   -polygon 1              -polygon 2
 *  -2 vertices  -4 vertices             -3 vertices
 *
 *
 * And each polygon is represented by the sub array starting with the
 * point represented by oa_ext_point_t * pts and composed of uint8_t l; 
 * (in the oa_poly_t structure)
 */

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

#endif /* _OBSTACLE_AVOIDANCE_H_ */
