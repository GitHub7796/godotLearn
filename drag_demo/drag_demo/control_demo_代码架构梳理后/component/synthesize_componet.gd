extends Node
class_name synthesize_componet

func synthesize():
	var cardlst=get_tree().get_nodes_in_group("synthesize_card")
	for card in cardlst:
		card.queue_free()
	#return preload()
	pass
