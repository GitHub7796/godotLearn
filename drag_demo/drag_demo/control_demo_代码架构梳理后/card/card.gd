extends Control
class_name Card
@export var card_name:String
signal sgl_card_move2target(node:Node)

func init_card(card_name:String)-> Card:
	$CardCompont.init_card(card_name)
	return self
func set_follow_target(node:Node)->void:
	$DragCompont.follow_target=node
