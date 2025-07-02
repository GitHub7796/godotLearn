extends Card_State
var tween_hover:Tween
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
	tween_hover=create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_ELASTIC)
	tween_hover.tween_property(owner,"scale",Vector2(1,1),0.1)
	print("hover exit")
	pass
func Update(delta: float) -> void:
	pass
func Pysics_Update(delta: float) -> void:
	if !card.is_mouse_enter:
		sgl_transition.emit(self,"following")
	pass
