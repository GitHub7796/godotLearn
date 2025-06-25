extends Node
@export var node_name:String
func _physics_process(delta: float) -> void:
	print(node_name)
