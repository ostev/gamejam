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

func _trigger_battle() -> void:
	print("battle!!!")
	get_tree().change_scene_to_packed(battle_scene)


func _on_body_entered(body: Node2D) -> void:
	# _trigger_battle(body)
	self.call_deferred("_trigger_battle")
