extends Control

func _ready():
	$HBoxContainer/VBoxContainer/Play_button.grab_focus()

func _on_Play_button_pressed():
	pass # Replace with function body.


func _on_Info_button_pressed():
	get_tree().change_scene("res://MENUS/info_menu.tscn")


func _on_Exit_button_pressed():
	get_tree().quit()
