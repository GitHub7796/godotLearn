extends Node2D

func _ready() -> void:
	var card1=load("res://control_demo_代码架构梳理后/card_new/card_new.tscn").instantiate()
	card1.init_card("Ice")
	var card2=load("res://control_demo_代码架构梳理后/card_new/card_new.tscn").instantiate()
	card2.init_card("Stone")
	var background=$GridComponet.get_child(0)
	var background1=$GridComponet.get_child(1)
	$Control.add_child(card1)
	$Control.add_child(card2)
	card1.follow_target=background
	card2.follow_target=background1
	SignalBus.sgl_synthesize.connect(add_card)
func add_card(follow_target:Node):
	var nodes=get_tree().get_nodes_in_group("g_synthesize")
	for node in nodes:
		node.queue_free()
	var card=load("res://control_demo_代码架构梳理后/card_new/card_new.tscn").instantiate()
	card.init_card("Silicon_ore")
	$Control.add_child(card)
	card.follow_target=follow_target
