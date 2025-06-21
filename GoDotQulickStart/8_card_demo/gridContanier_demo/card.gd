extends Control
class_name card

enum cardState{follwing,dragging}

@export var cardCurrentState = cardState.follwing
@export var follow_target:Node
@export var cardInfo:Dictionary
@export var cardWeight:float
@export var cardClass:String
@export var cardName:String
@export var cardStackNum:int
@export var pickButton:Button

var preDeck : Node
var velocity = Vector2.ZERO
var damping = 0.35
var stiffness = 500
var whichDeckMouseIn:desk
func _process(delta: float) -> void:
	match cardCurrentState:
		cardState.dragging:
			# 使用全局鼠标位置计算
			var target_position = get_global_mouse_position() - size/2
			global_position = global_position.lerp(target_position, 0.4)
			
			var mouse_postion = get_global_mouse_position()
			var nodes = get_tree().get_nodes_in_group("cardDropable")
			for node:Control in nodes:
				if node.get_global_rect().has_point(mouse_postion):
					whichDeckMouseIn = node 
		cardState.follwing:
			var target_position
			if follow_target:
				target_position=follow_target.global_position
			else:
				target_position=Vector2(0,0)
			var displacement = target_position-global_position
			var force = displacement * stiffness
			velocity += force*delta
			velocity *=(1.0-damping)
			global_position += velocity*delta


func _on_button_button_down() -> void:
	cardCurrentState=cardState.dragging
	if follow_target!=null:
		follow_target.queue_free()
	pass # Replace with function body.


func _on_button_button_up() -> void:
	if whichDeckMouseIn!=null:
		whichDeckMouseIn.add_card(self)
	else:
		preDeck.add_card(self)
	cardCurrentState=cardState.follwing
	pass # Replace with function body.


func initCard(Nm)->void:
	cardInfo = CardInfos.infosDic[Nm]
	cardWeight=float(cardInfo["base_cardWeight"])
	cardClass=cardInfo["base_cardClass"]
	cardName=cardInfo["base_cardName"]
	cardStackNum=int(cardInfo["base_maxStack"])
	cardCurrentState=cardState.follwing
	drawCard()
	print("Card position after initCard: ", global_position)
func drawCard()->void:
	pickButton=$Control/Button
	var imgPath="res://8_card_demo/gridContanier_demo/assest/"+str(cardName)+".png"
	$Control/TextureRect.texture=load(imgPath)
	$Control/Label.text=cardInfo["base_displayName"]
