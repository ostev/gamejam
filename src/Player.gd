extends CharacterBody2D

const SPEED: float = 40.0
var direction := Vector2.ZERO
var hp: int = 40

func _ready() -> void:
	hp = Globals.player_hp
	position = Globals.player_position

func _physics_process(delta: float) -> void:
	# Update direction every frame
	direction = Input.get_vector("left", "right", "forward", "backward")

	# Apply velocity
	velocity = direction * SPEED

	# Move the player
	move_and_slide()

	# Update animations
	update_animation()

	Globals.player_hp = hp
	Globals.player_position = position

func update_animation():
	var anim = $AnimatedSprite2D

	if direction == Vector2.ZERO:
		anim.stop()
		return

	if direction.x > 0:
		anim.play("right") # 3-frame walk right
	elif direction.x < 0:
		anim.play("left") # 3-frame walk left
	elif direction.y > 0:
		anim.play("down") # 3-frame walk down
	elif direction.y < 0:
		anim.play("up") # 3-frame walk up
