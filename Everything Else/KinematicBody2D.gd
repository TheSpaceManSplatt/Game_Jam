extends KinematicBody2D

onready var info = "Id 10000"
const MOVE_SPEED = 600

func _physics_process(delta):
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
	move_and_collide(move_vec * MOVE_SPEED * delta)


func _get_car_property():
	return info
	
func _set_car_property( data ):
	info = data
