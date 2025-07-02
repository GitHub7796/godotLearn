extends Node
class_name Card_State
signal sgl_transition
@onready var card:Card = get_parent().get_parent()
var previous_state: String = "" # 记录上一个状态的名称
var just_drop:bool=false #表示刚放下卡牌
var tween_hover:Tween

func enter():
	pass
func exit():
	pass
## 不可使用physics_process、_physics
func update(delta: float) -> void:
	pass
## 不可使用physics_process、_physics
func pysics_update(delta: float) -> void:
	pass

func on_button_button_down() -> void:
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
	pass # Replace with function body.
