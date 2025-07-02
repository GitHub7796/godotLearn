extends Control
class_name Card
@export var follow_target:Node
@export var is_card_clickable:bool=false
@export var is_card_dragable:bool=false
@onready var state_mechine=$State

var whichBackgroundMouseIn:Control
func _on_button_button_down() -> void:
	state_mechine.on_button_button_down()
	pass # Replace with function body.

func _on_button_button_up() -> void:
	state_mechine.on_button_button_up()
	# print("is_button_down:",is_button_down)
	pass # Replace with function body.


func _on_area_2d_area_entered(area: Area2D) -> void:
	state_mechine.on_area_2d_area_entered(area)
	#add_to_group("g_synthesize")
	# print("_on_area_2d_area_entered:",is_area_enter)
	pass # Replace with function body.


func _on_area_2d_area_exited(area: Area2D) -> void:
	state_mechine.on_area_2d_area_exited(area)
	# remove_from_group("g_synthesize")
	# print("_on_area_2d_area_entered:",is_area_enter)
	pass # Replace with function body.


func _on_area_2d_mouse_entered() -> void:
	state_mechine.on_area_2d_mouse_entered()
	# print("_on_area_2d_mouse_entered:",is_mouse_enter)
	pass # Replace with function body.


func _on_area_2d_mouse_exited() -> void:
	state_mechine.on_area_2d_mouse_exited()
	# print("_on_area_2d_mouse_entered:",is_mouse_enter)
	pass # Replace with function body.

func init_card(card_name:String=self.card_name) -> void:
	var img_name=AllCardMap.infosDic[card_name]['cardName'] 
	var img_path="res://control_demo_代码架构梳理后/assest/"+img_name+".png"
	$TextureRect.texture=load(img_path)
