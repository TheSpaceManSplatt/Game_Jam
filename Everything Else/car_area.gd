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
			if( body.get_name() == "Car"):
				print( body._get_car_property() )
			else:
				print( body.get_name() )
	return




func _on_Area2D_mouse_entered():
	pass # Replace with function body.
