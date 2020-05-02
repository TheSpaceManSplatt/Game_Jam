extends Node2D

onready var CAR = preload("res://Everything Else/Car.tscn")
onready var spawn_loc = [ $spawn_location1,$spawn_location2,$spawn_location3,$spawn_location4 ]
onready var filled = [false,false,false,false,false]

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


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
