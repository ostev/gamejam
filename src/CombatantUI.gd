class_name CombatantUI extends Control

@export var details: CombatantDetails
@onready var animated_sprite: AnimatedSprite2D = $VBoxContainer/MarginContainer/AnimatedSprite2D
var hp: int = 0

@onready var health_bar: ProgressBar = $VBoxContainer/HealthBar
@onready var health_label: Label = $VBoxContainer/HealthBar/CenterContainer/HealthLabel
@onready var label: Label = $VBoxContainer/Label

var encounter_manager: EncounterUIManager
var index: int = 0

func _ready() -> void:
	pass

func set_details():
	print("sprite" + str(animated_sprite))
	animated_sprite.sprite_frames = details.sprite_frames
	animated_sprite.play("default")
	_set_hp(details.max_hp)
	health_bar.max_value = details.max_hp
	label.text = details.name


func die():
	Globals.defeated_enemies.push_back(details.index)
	encounter_manager.kill(index)

func damage(amount: int) -> void:
	_set_hp(hp - amount)

	if hp <= 0:
		die()

func _set_hp(new_hp: int) -> void:
	hp = new_hp
	health_bar.value = new_hp
	health_label.text = "%s/%s" % [new_hp, details.max_hp]

func act(other: CombatantUI) -> void:
	other.damage(5)
