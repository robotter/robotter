#include <vect2.h>

#include  <stdio.h>

int main(void)
{
	vect2_pol vP;

	vect2_pol vP2;
	vect2_pol vP3;
	
	vect2_cart vC;

	vect2_cart vC2;
	vect2_cart vC3;
	

	Real R = 1.45064930529587234;
	/* theta must be [0,2*Pi] or fake errors will appears ( because of modulo ) */
	Real theta = 0.6734390282904231341;

	Real R2 = 120398490.45064930529587234;
	/* theta2 must be [0,2*Pi] or fake errors will appears ( because of modulo ) */
	Real theta2 = 0.00001293892147;
	
	Real X = 2.5693042;
	Real Y = 957802.203419598832952903;

	Real X2 = 984.1204192049021;
	Real Y2 = 0.000034248975923;
	
	Real alpha = 93.1240812795;

	
	/* */
	
	vP.r = R;
	vP.theta = theta;

	/* */
	
	printf("\nTesting polar->cartesian->polar convertions...\n");
	
	vect2_pol2cart(&vP,&vC);

	vect2_cart2pol(&vC,&vP);

	printf("Error on r = %f%%\nError on theta = %f%%\n",100 - 100*(vP.r)/R,100 - 100*(vP.theta)/theta);

	/* */

	vC.x = X;
	vC.y = Y;

	/* */
	
	printf("\nTesting cartesian->polar->cartesian convertions...\n");

	vect2_cart2pol(&vC,&vP);	
	vect2_pol2cart(&vP,&vC);

	printf("Error on x = %f%%\nError on y = %f%%\n",100 - 100*(vC.x)/X,100 - 100*(vC.y)/Y);	


	vC2.x = X2;
	vC2.y = Y2;


	/* Realise C = A + B puis C - B == A et C - A == B */
	
	printf("\nTesting cartesian addition and sub...\nV3 <- V1 + V2\nV3 - V2 == V1\nV3 - V1 == V2\n");
	
	vect2_add_cart(&vC,&vC2,&vC3);
	vect2_sub_cart(&vC3,&vC2,&vC);
	vect2_sub_cart(&vC3,&vC,&vC2);

	printf("Error on x1 = %f%%\nError on y1 = %f%%\n",100 - 100*(vC.x)/X,100 - 100*(vC.y)/Y);	
	printf("Error on x2 = %f%%\nError on y2 = %f%%\n",100 - 100*(vC2.x)/X2,100 - 100*(vC2.y)/Y2);		
	/* */
	
	vP.r = R;
	vP.theta = theta;
	
	vP2.r = R2;
	vP2.theta = theta2;
	
	/* */
	
	printf("\nTesting polar addition and sub...\nV3 <- V1 + V2\nV3 - V2 == V1\nV3 - V1 == V2\n");
	
	vect2_add_pol(&vP,&vP2,&vP3);
	vect2_sub_pol(&vP3,&vP2,&vP);
	vect2_sub_pol(&vP3,&vP,&vP2);

	printf("Error on r1 = %f%%\nError on theta1 = %f%%\n",100 - 100*(vP.r)/R,100 - 100*(vP.theta)/theta);	
	printf("Error on r2 = %f%%\nError on theta2 = %f%%\n",100 - 100*(vP2.r)/R2,100 - 100*(vP2.theta)/theta2);

	/* */

	vC.x = X;
	vC.y = Y;

	/* */
	
	printf("\nTesting cartesian scaling...\nV1 = alpha*V2\n(1/alpha)*V1 == V2\n");
		
	vect2_scale_cart(&vC,alpha,&vC2);
	vect2_scale_cart(&vC2,1/alpha,&vC);

	printf("Error on x = %f%%\nError on y = %f%%\n",100 - 100*(vC.x)/X,100 - 100*(vC.y)/Y);	

	
	/* */

	vP.r = R;
	vP.theta = theta;

	/* */
	
	printf("\nTesting polar scaling...\nV1 = alpha*V2\n(1/alpha)*V1 == V2\n");

	vect2_scale_pol(&vP,alpha,&vP2);
	vect2_scale_pol(&vP2,1/alpha,&vP);

	printf("Error on r = %f%%\nError on theta = %f%%\n",100 - 100*(vP.r)/R,100 - 100*(vP.theta)/theta);	

	
	return 0;
}
