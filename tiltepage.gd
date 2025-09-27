extends Control
func _on_start_pressed():
	get_tree().change_scene_to_file("res://scenes/context.tscn")

func _on_nextone_pressed():
	get_tree().change_scene_to_file("res://scenes/contexttwo.tscn")

func _on_nexttwo_pressed():
	get_tree().change_scene_to_file("res://scenes/World.tscn")


func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/World.tscn")
