extends Button

signal  add


func _on_button_down() -> void:
	add.emit()
	pass # Replace with function body.
