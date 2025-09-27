@tool
extends Node2D


@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

@export var details: Combatant

func _ready() -> void:
    animated_sprite.sprite_frames = details.sprite_frames
    animated_sprite.play("idle")

func _process(delta: float) -> void:
    pass