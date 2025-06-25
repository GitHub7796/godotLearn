extends Label
var num=0

func _on_test_signal_custom_new_add() -> void:
	num+=1
	text=str(num)
	pass # Replace with function body.
