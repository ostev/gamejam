extends CharacterBody2D

const SPEED: float = 40;

func _ready() -> void:
    pass

func _physics_process(delta: float) -> void:
    var direction := Input.get_vector("left", "right", "forward", "backward", )

    velocity = direction * SPEED * delta

    move_and_collide(velocity)
