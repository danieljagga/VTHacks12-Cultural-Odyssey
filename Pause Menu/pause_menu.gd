extends Node2D





func _on_quit_pressed() -> void:
	get_tree().quit()

func _input(event: InputEvent) -> void:
	if(event.is_action_pressed("ui_cancel")):
		get_tree().change_scene_to_file("res://Pause Menu/pause_menu.tscn")
		#put these three lines on all of the worlds 
