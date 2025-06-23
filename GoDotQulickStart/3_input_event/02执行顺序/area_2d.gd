extends Area2D
@export var node_name:String

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			print("_input:",node_name)
func _unhandled_input(event: InputEvent) -> void:
		if event is InputEventMouseButton:
			if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
				print("_unhandled_input:",node_name)
func _shortcut_input(event: InputEvent) -> void:
		if event is InputEventMouseButton:
			if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
				print("_shortcut_input:",node_name)
func _unhandled_key_input(event: InputEvent) -> void:
		if event is InputEventMouseButton:
			if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
				print("_unhandled_key_input:",node_name)

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
		if event is InputEventMouseButton:
			if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
				print("_on_input_event:",node_name)
