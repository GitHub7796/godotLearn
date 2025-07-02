extends Card_State
func enter():
	pass
func exit():
	if tween_hover:
		tween_hover.kill()
	tween_hover=create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_ELASTIC)
	tween_hover.tween_property(owner,"scale",Vector2(1,1),0.1)
## 不可使用 _physics_process、_physics
func update(delta: float) -> void:
	pass
## 不可使用 _physics_process、_physics
func pysics_update(delta: float) -> void:
	pass
func on_button_button_down() -> void:
	if tween_hover:
		tween_hover.kill()
	tween_hover=create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_ELASTIC)
	tween_hover.tween_property(owner,"scale",Vector2(1.2,1.2),0.1)
	tween_hover.tween_property(owner,"scale",Vector2(1.3,1.3),0.1)
	SignalBus.sgl_click_card.emit()
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
	sgl_transition.emit(self,"following")
	pass # Replace with function body.
