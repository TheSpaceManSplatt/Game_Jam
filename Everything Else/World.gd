extends Node2D

var _timer = null
var car_list = []


func _ready():
	_timer = Timer.new()
	add_child(_timer)

	_timer.connect("timeout", self, "_on_Timer_timeout")
	_timer.set_wait_time(1.0)# here for refered to as a "tick"
	_timer.set_one_shot(false) # Make sure it loops
	_timer.start()


func _on_Timer_timeout():
	# should send radome type of car at random speeds to player
	# the car_area will return an time that should be added to a
	# lsit of cars currently in play this list will be used
	# to randomly determin when a car should be returned to the
	# station
	
	#chance of spawning a new car will go up with how short the line is
	#chance of removing a new car will go up with how many cars are in play
	var add_car = randi()%11+1
	var remove_car = randi()%11+1
	var list_childs = get_children()
	var car_list 
	
	if( add_car > 5 ):
		#@todo link to car_area
		print("make new car")
	if( remove_car > 5 ):
		#@todo link to car_area
		print("remove car")
		car_list = get_car_list()
		print( car_list[randi() % car_list.size()] )
	pass



func get_car_list():
	var car_list = []
	var children = get_children()
	for child in children:
		if( "Car" in child.get_name() ):
			car_list.append( child )

	return car_list
