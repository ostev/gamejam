extends Area2D

func _ready():
	self.body_entered.connect(_on_body_entered)


func _on_body_entered(body):
	if body.is_in_group("Player"):
		print("Do you wish to switch to an alternate dimension at the risk of sacrificing your life?")
