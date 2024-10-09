extends CharacterBody2D

@export var speed=400

func get_input():
	var input_direction=Input.get_vector("left", "right", "up", "down")
	velocity=input_direction*speed
func move(delta):
	position += velocity*delta
func _physics_process(delta: float) -> void:
	get_input()
	move(delta)
	
