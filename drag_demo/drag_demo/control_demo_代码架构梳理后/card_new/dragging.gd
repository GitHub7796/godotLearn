extends Card_State

func enter():
	pass
func exit():
	if tween_hover:
		tween_hover.kill()
	tween_hover=create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_ELASTIC)
	tween_hover.tween_property(owner,"scale",Vector2(1,1),0.1)
func update(delta: float) -> void:
	pass
func pysics_update(delta: float) -> void:
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
func on_button_button_down() -> void:
	pass # Replace with function body.

func on_button_button_up() -> void:
	just_drop=true
	sgl_transition.emit(self,"following")
	pass # Replace with function body.

func on_area_2d_area_entered(area: Area2D) -> void:
	pass # Replace with function body.

func on_area_2d_area_exited(area: Area2D) -> void:
	pass # Replace with function body.

func on_area_2d_mouse_entered() -> void:
	pass # Replace with function body.

func on_area_2d_mouse_exited() -> void:
	pass # Replace with function body.
