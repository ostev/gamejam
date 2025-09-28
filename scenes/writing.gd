extends RichTextLabel


func _ready():
	for i in range(0,get_total_character_count() + 1):
		await get_tree().create_timer(0.01).timeout
		visible_characters += 1
