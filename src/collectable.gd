extends Node

var total_keys: int = 0

signal key_collected(value: int)

func collect_key(value: int):
	total_keys += value
	emit_signal("key_collected", total_keys)
