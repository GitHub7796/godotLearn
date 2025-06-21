extends Panel
@export var follow_target:Node
var velocity = Vector2.ZERO
var damping = 0.35
var stiffness = 500

func _process(delta: float) -> void:
		var target_position=follow_target.global_position
		var displacement = target_position-global_position
		var force = displacement * stiffness
		velocity += force*delta
		velocity *=(1.0-damping)
		global_position += velocity*delta
