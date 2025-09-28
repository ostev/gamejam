extends Control

@onready var label = $Label
@onready var event_controller = get_node("../../EventController")

func _ready():
	event_controller.connect("key_collected", Callable(self, "on_event_key_collected"))

func on_event_key_collected(value: int):
	label.text = "Keys: " + str(value)
