extends Card_State
var velocity = Vector2.ZERO
var damping = 0.35
var stiffness = 500
func enter():
	pass
func exit():
	pass
func _process(delta: float) -> void:
	pass
func _physics_process(delta: float) -> void:
	if card.is_button_down:
		sgl_transition.emit(self,"dragging")
	else:
		var target_position
		if card.follow_target:
			target_position=card.follow_target.global_position
		else:
			target_position=Vector2(0,0)
		var displacement = target_position-card.global_position
		var force = displacement * stiffness
		velocity += force*delta
		velocity *=(1.0-damping)
		card.global_position += velocity*delta
