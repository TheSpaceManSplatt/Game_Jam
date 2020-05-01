extends Control

func _ready():
	$HBoxContainer/VBoxContainer/Button.grab_focus()


func _on_Button_pressed():
	get_tree().change_scene("res://MENUS/main menu.tscn")
