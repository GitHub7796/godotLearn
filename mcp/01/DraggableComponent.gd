extends Node2D
class_name DraggableComponent

# 信号定义
signal drag_started
signal drag_ended
signal dragging(offset: Vector2)

# 拖拽属性
@export var enabled: bool = true  # 是否启用拖拽
@export var drag_limit: bool = false  # 是否限制拖拽范围
@export var drag_limit_rect: Rect2 = Rect2()  # 拖拽范围限制
@export var drag_speed: float = 1.0  # 拖拽速度系数

# 内部变量
var is_dragging: bool = false
var drag_offset: Vector2 = Vector2.ZERO
var target_node: Node2D  # 被拖拽的目标节点

func _ready() -> void:
	# 获取父节点作为拖拽目标
	target_node = get_parent() as Node2D
	if not target_node:
		push_error("DraggableComponent 必须作为 Node2D 的子节点！")
		queue_free()
		return
	
	# 确保父节点可以接收输入
	target_node.mouse_filter = Control.MOUSE_FILTER_STOP

func _input(event: InputEvent) -> void:
	if not enabled or not target_node:
		return
		
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				# 检查点击是否在目标节点上
				if _is_point_inside_target(event.position):
					_start_drag(event.position)
			else:
				if is_dragging:
					_end_drag()
					
	elif event is InputEventMouseMotion and is_dragging:
		_update_drag_position(event.position)

func _is_point_inside_target(point: Vector2) -> bool:
	# 将全局坐标转换为目标节点的局部坐标
	var local_point = target_node.to_local(point)
	# 检查点是否在目标节点的矩形范围内
	var rect = Rect2(Vector2.ZERO, target_node.get_rect().size)
	return rect.has_point(local_point)

func _start_drag(position: Vector2) -> void:
	is_dragging = true
	drag_offset = target_node.global_position - position
	emit_signal("drag_started")

func _update_drag_position(position: Vector2) -> void:
	var new_position = position + drag_offset
	
	if drag_limit:
		# 限制在指定范围内
		new_position.x = clamp(new_position.x, drag_limit_rect.position.x, drag_limit_rect.end.x)
		new_position.y = clamp(new_position.y, drag_limit_rect.position.y, drag_limit_rect.end.y)
	
	# 应用新位置
	target_node.global_position = new_position
	emit_signal("dragging", drag_offset)

func _end_drag() -> void:
	is_dragging = false
	emit_signal("drag_ended")

# 公共方法：设置拖拽范围
func set_drag_limit_rect(rect: Rect2) -> void:
	drag_limit_rect = rect
	drag_limit = true

# 公共方法：启用/禁用拖拽
func set_enabled(value: bool) -> void:
	enabled = value
	if not enabled and is_dragging:
		_end_drag() 