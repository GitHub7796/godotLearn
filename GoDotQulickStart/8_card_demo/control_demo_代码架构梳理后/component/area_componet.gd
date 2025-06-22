extends Node
class_name AreaComponet
signal sgl_synthesize

var is_area_enter:bool=false
var is_mouse_enter:bool=false
@export var card:Node
@onready var cardCompont:Node=get_node("../cardCompont")

func _physics_process(delta: float) -> void:
	if card:
	$CollisionShape2D.global_position=card.global_position+card.size/2
	handle_synthesize()

func handle_synthesize():
	if is_area_enter && is_mouse_enter:
		print("sgl_synthesize.emit")
		sgl_synthesize.emit()
	pass

func _on_area_entered(area: Area2D) -> void:
	print("area_enter",self)
	is_area_enter=true
	pass # Replace with function body.


func _on_area_exited(area: Area2D) -> void:
	is_area_enter=false
	pass # Replace with function body.


func _on_mouse_entered() -> void:
	print("mouse_enter",self)
	is_mouse_enter=true
	pass # Replace with function body.


func _on_mouse_exited() -> void:
	is_mouse_enter=false
	pass # Replace with function body.
