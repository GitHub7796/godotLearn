extends Node
class_name Card_State
signal sgl_transition
@onready var card:Card = get_parent().get_parent()
func enter():
	pass
func exit():
	pass
## 不可使用 _physics_process、_physics
func Update(delta: float) -> void:
	pass
## 不可使用 _physics_process、_physics
func Pysics_Update(delta: float) -> void:
	pass
