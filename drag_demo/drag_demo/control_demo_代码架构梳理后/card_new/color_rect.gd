extends ColorRect
func _draw():
	# 获取ColorRect的尺寸
	var rect_size = get_size()
	
	# 绘制一个带圆角的填充矩形（使用当前ColorRect的颜色）
	draw_round_rect(Rect2(Vector2.ZERO, rect_size), 10.0, color)
