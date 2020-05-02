extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
var timer = 0
func _process(delta):
	var bodies = $Area2D.get_overlapping_bodies()
	
	timer += delta
	if( timer > 1 ):
		timer = 0
		for body in bodies:
			#let the hit the floor
			if( "Car" in body.get_name() ):
				if( body._get_car_called_for() and body._get_car_occupied() == "Not" ):
					body._set_car_retured()
	return




func _on_Area2D_mouse_entered():
	pass # Replace with function body.
