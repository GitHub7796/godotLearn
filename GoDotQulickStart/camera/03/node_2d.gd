extends Node2D

var speed=10

func _physics_process(delta: float) -> void:
	var direction = Input.get_axis("left","right")
	poxition.x = direction*delta*speed
