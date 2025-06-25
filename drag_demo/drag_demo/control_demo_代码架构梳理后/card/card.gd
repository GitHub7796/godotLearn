extends Control
class_name Card
@export var card_name:String
@export var follow_target:Node
signal sgl_card_move2target(node:Node)
func _ready() -> void:
	if follow_target:
		$DragCompont.follow_target=follow_target
func init_card(card_name:String)-> Card:
	$CardCompont.init_card(card_name)
	return self
func set_follow_target(node:Node)->void:
	$DragCompont.follow_target=node
