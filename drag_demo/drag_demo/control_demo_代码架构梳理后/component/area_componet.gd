extends Node
class_name AreaComponet


var is_area_enter:bool=false
var is_mouse_enter:bool=false
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
	#if is_area_enter && is_mouse_enter && State.is_left_mouse_press_up:
	#if State.is_left_mouse_press_up:
		#print("sgl_synthesize_emit 1")
		#add_to_group("g_synthesize")
		#SignalBus.sgl_synthesize.emit($"../DragCompont".follow_target)
	pass

func _on_area_entered(area: Area2D) -> void:
	is_area_enter=true
	print("is_area_enter:",is_area_enter,self)
	print(is_area_enter,is_mouse_enter,State.is_left_mouse_press_up)
	pass # Replace with function body.


func _on_area_exited(area: Area2D) -> void:
	is_area_enter=false
	print("is_area_enter:",is_area_enter,self)
	pass # Replace with function body.


func _on_mouse_entered() -> void:
	is_mouse_enter=true
	print("is_mouse_enter:",is_mouse_enter,self)
	pass # Replace with function body.


func _on_mouse_exited() -> void:
	is_mouse_enter=false
	print("is_mouse_enter:",is_mouse_enter,self)
	pass # Replace with function body.
