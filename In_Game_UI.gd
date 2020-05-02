extends Control

var reputation = 0
var money = 0


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
var timer = 0
func _process(delta):
	timer += delta
	if( timer > 1 ):
		timer = 0
		reputation += 1
		$HBoxContainer/Label.text = str(reputation)
	
	pass
