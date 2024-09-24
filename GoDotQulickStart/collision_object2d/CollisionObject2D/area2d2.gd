extends Area2D

func _ready() -> void:
	collision_layer = (1 << 7) | (1<< 9)

func _on_mouse_shape_entered(shape_idx: int) -> void:
	print("进来形状"+str(shape_idx))


func _on_mouse_shape_exited(shape_idx: int) -> void:
	print("退出形状"+str(shape_idx))
