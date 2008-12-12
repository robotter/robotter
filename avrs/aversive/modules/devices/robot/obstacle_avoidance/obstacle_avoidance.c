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
 *  Revision : $Id: obstacle_avoidance.c,v 1.3 2008-05-14 13:27:12 zer0 Exp $
 *
 *  Fabrice DESCLAUX <serpilliere@droids-corp.org>
 *  Olivier MATZ <zer0@droids-corp.org>
 */

#include <aversive.h>
#include <aversive/error.h>

#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <obstacle_avoidance.h>

#define debug_printf(args...)

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

static struct obstacle_avoidance oa;

/** Init the oa structure */
void oa_init(void)
{
	memset(&oa, 0, sizeof(oa));
	
	/* set a default start and point, reserve the first poly and
	 * the first 2 points for it */
	oa.polys[0].pts = oa.points;
	oa.polys[0].l = 2;
	oa_start_end_points(0, 0, 100, 100);
}

/** 
 * Set the start and destination point. Return 0 on sucess
 */
void oa_start_end_points(int32_t st_x, int32_t st_y, int32_t en_x, int32_t en_y)
{
	/* we always use the first 2 points of the table for start and end */
	oa.points[0].x = en_x;
	oa.points[0].y = en_y;
	oa.points[0].valid = 0;
	/* the real dest is the start point for the algorithm */
	oa.points[0].weight = 1;

	oa.points[1].x = st_x;
	oa.points[1].y = st_y;
	oa.points[1].valid = 0;
	oa.points[1].weight = 0;

	oa.cur_pt_idx = 2;
	oa.cur_poly_idx = 1;
}

/**
 * Create a new obstacle polygon. Return NULL on error.
 */
oa_poly_t *oa_new_poly(uint8_t size)
{
	if (oa.cur_pt_idx + size > MAX_PTS)
		return NULL;
	if (oa.cur_poly_idx + 1 > MAX_POLY)
		return NULL;

	oa.polys[oa.cur_poly_idx].l = size;
	oa.polys[oa.cur_poly_idx].pts = &oa.points[oa.cur_pt_idx];
	oa.cur_pt_idx += size;

	return &oa.polys[oa.cur_poly_idx++];
}

/**
 * Add a point to the polygon.
 */
void oa_poly_set_point(oa_poly_t *pol, 
			 int32_t x, int32_t y, uint8_t i)
{
	DEBUG(E_OA, "%s() (%ld,%ld)", __FUNCTION__, x, y);
	
	pol->pts[i].x = x;
	pol->pts[i].y = y;
	pol->pts[i].valid = 0;
	pol->pts[i].weight = 0;
}

oa_point_t * oa_get_path(void)
{
	return oa.u.res;
}

/***************************/

/* Return scalar product */
static int32_t 
prod_scal(int32_t x1, int32_t y1, int32_t x2, int32_t y2)
{
	return x1 * x2 + y1 * y2;
}

/* Return Z of vectorial product */
static int32_t 
prod_vect(int32_t x1, int32_t y1, int32_t x2, int32_t y2)
{
	return x1*y2 - y1*x2;
}

/* Return scalar product */
static int8_t prod_scal_sign(int32_t x1, int32_t y1, int32_t x2, int32_t y2)
{
	int32_t z;
	z = prod_scal(x1, y1, x2, y2);
	if (z==0)
		return 0;
	return z>0?1:-1;
}

/* Return Z of vectorial product */
static int8_t prod_vect_sign(int32_t x1, int32_t y1, int32_t x2, int32_t y2)
{
	int32_t z;
	z = prod_vect(x1, y1, x2, y2);
	if (z==0)
		return 0;
	return z>0?1:-1;
}

/* norm of a vector */
static int32_t 
norm_vect(int32_t x, int32_t y)
{
	return sqrt(x*x+y*y);
}

#if 0 /* not used */
/* same than norm but without the sqrt */
static int32_t 
quick_norm_vect(int32_t x, int32_t y)
{
	return x*x+y*y;
}
#endif 


#define MAX_COEF 5000
/* convert 2 points to a line */
void 
pts2line(const oa_ext_point_t *p1, const oa_ext_point_t *p2, oa_line_t *l)
{
	int32_t max;

	l->a = -(p2->y-p1->y);
	l->b =  (p2->x-p1->x);
	l->c = -(l->a * p1->x + l->b * p1->y);	
	
	max = (ABS(l->a) > ABS(l->b) ? ABS(l->a) : ABS(l->b));
	max = (max > ABS(l->c) ? max : ABS(l->c));

	l->a = (l->a * MAX_COEF) / max;
	l->b = (l->b * MAX_COEF) / max;
	l->c = (l->c * MAX_COEF) / max;
}

/* return values :
 *  0 dont cross
 *  1 cross
 *  2 parallel crossing
 */
uint8_t 
intersect_line(const oa_line_t *l1, const oa_line_t *l2, oa_ext_point_t *p)
{	
	debug_printf("l1:%" PRIi32 ",%" PRIi32 ",%" PRIi32 " l2:%" PRIi32 ",%" PRIi32 ",%" PRIi32 "\n", 
	       l1->a, l1->b, l1->c, l2->a, l2->b, l2->c);

	/* if dummy lines */
	if ((l1->a == 0 && l1->b == 0) || (l2->a == 0 && l2->b == 0))
		return 0;
	
	if (l1->a == 0) {
		if (l2->a == 0) {
			if (l1->b*l2->c == l2->b*l1->c)
				return 2;
			return 0;
		}
		
		/*       by  + c  = 0
		 * a'x + b'y + c' = 0 */
		p->y = -l1->c/l1->b;
		p->x = -(l2->b*p->y + l2->c)/l2->a;
		return 1;
	}
	
	if (l1->b == 0) {
		if (l2->b == 0) {
			if (l1->a*l2->c == l2->a*l1->c)
				return 2;
			return 0;
		}
		/* ax        + c  = 0
		 * a'x + b'y + c' = 0 */
		p->x = -l1->c/l1->a;
		p->y = -(l2->a*p->x + l2->c)/l2->b;
		return 1;
	}

	/* parallel lines */
	if (l2->a*l1->b-l1->a*l2->b == 0) {
		if (l1->a*l2->c == l2->a*l1->c)
			return 2;
		return 0;
	}

	p->y = (l1->a*l2->c-l1->c*l2->a)/(l2->a*l1->b-l1->a*l2->b);
	p->x = -(l1->b*p->y+l1->c)/l1->a;

	return 1;
}



/* return values:
 *  0 dont cross
 *  1 cross 
 *  2 cross on point
 *  3 parallel and one point in
 */
uint8_t 
intersect_segment(const oa_ext_point_t *s1, const oa_ext_point_t *s2, 
		  const oa_ext_point_t *t1, const oa_ext_point_t *t2, 
		  oa_ext_point_t *p)
{
	oa_line_t l1, l2;
	uint8_t ret;
	int8_t u1, u2;

	pts2line(s1, s2, &l1);
	pts2line(t1, t2, &l2);

	ret = intersect_line(&l1, &l2, p);
	if (!ret)
		return 0;
	if (ret==2) {
		if (prod_scal_sign(t1->x-s1->x, t1->y-s1->y, t1->x-s2->x, t1->y-s2->y )<=0)
			return 3;
		if (prod_scal_sign(t2->x-s1->x, t2->y-s1->y, t2->x-s2->x, t2->y-s2->y )<=0)
			return 3;
		return 0;
	}


	/* if points egual */
	if (s1->x == t1->x && s1->y == t1->y) {
		*p = *s1;
		return 2;
	}
	if (s1->x == t2->x && s1->y == t2->y) {
		*p = *s1;
		return 2;
	}
	if (s2->x == t1->x && s2->y == t1->y) {
		*p = *s2;
		return 2;
	}
	if (s2->x == t2->x && s2->y == t2->y) {
		*p = *s2;
		return 2;
	}
	
	debug_printf("px=%" PRIi32 " py=%" PRIi32 "\n", p->x, p->y);

	/* if prod scal neg: cut in middle of segment */
	/* todo for both segment */
	u1 = prod_scal_sign(p->x-s1->x, p->y-s1->y, p->x-s2->x, p->y-s2->y);
	u2 = prod_scal_sign(p->x-t1->x, p->y-t1->y, p->x-t2->x, p->y-t2->y);

	if (u1>0 || u2>0)
		return 0;

	if (u1==0 || u2==0)
		return 2;

	return 1;

}

/* test if a point is in a polygon (including)
 *  0 not inside
 *  1 inside
 *  2 on bord
 */
static uint8_t 
is_in_poly(const oa_ext_point_t *p, oa_poly_t *pol)
{
	uint8_t i;
	uint8_t ii;
	int8_t z;
	uint8_t ret=1;

	for (i=0;i<pol->l;i++) {
		/* is a polygon point */
		if (p->x == pol->pts[i].x && p->y == pol->pts[i].y)
			return 2;
	}

	for (i=0;i<pol->l;i++) {

		ii = (i+1)%pol->l;
		z = prod_vect_sign(pol->pts[ii].x-p->x, pol->pts[ii].y-p->y, 
			      pol->pts[i].x-p->x, pol->pts[i].y-p->y);
		if (z>0)
			return 0;
		if (z==0)
			ret=2;
	}

	return ret;
}

/* public wrapper for is_in_poly() */
uint8_t is_point_in_poly(oa_poly_t *pol, int16_t x, int16_t y)
{
	oa_ext_point_t p;
	p.x = x;
	p.y = y;
	return is_in_poly(&p, pol);
}

/* is segment crossing polygon? (including)
 *  0 no cross
 *  1 cross
 *  2 on side
 *  3 touch out
 */
uint8_t 
is_crossing_poly(oa_ext_point_t p1, oa_ext_point_t p2, oa_poly_t *pol)
{
	uint8_t i;
	uint8_t ret;
	oa_ext_point_t p;
	uint8_t ret1, ret2;
	uint8_t cpt=0;
	
	debug_printf("%" PRIi32 " %" PRIi32 " -> %" PRIi32 " %" PRIi32 " crossing poly %p ?\n", 
	       p1.x, p1.y, p2.x, p2.y, pol);
	debug_printf("poly is : ");
	for (i=0; i<pol->l; i++) {
		debug_printf("%" PRIi32 ",%" PRIi32 " ", pol->pts[i].x, pol->pts[i].y);
	}
	debug_printf("\n");

	for (i=0;i<pol->l;i++) {
		ret = intersect_segment(&p1, &p2, &pol->pts[i], &pol->pts[(i+1)%pol->l], &p);
		debug_printf("%" PRIi32 ",%" PRIi32 " -> %" PRIi32 ",%" PRIi32 
			     " return %d\n", pol->pts[i].x, pol->pts[i].y, 
		       pol->pts[(i+1)%pol->l].x, pol->pts[(i+1)%pol->l].y, ret);
		switch(ret) {
		case 0:
			break;
		case 1:
			return 1;
			break;
		case 2:
			cpt++;
			break;
		case 3:
			return 2;
			break;
		}
	}

	if (cpt==3 ||cpt==4)
		return 1;

	ret1 = is_in_poly(&p1, pol);
	/* XXX opt */
	ret2 = is_in_poly(&p2, pol);

	if (cpt==0) {
		if (ret1==1 || ret2==1)
			return 1;
		return 0;
	}


	if (cpt==1) {
		if (ret1==1 || ret2==1)
			return 1;
		return 3;
	}
	if (cpt==2) {
		if (ret1==1 || ret2==1)
			return 1;
		if (ret1==0 || ret2==0)
			return 3;
		return 1;
	}
	
	return 1;
}

#define IS_IN_PLAYGROUND(pt) ( (pt).x >= PLAYGROUND_X_MIN && \
		(pt).x<=PLAYGROUND_X_MAX && \
		(pt).y >= PLAYGROUND_Y_MIN && (pt).y<=PLAYGROUND_Y_MAX )


uint8_t 
calc_rays(oa_poly_t *polys, uint8_t npolys, uint8_t *rays)
{
	uint8_t i, ii, index;
	uint8_t ray_n=0;
	uint8_t is_ok;
	uint8_t n;
	uint8_t pt1, pt2;

	/* !\\first poly is the start stop point */

	/* 1: calc inner polygon rays */
	
	for (i=0; i<npolys; i++) {
		debug_printf("%d/%d\n", i, npolys);
		for (ii=0; ii<polys[i].l; ii++) {
			debug_printf("%d/%d\n", ii, polys[i].l);
			if (! IS_IN_PLAYGROUND(polys[i].pts[ii]))
				continue;
			is_ok = 1;
			n = (ii+1)%polys[i].l;

			if (!(IS_IN_PLAYGROUND(polys[i].pts[n])))
				continue;


			/* check if a polygon cross our ray */
			for (index=1; index<npolys; index++) {
				
				/* don't check polygon against itself */
				if (index == i) continue;
				
				if (is_crossing_poly(polys[i].pts[ii], polys[i].pts[n], 
						     &polys[index]) == 1) {
					is_ok = 0;
					debug_printf("ret 1\n");
					break;
				}				    
			}
			/* if ray is not crossed, add it */
			if (is_ok) {
				rays[ray_n++] = i;
				rays[ray_n++] = ii;
				rays[ray_n++] = i;
				rays[ray_n++] = n;
			}
		}
	}


	/* 2: calc inter polygon rays */
	/* for all poly */
	for (i=0; i<npolys-1; i++) {
		for (pt1=0;pt1<polys[i].l;pt1++) {

			if (!(IS_IN_PLAYGROUND(polys[i].pts[pt1])))
				continue;

			/* for next poly */
			for (ii=i+1; ii<npolys; ii++) {
				for (pt2=0;pt2<polys[ii].l;pt2++) {

					if (!(IS_IN_PLAYGROUND(polys[ii].pts[pt2])))
						continue;

					is_ok=1;
					/* test if a poly cross */
					for (index=1;index<npolys;index++) {
						if (is_crossing_poly(polys[i].pts[pt1], polys[ii].pts[pt2], &polys[index])==1) {
							is_ok=0;
							break;
						}
					}
					/* if not crossed */
					if (is_ok) {
						rays[ray_n++] = i;
						rays[ray_n++] = pt1;
						rays[ray_n++] = ii;
						rays[ray_n++] = pt2;
					}			
				}
			}
		}	
	}
	
	
	return ray_n;
}


void 
calc_rays_weight(oa_poly_t *polys, uint8_t npolys, uint8_t *rays, 
		 uint8_t ray_n, uint16_t *weight)
{
	uint8_t i;
	for (i=0;i<ray_n;i+=4) {
		weight[i/4] = norm_vect(polys[rays[i]].pts[rays[i+1]].x - polys[rays[i+2]].pts[rays[i+3]].x,
					polys[rays[i]].pts[rays[i+1]].y - polys[rays[i+2]].pts[rays[i+3]].y) + 1;
	}	
}

void 
dijkstra(uint8_t start_p, uint8_t start)
{
	uint8_t i;
	int8_t add;
	int8_t finish = 0;
	/* weight == 0 means not visited */
	/* weight == 1 for start */
	
	/* find all point linked to start */

	oa.polys[start_p].pts[start].valid = 2;

	while (!finish){
		finish = 1;

		for (start_p = 0;start_p<MAX_POLY;start_p++)
			for (start = 0;start<oa.polys[start_p].l;start++){
				if (oa.polys[start_p].pts[start].valid != 2)
					continue;
				add = -2;		
				for (i=0 ; i<oa.ray_n ; i+=2) {
					add = -add;					
					
					if (start_p == oa.u.rays[i] && start == oa.u.rays[i+1]) {
						if ((oa.polys[oa.u.rays[i+add]].pts[oa.u.rays[i+add+1]].weight == 0) || 
						    (oa.polys[start_p].pts[start].weight+oa.weight[i/4] < 
						     oa.polys[oa.u.rays[i+add]].pts[oa.u.rays[i+add+1]].weight)) {
							
							oa.polys[oa.u.rays[i+add]].pts[oa.u.rays[i+add+1]].p = start_p;
							oa.polys[oa.u.rays[i+add]].pts[oa.u.rays[i+add+1]].pt = start;
							oa.polys[oa.u.rays[i+add]].pts[oa.u.rays[i+add+1]].valid=2;
							oa.polys[oa.u.rays[i+add]].pts[oa.u.rays[i+add+1]].weight = 
								oa.polys[start_p].pts[start].weight+oa.weight[i/4];
							
							oa.polys[start_p].pts[start].valid = 1;
							finish = 0;				
						}
					}
				}
			}
	}
}


/* display the path */
int8_t
get_path(oa_poly_t *polys, uint8_t *rays)
{
	uint8_t p, pt, p1, pt1, i;

	p=0;
	pt=1;
	i=0;
	
	/* forget the first point */
	
	while (!(p==0 && pt==0)) {

		if (i>=MAX_CHKPOINTS)
			return -1;

		if (polys[p].pts[pt].valid==0) {
			DEBUG(E_OA, "invalid path!");
			return -1;
		}

		p1 = polys[p].pts[pt].p;
		pt1 =  polys[p].pts[pt].pt;
		p = p1; pt = pt1;
		oa.u.res[i].x = polys[p].pts[pt].x;
		oa.u.res[i].y = polys[p].pts[pt].y;
		DEBUG(E_OA, "result[%d]: %d, %d", i, oa.u.res[i].x, oa.u.res[i].y);
		i++;
	}
	
	return i;
}

int8_t 
oa_process(void)
{
	uint8_t ret;
	uint8_t i;

	ret = calc_rays(oa.polys, oa.cur_poly_idx, oa.u.rays);
	DEBUG(E_OA, "nb_rays = %d", ret);

	DEBUG(E_OA, "Ray list");
	for (i=0;i<ret;i+=4) {
		DEBUG(E_OA, "%d,%d -> %d,%d", oa.u.rays[i], oa.u.rays[i+1], 
		      oa.u.rays[i+2], oa.u.rays[i+3]);
	}
	
	calc_rays_weight(oa.polys, oa.cur_poly_idx, 
			 oa.u.rays, ret, oa.weight);
	
	DEBUG(E_OA, "Ray weights");
	for (i=0;i<ret;i+=4) {
		DEBUG(E_OA, "%d,%d -> %d,%d (%d)", 
		       (int)oa.polys[oa.u.rays[i]].pts[oa.u.rays[i+1]].x,
		       (int)oa.polys[oa.u.rays[i]].pts[oa.u.rays[i+1]].y,
		       (int)oa.polys[oa.u.rays[i+2]].pts[oa.u.rays[i+3]].x,
		       (int)oa.polys[oa.u.rays[i+2]].pts[oa.u.rays[i+3]].y,
		       oa.weight[i/4]);
	}
	
	
	oa.ray_n = ret;
	DEBUG(E_OA, "dijkstra ray_n = %d", ret);
	dijkstra(0, 0);

	return get_path(oa.polys, oa.u.rays);
}
