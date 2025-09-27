extends Node2D


const Combatant = preload("res://src/Combatant.gd")

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

@export var details: Combatant

func _ready() -> void:
    animated_sprite.play("idle")

func _process(delta: float) -> void:
    pass