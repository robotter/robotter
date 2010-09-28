#ifndef R3D2_H
#define R3D2_H

	#include <aversive.h>

	typedef enum {
		robot_not_detected = 0x00,
		robot_detected
	} robot_detected_t;

	void r3d2_init(void);
	
	void start_r3d2(void);
	void stop_r3d2(void);

	robot_detected_t is_robot_detected(void);

	double get_detected_robot_angle(void);

	double get_detected_robot_distance(void);

	void r3d2_monitor(void *dummy);

	//---------------------------------------------
	// ACCESSORS
	void enable_sensor(void);
	void disable_sensor(void);

	void start_motor(void);
	void stop_motor(void);
	
	void set_motor_speed(uint16_t speed);
	uint16_t get_motor_speed(void);

	void set_motor_rotating_timout_treshold(uint8_t value);
	uint8_t get_motor_rotating_timout_treshold(void);

	uint8_t get_robot_detected_timout_treshold(void);
	void set_robot_detected_timout_treshold(uint8_t treshold);

	void set_robot_detected_angle_offset(double offset);
	double get_robot_detected_angle_offset(void);
	void update_angle_offset_from_object_angle(double given_angle);

	double get_surface_reflection_ratio(void);
	void set_surface_reflection_ratio(double ratio);
	void update_surface_ratio_from_object_distance(double distance);

	uint8_t get_robot_detected_timout_treshold(void);
	void set_robot_detected_timout_treshold(uint8_t treshold);


#endif // R3D2_H 
