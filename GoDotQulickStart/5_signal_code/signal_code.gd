extends Sprite2D

var speed = 400
var angular_speed = PI

func _process(delta):
	rotation += angular_speed * delta
	var velocity = Vector2.UP.rotated(rotation) * speed
	position += velocity * delta

func _ready() -> void:
#	get_node 根据名称获取子节点 
	var timer = get_node("Timer")
#	连接 Timer 的 timeout 信号 与 _on_timer_timeout
	timer.timeout.connect(_on_timer_timeout)
	
func _on_timer_timeout():
#	visible 控制节点的可见性
	visible=not visible
