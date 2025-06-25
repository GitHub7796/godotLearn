extends Node
var is_left_mouse_press_up:bool
func _input(event: InputEvent) -> void:
			# 检查事件是否为鼠标按钮事件
	if event is InputEventMouseButton:
		# 判断是否为鼠标左键
		if event.button_index == MOUSE_BUTTON_LEFT: 
			if event.is_pressed():
				# 鼠标左键按下
				is_left_mouse_press_up = false
			else:
				# 鼠标左键释放
				is_left_mouse_press_up = true
			print("is_left_mouse_press_up:",is_left_mouse_press_up)
