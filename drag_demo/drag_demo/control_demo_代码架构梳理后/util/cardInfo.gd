extends Node

var file_path = "res://control_demo_代码架构梳理后/data/cards.csv"
var infosDic :Dictionary

func _init() -> void:
	infosDic=read_csv_as_nested_dict(file_path)

func read_csv_as_nested_dict(path:String) -> Dictionary:
	var data = {}
	var file = FileAccess.open(path,FileAccess.READ)
	var headers= []
	var first_head = true
	while not file.eof_reached():
		var values = file.get_csv_line()
		if first_head:
			headers = values
			first_head = false
#			读到最后一行， [""] size 为1
		elif values.size()>1:
#			第1列 即card英文名
			var key = values[0]
			var row_dict = {}
			for i in range(0,headers.size()):
				row_dict[headers[i]]=values[i]
			data[key]=row_dict
	file.close()
	return data
