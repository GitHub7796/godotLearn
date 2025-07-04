extends Card_State
var velocity = Vector2.ZERO
var damping = 0.35
var stiffness = 500
var arrived_threshold = 2.0 # 到达目标位置的阈值
func enter():
	pass
func exit():
	pass
func update(delta: float) -> void:
	pass
func pysics_update(delta: float) -> void:
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
	if displacement.length()<arrived_threshold:
		just_drop=false
func on_button_button_down() -> void:
	pass # Replace with function body.

func on_button_button_up() -> void:
	pass # Replace with function body.

func on_area_2d_area_entered(area: Area2D) -> void:
	pass # Replace with function body.

func on_area_2d_area_exited(area: Area2D) -> void:
	pass # Replace with function body.

func on_area_2d_mouse_entered() -> void:
	if !just_drop:
		sgl_transition.emit(self,"hovering")
	pass # Replace with function body.

func on_area_2d_mouse_exited() -> void:
	pass # Replace with function body.
