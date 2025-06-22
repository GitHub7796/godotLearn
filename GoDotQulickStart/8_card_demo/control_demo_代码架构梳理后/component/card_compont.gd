extends Control

@export var drag_compont:Node
@onready var auto_drag_compont:Node=get_node("../DragCompont")

func _physics_process(delta: float) -> void:
	if !drag_compont && auto_drag_compont:
		drag_compont=auto_drag_compont
#		 @onready 调用前 此函数会调用
	if drag_compont:
		global_position=drag_compont.global_position
