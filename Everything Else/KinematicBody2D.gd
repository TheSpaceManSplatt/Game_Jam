extends KinematicBody2D
onready var VALLET = preload("res://Everything Else/Valet.tscn")
onready var info = "Id 10000"
onready var called_for = false
onready var occupied = "Not"
onready var leavable = false
onready var returned = false
const MOVE_SPEED = 600

func _physics_process(delta):	
	if( occupied == "Player"):
		movement( delta )
	if( called_for ):
		$Sprite.modulate = Color(1,0,0)
	if( returned ):
		take_it_away()


func movement( delta ):
	var move_vec = Vector2()
	
	if Input.is_action_just_released("enter_car"):
		leavable = true
	if Input.is_action_just_pressed("enter_car") and leavable:
		leave_car()
		return
	
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
	return

func leave_car():
	_set_car_occupied( "Not" )
	var vallet = VALLET.instance()
	get_parent().add_child( vallet )
	vallet.position = self.position
	

#global data 
func _get_car_info():
	return info
	
func _set_car_info( data ):
	info = data
	
func _get_car_occupied():
	return occupied
	
func _set_car_occupied( data ):
	occupied = data
	
func _get_car_called_for():
	return called_for
	
func _set_car_called_for( data ):
	called_for = data

func take_it_away():
	pass
