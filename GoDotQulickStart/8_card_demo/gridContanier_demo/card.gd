extends Control
class_name card

enum cardState{follwing,dragging}

@export var cardCurrentState = cardState.follwing
@export var follow_target:Node

var velocity = Vector2.ZERO
var damping = 0.35
var stiffness = 500

func _process(delta: float) -> void:
	match cardCurrentState:
		cardState.dragging:
			var target_position= get_local_mouse_position()-size/2
			global_position=global_position.lerp(target_position,0.4)
		cardState.follwing:
			var target_position=follow_target.global_position
			var displacement = target_position-global_position
			var force = displacement * stiffness
			velocity += force*delta
			velocity *=(1.0-damping)
			global_position += velocity*delta
			


func _on_button_button_down() -> void:
	cardCurrentState=cardState.dragging
	pass # Replace with function body.


func _on_button_button_up() -> void:
	cardCurrentState=cardState.follwing
	pass # Replace with function body.
