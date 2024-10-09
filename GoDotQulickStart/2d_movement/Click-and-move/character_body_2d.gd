extends CharacterBody2D

@export var speed=400

var target=position

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			target=get_global_mouse_position()
	
func _physics_process(delta: float) -> void:
	velocity=position.direction_to(target)*speed
	look_at(target)
	if position.distance_to(target)>10:
		position+=velocity*delta
	
