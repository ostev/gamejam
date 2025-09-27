extends Control

@export var encounter: Encounter
@onready var combatant1: CombatantUI = $MarginContainer/HBoxContainer/CombatantUI1
@onready var combatant2: CombatantUI = $MarginContainer/HBoxContainer/CombatantUI2

@onready var button_container: VBoxContainer = $MarginContainer/HBoxContainer/ButtonsContainer

var turn_index: int = 0

func _ready() -> void:
	set_combatant_details(0, combatant1)
	set_combatant_details(1, combatant2)

func set_combatant_details(index: int, combatant: CombatantUI) -> void:
	combatant.details = encounter.combatants[index]
	combatant.set_details()

func _is_player_turn() -> bool:
	return turn_index % 2 == 0

func _on_end_turn_pressed() -> void:
	_next_turn()

func _next_turn() -> void:
	turn_index += 1

	for button in button_container.get_children():
		button.disabled = !_is_player_turn()

	if !_is_player_turn():
		combatant2.act


func _on_bitey_button_pressed() -> void:
	combatant2.damage(5)
