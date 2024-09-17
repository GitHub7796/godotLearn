extends Sprite2D

var speed = 400
var angular_speed = PI

func _process(delta):
	rotation += angular_speed * delta
	var velocity = Vector2.UP.rotated(rotation) * speed
	position += velocity * delta
	


func _on_button_pressed() -> void:
	set_process(not is_processing())
#	set_process Godot 提供打开和关闭 _process
# is_processing 返回 _process 是否开启
