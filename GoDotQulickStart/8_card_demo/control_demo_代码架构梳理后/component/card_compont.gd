extends Control

@export var drag_compont:Node
@export var card_name:String
@onready var auto_drag_compont:Node=get_node("../DragCompont")

#func _ready() -> void:
	#init_card()

func _physics_process(delta: float) -> void:
	if !drag_compont && auto_drag_compont:
		drag_compont=auto_drag_compont
#		 @onready 调用前 此函数会调用
	if drag_compont:
		global_position=drag_compont.global_position

func init_card(card_name:String=self.card_name) -> void:
	var img_name=AllCardMap.infosDic[card_name]['cardName']
	var img_path="res://8_card_demo/gridContanier_demo/assest/"+img_name+".png"
	$TextureRect.texture=load(img_path)
