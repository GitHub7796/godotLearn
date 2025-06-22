extends Panel
class_name desk
@onready var cardDeck : Control = $cardDeck
@onready var cardPoiDeck:HBoxContainer = $ScrollContainer/cardPoiDeck

func _physics_process(delta: float) -> void:
	 #为什么要对节点 每帧进行排序
	#  因为 牌桌中 点击随便一张牌，后续得牌需要前移
	if cardDeck.get_child_count()!= 0:
		var children = cardDeck.get_children()
		sort_nodes_by_position(children)
func sort_nodes_by_position(children):
	children.sort_custom(sort_by_position)
	for i in range(children.size()): 
		#if children[i].cardCurrentState: 
			children[i].z_index = i
			cardDeck.move_child(children[i], i)

func sort_by_position(a, b):
	return a.get_position().x - b.get_position().x

func add_card(cardToAdd:card)->void:
	print("1",cardToAdd.size)
	var index = cardToAdd.z_index
	var cardBackgraoud = preload("res://8_card_demo/gridContanier_demo/card_background.tscn").instantiate()
	cardPoiDeck.add_child(cardBackgraoud)
# 调整卡牌位置
	if index <= cardPoiDeck.get_child_count():
		cardPoiDeck.move_child(cardBackgraoud,index)
	else:
		cardPoiDeck.move_child(cardBackgraoud,-1)
	print("cardBackgraoud position:",cardBackgraoud.global_position)
	# 卡牌从其他牌桌 移动过来 的情况
	if  cardToAdd.get_parent():
		cardToAdd.get_parent().remove_child(cardToAdd)
	print("cardDeck add before:",cardToAdd.global_position)
	print("2",cardToAdd.size)
	cardDeck.add_child(cardToAdd)
	cardToAdd.size=Vector2(240,340)
	print("3",cardToAdd.size)
	cardToAdd.global_position=Vector2(0,0)
	print("4",cardToAdd.size)
	print("cardDeck add after:",cardToAdd.global_position)
#  why？
	#var global_poi= cardToAdd.global_position
	#cardToAdd.global_position=global_poi
	print("Card position after add_card: ", cardToAdd.global_position)
	cardToAdd.follow_target=cardBackgraoud
	cardToAdd.preDeck = self
	print("5",cardToAdd.size)
	cardToAdd.cardCurrentState=cardToAdd.cardState.follwing
	cardToAdd.follow_target=cardBackgraoud
	cardToAdd.preDeck = self
	print("5",cardToAdd.size)
	cardToAdd.cardCurrentState=cardToAdd.cardState.follwing
