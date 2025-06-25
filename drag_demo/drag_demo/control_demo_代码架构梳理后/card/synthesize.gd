extends Node


func _on_area_componet_sgl_synthesize() -> void:
	print("_on_area_componet_sgl_synthesize")
	var nodes=get_tree().get_nodes_in_group("g_synthesize")
	for node in nodes:
		node.get_parent().queue_free()
	pass # Replace with function body.
