extends Control
class_name Card
@export var card_name:String

func _physics_process(delta: float) -> void:
	var mouse_position =get_global_mouse_position()
	var nodes = get_tree().get_nodes_in_group("g_card_background")
	print(get_tree().get_groups())
	for node:Control in nodes:
		print(1)
		if node.get_global_rect().has_point(mouse_position):
			print(2)
			set_follow_target(node)

func init_card(card_name:String)-> Card:
	$CardCompont.init_card(card_name)
	return self
func set_follow_target(node:Node)->void:
	$DragCompont.follow_target=node
