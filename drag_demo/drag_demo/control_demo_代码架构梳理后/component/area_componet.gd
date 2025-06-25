extends Node
class_name AreaComponet
signal sgl_synthesize

var is_area_enter:bool=false
var is_mouse_enter:bool=false
var is_left_mouse_press_up:bool=false
@export var card_compont:Node
@onready var auto_card_compont:Node=get_node("../CardCompont")

func _physics_process(delta: float) -> void:
	if !card_compont && auto_card_compont:
		card_compont=auto_card_compont
#		 @onready 调用前 此函数会调用
	if card_compont:
		$CollisionShape2D.global_position=card_compont.global_position+card_compont.size/2
	sgl_synthesize_emit()

func sgl_synthesize_emit():
	if is_area_enter && is_mouse_enter && is_left_mouse_press_up:
		print("sgl_synthesize_emit 1")
		add_to_group("g_synthesize")
		sgl_synthesize.emit()
		
	pass

func _on_area_entered(area: Area2D) -> void:
	is_area_enter=true
	print("is_area_enter:",is_area_enter)
	pass # Replace with function body.


func _on_area_exited(area: Area2D) -> void:
	is_area_enter=false
	print("is_area_enter:",is_area_enter)
	pass # Replace with function body.


func _on_mouse_entered() -> void:
	is_mouse_enter=true
	print("is_mouse_enter:",is_mouse_enter)
	pass # Replace with function body.


func _on_mouse_exited() -> void:
	is_mouse_enter=false
	print("is_mouse_enter:",is_mouse_enter)
	pass # Replace with function body.
func _input(event: InputEvent) -> void:
		# 检查事件是否为鼠标按钮事件
	if event is InputEventMouseButton:
		# 判断是否为鼠标左键
		if event.button_index == MOUSE_BUTTON_LEFT: 
			if event.is_pressed():
				# 鼠标左键按下
				print("is_left_mouse_press_up false")
				is_left_mouse_press_up = false
			else:
				# 鼠标左键释放
				print("is_left_mouse_press_up true")
				is_left_mouse_press_up = true
func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
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
	pass # Replace with function body.
