extends Node2D

var speed=400
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction=Input.get_vector("left","right","up","down")
	print(direction)
	position+=direction*speed*delta
	$AnimationTree["parameters/blend_position"]=direction
