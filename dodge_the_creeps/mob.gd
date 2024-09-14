extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
#	从 AnimatedSprite2D 的 sprite_frames 属性中获取动画名称的列表。返回的是一个数组，该数组包含三个动画名称：["walk", "swim", "fly"]
	var mob_types= $AnimatedSprite2D.sprite_frames.get_animation_names()
#	randi() % n 会在 0 and n-1 之中选择一个随机整数
	$AnimatedSprite2D.play(mob_types[randi() % mob_types.size()])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free() # Replace with function body.
