extends Card_State


func enter():
	pass
func exit():
	pass
func _process(delta: float) -> void:
	pass
func _physics_process(delta: float) -> void:
	if !card.is_button_down:
		sgl_transition.emit(self,"following")
	else:
		var target_position = card.get_global_mouse_position() - card.size/2
		card.global_position = card.global_position.lerp(target_position, 0.4)
		set_whichBackgroundMouseIn()
func set_whichBackgroundMouseIn():
	var mouse_position = card.get_global_mouse_position()
	var nodes = get_tree().get_nodes_in_group("g_card_background")
	for node in nodes:
		if node.get_global_rect().has_point(mouse_position):
			card.whichBackgroundMouseIn=node
			break
