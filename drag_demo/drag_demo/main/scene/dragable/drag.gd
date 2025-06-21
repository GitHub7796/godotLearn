extends Area2D


var isDarg =false
var offset = Vector2.ZERO
func _process(delta: float) -> void:
	if isDarg:
		self.position=offset+get_global_mouse_position()


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.is_pressed():
			offset=self.position-get_global_mouse_position()
			isDarg = true
		else :
			isDarg = false
