extends Node2D

onready var CAR = preload("res://Everything Else/Car.tscn")
onready var spawn_loc = [ $spawn_location1,$spawn_location2,$spawn_location3,$spawn_location4 ]
onready var filled = [false,false,false,false,false]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for i in range(0,4):
		filled[i] = spawn_loc[i]._get_filled()
	
	pass


func spawn_new_car():
	var car = CAR.instance()
	for item in spawn_loc:
		if( !item._get_filled() ):
			get_parent().add_child( car )
			car.position = $spawn_location1.position
			print( car.position )
			return true
