extends GridContainer

## pannel 尺寸
@export var grid_size:Vector2
## 网格列数
@export var grid_column:int
## 网格行数
@export var grid_row:int
## 网格内容
@export var grid_cotent:Control
@onready var grid_componet = $"."

func _ready() -> void:
	init()

func init():
	if !grid_cotent:
		grid_cotent=Panel.new()
		grid_cotent.custom_minimum_size=grid_size
	var width = grid_column*grid_size.x
	var total = grid_column*grid_row
	var height = grid_row*grid_size.y
	grid_componet.columns=grid_column
	grid_componet.size=Vector2(width,height)
	for i in range(total):
		#var grid_cotent=grid_cotent.init(grid_size)
		var grid_cotent=Panel.new()
		#var card_background=CardBackgroundComponet.new()
		var card_background=load("res://8_card_demo/control_demo_代码架构梳理后/component/card_background_componet.tscn").instantiate()
		grid_cotent.add_child(card_background)
		grid_cotent.custom_minimum_size=grid_size
		grid_componet.add_child(grid_cotent)
	
