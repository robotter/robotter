#include "vect2.h"

#include <stdlib.h>
#include <math.h>

/* Convert a polar vector to a cartesian one */
void vect2_pol2cart(vect2_pol* vp, vect2_cart* vc)
{
   if(vp == NULL) return;
   if(vc == NULL) return;
   
   vc->x = (Real)( (vp->r)*cos(vp->theta) );
   vc->y = (Real)( (vp->r)*sin(vp->theta) );
   
   return;
}

/* Convert a cartesian vector to a polar one */
void vect2_cart2pol(vect2_cart* vc, vect2_pol* vp)
{
   if(vc == NULL) return;
   if(vp == NULL) return;
   
   vp->r = (Real)( sqrt((vc->x)*(vc->x)+(vc->y)*(vc->y)) );
   vp->theta = (Real)atan2(vc->y,vc->x);
   
   return;
}


/* Add 2 polar vectors and return the result */
void vect2_add_pol(vect2_pol* vp1, vect2_pol* vp2, vect2_pol* vresult)
{
	vect2_cart vc1;
	vect2_cart vc2;

	vect2_cart vc;

	vect2_pol2cart(vp1,&vc1);
	vect2_pol2cart(vp2,&vc2);
	
	vect2_add_cart(&vc1,&vc2,&vc);
	
	vect2_cart2pol(&vc,vresult);
	
	return;
}

/* Add 2 cartesian vectors and return the result */
void vect2_add_cart(vect2_cart* vc1, vect2_cart* vc2, vect2_cart* vresult)
{
	vresult->x = vc1->x + vc2->x;
	vresult->y = vc1->y + vc2->y;
	
	return;
}


/* Substract 2 polar vectors and return the result */
void vect2_sub_pol(vect2_pol* vp1, vect2_pol* vp2, vect2_pol* vresult)
{
	vect2_cart vc1;
	vect2_cart vc2;
	
	vect2_cart vc;
	
	vect2_pol2cart(vp1,&vc1);
	vect2_pol2cart(vp2,&vc2);
	
	vect2_sub_cart(&vc1,&vc2,&vc);
	
	vect2_cart2pol(&vc,vresult);
	
	return;
}

/* Substract 2 cartesian vectors and return the result */
void vect2_sub_cart(vect2_cart* vc1, vect2_cart* vc2, vect2_cart* vresult)
{
	vresult->x = vc1->x - vc2->x;
	vresult->y = vc1->y - vc2->y;
	
	return;
}


/* Multiply a cartesian vector by a scalar and return the result */
void vect2_scale_cart(vect2_cart* vc1, Real alpha, vect2_cart* vresult)
{
	vresult->x = alpha*(vc1->x);
	vresult->y = alpha*(vc1->y);
	
	return;
}

/* Multiply a polar vector by a scalar and return the result */
void vect2_scale_pol(vect2_pol* vp1, Real alpha, vect2_pol* vresult)
{
	vresult->r = alpha*vp1->r;

	return;
}
