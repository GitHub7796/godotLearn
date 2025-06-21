class_name DragComponent
extends Control

enum DRAG_ENUM{DRAGGING,FOLLWING}
@export var follow_target:Node
@export var card:Control
var current_darg_state:DRAG_ENUM = DRAG_ENUM.FOLLWING
var velocity = Vector2.ZERO
var damping = 0.35
var stiffness = 500

func _physics_process(delta: float) -> void:
	handle_drag(delta)

func handle_drag(delta: float):
	match current_darg_state:
		DRAG_ENUM.DRAGGING:
			# 使用全局鼠标位置计算
			var target_position = get_global_mouse_position() - card.size/2
			global_position = global_position.lerp(target_position, 0.4)
		DRAG_ENUM.FOLLWING:
			var target_position
			if follow_target:
				target_position=follow_target.global_position
			else:
				target_position=Vector2(0,0)
			var displacement = target_position-global_position
			var force = displacement * stiffness
			velocity += force*delta
			velocity *=(1.0-damping)
			global_position += velocity*delta

func _on_button_button_down() -> void:
	push_warning("button_down")
	current_darg_state=DRAG_ENUM.DRAGGING
	pass # Replace with function body.


func _on_button_button_up() -> void:
	push_warning("button_up")
	current_darg_state=DRAG_ENUM.FOLLWING
	pass # Replace with function body.
