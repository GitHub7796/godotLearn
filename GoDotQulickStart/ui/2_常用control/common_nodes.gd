extends Control


func _ready() -> void:
	$Tree.set_columns(3)
	var root = $Tree.create_item()
	var section = $Tree.create_item(root)
	section.set_text(0, 'Section 1')
	section.set_text(1, 'Stuff')
	section.set_text(2, 'Things')

func _on_line_edit_text_changed(new_text: String) -> void:
	$Label.text = new_text


func _on_button_pressed() -> void:
	print('button was pressed')


func _on_check_button_pressed() -> void:
	print('check button was pressed')


func _on_h_slider_value_changed(value: float) -> void:
	$TextureProgressBar.value = value
	$TextureProgressBarCircle.value = value
