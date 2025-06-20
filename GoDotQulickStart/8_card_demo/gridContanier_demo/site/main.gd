extends Control

@export var scene_1:Node
@export var scene_2:Node
@export var scene_3:Node

@export var maxRandomItemNum:int
@export var minRdndomItemNum:int
@export var siteItems:Dictionary

func add_new_card(cardName,cardDeck,caller=scene_1)->Node:
	var cardClass = CardInfos.infosDic[cardName]["base_cardClass"]
	var cardToAdd:card
	cardToAdd=preload("res://8_card_demo/gridContanier_demo/card.tscn").instantiate()
	cardToAdd.initCard(cardName)
	cardToAdd.global_position=caller.global_position
	cardToAdd.z_index=100
	cardDeck.add_card(cardToAdd)
	return cardToAdd
func get_some_card():
	var num_cards = randi() % (maxRandomItemNum - minRdndomItemNum +1 ) + minRdndomItemNum
	var total_weight = get_total_weight(siteItems)
	var selected_cards =[]
	for i in range(num_cards):
#		randi() % 20      # 返回介于 0 到 19之间的随机整数
		var random_num = randi() % total_weight
		var cumulative_weight = 0
		for c in siteItems.keys():
			cumulative_weight += siteItems[c]
			if  random_num < cumulative_weight:
				selected_cards.append(c)
				break
		for c in selected_cards:
			# 性能优化技巧：一次性创建并添加大量卡牌或许会给系统带来较大的性能压力
			# 游戏里，若一次性添加所有选中的卡牌，玩家可能难以看清每张卡牌的添加过程。借助 0.1 秒的延迟，卡牌会逐个添加，能产生更流畅、更具观赏性的视觉效果
			await  get_tree().create_timer(0.1).timeout
			add_new_card(c,scene_3,scene_1)

func  get_total_weight(card_dict):
	var total_weight = 0
	for weight in card_dict.values():
		total_weight+=weight
	return total_weight
