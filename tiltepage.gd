extends Control

func _ready():
	pass

func _on_start_pressed():
	get_tree().change_scene_to_file("res://scenes/context.tscn")

func _on_nextone_pressed():
	get_tree().change_scene_to_file("res://scenes/contexttwo.tscn")

func _on_pressed():
	get_tree().change_scene_to_file("res://scenes/level_1.tscn")

func _on_bonemanb_pressed():
	get_tree().change_scene_to_file("res://scenes/level_1.tscn")


func _on_ready() -> void:
	$tmusic.play()


#extends Control
#
#func _ready():
	#pass
#
#func _on_start_pressed():
	#get_tree().change_scene_to_file("res://scenes/context.tscn")
#
#func _on_nextone_pressed():
	#get_tree().change_scene_to_file("res://scenes/contexttwo.tscn")
#
#func _on_nexttwo_pressed():
	#change_scene_with_delay("res://scenes/level_1.tscn", 5.0)
#
#
#func change_scene_with_delay(scene_path: String, delay: float) -> void:
	#await get_tree().create_timer(delay).timeout
	#get_tree().change_scene_to_file(scene_path)
