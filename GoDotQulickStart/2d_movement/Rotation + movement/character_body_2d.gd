extends CharacterBody2D

@export var speed=400
func get_input():
	look_at(get_global_mouse_position())
	velocity=transform.x*Input.get_axis("down", "up")*speed
	
func _physics_process(delta: float) -> void:
	get_input()
	position += velocity*delta
	
