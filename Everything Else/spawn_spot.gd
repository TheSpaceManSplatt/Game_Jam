extends Node2D

func _get_filled():
	var filled = false
	var bodies = $Area2D.get_overlapping_bodies()
	for body in bodies:
		if( "Car" in body.get_name() ):
			filled = true
	
	return filled

func _get_spawn_location():
	print( $Position2D.get_global_pos() )
	return $Position2D.get_global_pos()
