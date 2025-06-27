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
		current_state._process(delta)
func _physics_process(delta: float) -> void:
	if current_state:
		current_state._physics_process(delta)
func child_state_transition(state,new_state_name:String):
	if state!=current_state:
		return
	var new_state = card_state_dict.get(new_state_name.to_lower())
	if !new_state:
		return
	if current_state:
		current_state.exit()
	new_state.enter()
	current_state=new_state
