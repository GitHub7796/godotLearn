extends Control

@onready var hboxContanier = $HBoxContainer
@onready var contorl = $Control

func _on_button_button_down() -> void:
	var card = preload("res://ui/嵌套/control.tscn").instantiate()
	var pannel  = preload("res://ui/嵌套/pannel.tscn").instantiate()
	print($".".global_position)
	print($HBoxContainer.global_position)
	print($Button.global_position)
	print($Control.global_position)
	
	hboxContanier.add_child(card)
	print(card.global_position)
	pannel.follow_target=card
	card.add_child(pannel)
	pannel.global_position=Vector2(0,0)
	
	
	pass # Replace with function body.
