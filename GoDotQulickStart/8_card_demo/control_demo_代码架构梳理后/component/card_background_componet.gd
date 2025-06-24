extends Control
class_name CardBackgroundComponet
@export var min_size:Vector2

func _ready() -> void:
	init()
func init():
	custom_minimum_size=min_size
