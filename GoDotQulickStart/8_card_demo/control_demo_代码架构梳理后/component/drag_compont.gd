class_name DragComponent
extends Control
## 需要初始化 target_position、card
enum DRAG_ENUM{DRAGGING,FOLLWING}
@export var follow_target:Node
@export var card:Control
@onready var auto_card_component:Control=get_node("../CardCompont")
## 宽
@export var weight:float=100
## 高
@export var height:float=100
var current_darg_state:DRAG_ENUM = DRAG_ENUM.FOLLWING
var velocity = Vector2.ZERO
var damping = 0.35
var stiffness = 500
var whichBackgroundMouseIn:Control
func _ready() -> void:
	if !card && auto_card_component:
		card=auto_card_component
#		 @onready 调用前 此函数会调用
	set_children_mouse_filter_pass(get_parent())
	set_size(Vector2(weight,height))

func _physics_process(delta: float) -> void:
	handle_drag(delta)
	set_whichBackgroundMouseIn()
func set_whichBackgroundMouseIn():
	var mouse_position =get_global_mouse_position()
	var nodes = get_tree().get_nodes_in_group("g_card_background")
	for node in nodes:
		if node.get_global_rect().has_point(mouse_position):
			whichBackgroundMouseIn=node
			break
## 防止鼠标点击事件被中断
func set_children_mouse_filter_pass(node:Node):
	for child in node.get_children():
		if child is Control:
			child.mouse_filter=Control.MOUSE_FILTER_PASS
		set_children_mouse_filter_pass(child)

func handle_drag(delta: float):
	match current_darg_state:
		DRAG_ENUM.DRAGGING:
			dragging_move_before(delta)
			dragging_moveing(delta)
			dragging_move_after(delta)
		DRAG_ENUM.FOLLWING:
			folling_move_before(delta)
			folling_moveing(delta)
			folling_move_after(delta)

func _on_button_button_down() -> void:
	button_down_before()
	print("button_down:drag component")
	current_darg_state=DRAG_ENUM.DRAGGING
	button_down_after()
	pass # Replace with function body.


func _on_button_button_up() -> void:
	button_up_before()
	current_darg_state=DRAG_ENUM.FOLLWING
	follow_target=whichBackgroundMouseIn
	button_up_after()
	pass # Replace with function body.
func dragging_move_before(delta: float):
	pass
func dragging_move_after(delta: float):
	pass
func dragging_moveing(delta: float):
	# 使用全局鼠标位置计算
	if card:
		var target_position = get_global_mouse_position() - card.size/2
		global_position = global_position.lerp(target_position, 0.4)
func folling_move_before(delta: float):
	pass
func folling_move_after(delta: float):
	pass
func folling_moveing(delta: float):
	var target_position
	if follow_target:
		target_position=follow_target.global_position
	else:
		target_position=Vector2(0,0)
	var displacement = target_position-global_position
	var force = displacement * stiffness
	velocity += force*delta
	velocity *=(1.0-damping)
	global_position += velocity*delta
func button_up_before():
	pass
func button_up_after():
	pass
func button_down_before():
	pass
func button_down_after():
	pass
