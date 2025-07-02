extends Node
class_name Card_State_Mechine
@export var init_state:Card_State
var current_state:Card_State
var card_state_dict:Dictionary={}
func _ready() -> void:
	for child in get_children():
		if child is Card_State:
			card_state_dict[child.name.to_lower()] = child
			child.sgl_transition.connect(child_state_transition)
	if init_state:
		init_state.enter()
		current_state=init_state
func _process(delta: float) -> void:
	if current_state:
		current_state.update(delta)
func _physics_process(delta: float) -> void:
	if current_state:
		current_state.pysics_update(delta)
func start(new_state_name:String):
	child_state_transition(null,new_state_name)
func child_state_transition(state,new_state_name:String):
	if state!=current_state:
		return
	var new_state = card_state_dict.get(new_state_name.to_lower())
	if !new_state:
		return
	if current_state:
		current_state.exit()
		new_state.previous_state=current_state.name.to_lower()
	new_state.enter()
	current_state=new_state
func _on_button_button_down() -> void:
	current_state.on_button_down()

func on_button_button_down() -> void:
	current_state.on_button_button_down()
	pass # Replace with function body.

func on_button_button_up() -> void:
	current_state.on_button_button_up()
	pass # Replace with function body.

func on_area_2d_area_entered(area: Area2D) -> void:
	current_state.on_area_2d_area_entered(area)
	pass # Replace with function body.

func on_area_2d_area_exited(area: Area2D) -> void:
	current_state.on_area_2d_area_exited(area)
	pass # Replace with function body.

func on_area_2d_mouse_entered() -> void:
	current_state.on_area_2d_mouse_entered()
	pass # Replace with function body.

func on_area_2d_mouse_exited() -> void:
	current_state.on_area_2d_mouse_exited()
	pass # Replace with function body.
