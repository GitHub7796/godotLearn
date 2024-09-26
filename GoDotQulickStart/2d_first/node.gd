extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var local_pos = Vector2(10, 20) # Local to Control/Node2D.
	var ie = InputEventMouseButton.new()
	ie.button_index = MOUSE_BUTTON_LEFT
	ie.position = get_viewport().get_screen_transform() * get_global_transform_with_canvas() * local_pos
	Input.parse_input_event(ie)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
