extends Control

@export var encounter: Encounter
@onready var combatant1: CombatantUI = $MarginContainer/HBoxContainer/CombatantUI1
@onready var combatant2: CombatantUI = $MarginContainer/HBoxContainer/CombatantUI2

@onready var button_container: VBoxContainer = $MarginContainer/HBoxContainer/VBoxContainer/ButtonsContainer

@onready var action_points_label: Label = $MarginContainer/HBoxContainer/VBoxContainer/ActionPointsLabel

var turn_index: int = 0

const MAX_ACTION_POINTS: int = 3

var action_points: int = 0

func _ready() -> void:
    set_combatant_details(0, combatant1)
    set_combatant_details(1, combatant2)
    _set_action_points(3)

func set_combatant_details(index: int, combatant: CombatantUI) -> void:
    combatant.details = encounter.combatants[index]
    combatant.set_details()

func _is_player_turn() -> bool:
    return turn_index % 2 == 0

func _on_end_turn_pressed() -> void:
    _next_turn()

func _next_turn() -> void:
    _set_action_points(MAX_ACTION_POINTS)
    turn_index += 1

    for button in button_container.get_children():
        button.disabled = !_is_player_turn()

    if !_is_player_turn():
        combatant2.act(combatant1)
        _next_turn()

func _set_action_points(new_action_points: int) -> void:
    action_points = new_action_points
    action_points_label.text = "Action points: %s" % action_points


func _perform_action():
    _set_action_points(action_points - 2)

func _can_perform_action() -> bool:
    return action_points > 2

func _on_bitey_button_pressed() -> void:
    if _can_perform_action():
        _perform_action()
        combatant2.damage(5)
