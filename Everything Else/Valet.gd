extends KinematicBody2D

const MOVE_SPEED = 300

func _physics_process(delta):
	if Input.is_action_just_pressed("enter_car"):
		enter_car()
		
	
	var move_vec = Vector2()
	if Input.is_action_pressed("drive_forward"):
		move_vec.y -= 1
	if Input.is_action_pressed("drive_backward"):
		move_vec.y += 1
	if Input.is_action_pressed("steer_left"):
		move_vec.x -= 1
	if Input.is_action_pressed("steer_right"):
		move_vec.x += 1
	move_vec = move_vec.normalized()
	
	if( move_vec.y > 0 ):
			rotation_degrees = 0
	elif( move_vec.y < 0):
			rotation_degrees = 180
	else:
		if( move_vec.x > 0 ):
			rotation_degrees = -90
		elif( move_vec.x < 0 ):
			rotation_degrees = 90
		
	move_and_collide(move_vec * MOVE_SPEED * delta)

func enter_car():
	var bodies = $Area2D.get_overlapping_bodies()
	
	for body in bodies:
		#let the hit the floor
		#@todo add dirction to the playre so they get into the right car
		if( "Car" in body.get_name()  ):
			print( body._get_car_info() )
			body._set_car_occupied("Player")
			get_parent().remove_child(self)
			break
