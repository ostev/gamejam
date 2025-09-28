extends Area2D

@export var value: int = 1
@onready var event_controller = get_node("../EventController")  # Adjust path if needed

func _ready():
	connect("body_entered", Callable(self, "_on_key_body_entered"))

func _on_key_body_entered(body: Node2D):
	print("HEllo")
	if body.name == "Player":
		event_controller.emit_signal("key_collected", value)
		queue_free()
		visible = false
