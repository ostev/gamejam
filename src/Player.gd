extends CharacterBody2D

const SPEED: float = 300;

func _ready() -> void:
    pass

func _physics_process(delta: float) -> void:
    var direction := Input.get_vector("left", "right", "backward", "forward")
