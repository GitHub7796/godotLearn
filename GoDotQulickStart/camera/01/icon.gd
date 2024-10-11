extends Sprite2D

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("right"):
		position.x+=10
	if Input.is_action_pressed("left"):
		position.x-=10
	if Input.is_action_pressed("up"):
		rotation+=PI/20
	if Input.is_action_pressed("dowm"):
		rotation-=PI/20
