extends Node2D

@export var value: int = 1

func _on_area_2d_body_entered(body: Node2D):
	if body is Player:
		collectable.key_collected(value)
		self.queue_free()

 
