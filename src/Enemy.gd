@tool
extends Area2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

@export var details: CombatantDetails
@export var battle_scene: PackedScene


func _ready() -> void:
	if details.index in Globals.defeated_enemies:
		queue_free()

	monitoring = true

	animated_sprite.sprite_frames = details.sprite_frames
	animated_sprite.play("default")

	# connect("area_entered", Callable(self, "_trigger_battle"))
	# body_entered.connect(_trigger_battle)

func _trigger_battle(body: Node2D) -> void:
	print("battle!!!")
	get_tree().change_scene_to_packed(battle_scene)


func _on_body_entered(body: Node2D) -> void:
	_trigger_battle(body)


func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	pass # Replace with function body.
