extends Sprite2D

var speed = 400
var angular_speed = PI

# delta : 从上一帧开始经过的时间
#func _process(delta: float) -> void:
##	direction 局部变量是一个乘数，代表玩家想要转向的方向。
## 0 的值表示玩家没有按左或右方向键。
##1 表示玩家想向右转，
 ##-1 表示他们想向左转
	#var direction = 0
	#if Input.is_action_pressed("ui_left"):
		#direction=-1
	#if Input.is_action_pressed("ui_right"):
		#direction=1
	#rotation+= angular_speed*delta*direction
	#var velocity=Vector2.ZERO
	#if Input.is_action_pressed("ui_up"):
		#velocity=Vector2.UP.rotated(rotation)*speed
	#position += velocity*delta
func _process(delta):
	rotation += angular_speed * delta
	var velocity = Vector2.UP.rotated(rotation) * speed
	position += velocity * delta
func _ready() -> void:
#	场景加载好被调用
	var timer=get_node("Timer")
	timer.timeout.connect(_on_timer_timeout)

func _on_button_pressed() -> void:
	set_process(not is_processing())
func _on_timer_timeout():
#	用于控制节点的可见性
	visible = not visible
