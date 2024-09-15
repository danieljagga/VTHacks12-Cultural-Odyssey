extends Node2D



func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://world_selection.tscn")


func _on_brazil_button_down() -> void:
	get_tree().change_scene_to_file("res://France.tscn")


func _on_india_button_down() -> void:
	get_tree().change_scene_to_file("res://France.tscn")


func _on_france_button_down() -> void:
	get_tree().change_scene_to_file("res://France.tscn")
