#ifndef R3D2_CONFIG_H
#define R3D2_CONFIG_H
	
	// default motor speed (XXX manque min max XXX)
	#define DEFAULT_MOTOR_SPEED	2200

	// default reflector ratio (_
	#define DEFAULT_SURFACE_REFLECTION_RATIO 2.0

	// default number of motor rotation 
	#define DEFAULT_ROBOT_DETECTED_TIMOUT_TRESHOLD 5

	// default number of motor rotation lost before detecting motor stop (expressed in r3d2_monitor tick)
	#define DEFAULT_MOTOR_ROTATING_TIMOUT_TRESHOLD 3

	// angle offset added to the angle of the detected robot (in degree)
	#define DEFAULT_ROBOT_DETECTED_ANGLE_OFFSET 80

#endif // R3D2_CONFIG_H
