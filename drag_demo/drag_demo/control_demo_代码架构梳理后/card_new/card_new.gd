extends Control
class_name Card
@export var follow_target:Node
var is_button_down:bool=false
var is_area_enter:bool=false
var is_mouse_enter:bool=false
var whichBackgroundMouseIn:Control
func _on_button_button_down() -> void:
	is_button_down=true
	print("is_button_down:",is_button_down)
	pass # Replace with function body.

func _on_button_button_up() -> void:
	if is_button_down && is_area_enter:
		SignalBus.sgl_synthesize.emit(whichBackgroundMouseIn)
	is_button_down=false
	follow_target=whichBackgroundMouseIn
	print("is_button_down:",is_button_down)
	pass # Replace with function body.


func _on_area_2d_area_entered(area: Area2D) -> void:
	is_area_enter=true
	add_to_group("g_synthesize")
	print("_on_area_2d_area_entered:",is_area_enter)
	pass # Replace with function body.


func _on_area_2d_area_exited(area: Area2D) -> void:
	is_area_enter=false
	remove_from_group("g_synthesize")
	print("_on_area_2d_area_entered:",is_area_enter)
	pass # Replace with function body.


func _on_area_2d_mouse_entered() -> void:
	is_mouse_enter=true
	print("_on_area_2d_mouse_entered:",is_mouse_enter)
	pass # Replace with function body.


func _on_area_2d_mouse_exited() -> void:
	is_mouse_enter=false
	print("_on_area_2d_mouse_entered:",is_mouse_enter)
	pass # Replace with function body.

func init_card(card_name:String=self.card_name) -> void:
	var img_name=AllCardMap.infosDic[card_name]['cardName'] 
	var img_path="res://control_demo_代码架构梳理后/assest/"+img_name+".png"
	$TextureRect.texture=load(img_path)
