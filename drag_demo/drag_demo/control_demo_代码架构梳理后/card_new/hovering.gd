extends Card_State

var to_state:String
func enter():
	if tween_hover:
		tween_hover.kill()
	tween_hover=create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_ELASTIC)
	tween_hover.tween_property(owner,"scale",Vector2(1.3,1.3),0.3)
	print("hover enter")
	pass
func exit():
	if tween_hover:
		tween_hover.kill()
	if to_state=="following":
		tween_hover=create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_ELASTIC)
		tween_hover.tween_property(owner,"scale",Vector2(1,1),0.1)
	pass
func update(delta: float) -> void:
	pass
func pysics_update(delta: float) -> void:
	pass
func on_button_button_down() -> void:
	if card.is_card_clickable:
		to_state="clickable"
	elif card.is_card_dragable:
		to_state="dragging"
	sgl_transition.emit(self,to_state)
	pass # Replace with function body.

func on_button_button_up() -> void:
	pass # Replace with function body.

func on_area_2d_area_entered(area: Area2D) -> void:
	pass # Replace with function body.

func on_area_2d_area_exited(area: Area2D) -> void:
	pass # Replace with function body.

func on_area_2d_mouse_entered() -> void:
	pass # Replace with function body.

func on_area_2d_mouse_exited() -> void:
	to_state="following"
	sgl_transition.emit(self,to_state)
	pass # Replace with function body.
