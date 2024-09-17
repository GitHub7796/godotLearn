extends Node2D
func  _process(delta: float) -> void:
	#position.x+=1
	queue_redraw()
func _draw() -> void:
#	绘制圆
	draw_circle(
	Vector2(50,50) # 绘制位置
	,80 # 圆形半径
	,Color.BLUE # 绘制颜色
	,true # 是否填充内部
	)
#	绘制矩形
	draw_rect(
		Rect2(50,50,150,150) #Rect2 2D矩形, 
		,Color.RED  # 绘制颜色
		,false # 是否填充内部
	)
#	绘制纹理
	var texture:Texture2D=load("./icon.svg") 
	draw_texture(
		texture
		,Vector2(320,240) # 绘制位置
		,Color.RED  # 混和颜色
	)
#	在某个区域绘制纹理
# 通过 CanvasItem 的 get_local_mouse_position()
# 获取鼠标相对于 当前CanvasItem 的位置
	var end:Vector2=get_local_mouse_position()
#	获取全局鼠标位置
	#var end:Vector2=get_global_mouse_position()
	draw_texture_rect(
		texture
		,Rect2(Vector2.ZERO,end) # 绘制位置
		,false # 纹理是否重复
		,Color.YELLOW  # 混和颜色
	)
#	画线条
	draw_line(
		Vector2(0,50) # 起始位置
		,get_global_mouse_position()  # 结束位置
		,Color.YELLOW  # 颜色
		,10 # 线条宽度
	)
#	画多边形
	draw_polygon(
		PackedVector2Array([
			Vector2(350,320),
			Vector2(290,400),
			Vector2(350,400),
		]),
		PackedColorArray([
			Color.RED,
			Color.YELLOW,
			Color.BLACK,
		])
	)
#	绘制一条线
	draw_polyline(
		PackedVector2Array([
		Vector2(350,320),
		Vector2(290,4000),
		]),
		Color.AQUA
	)
#	绘制文字
	draw_string(
		ThemeDB.fallback_font, # 字体类型
		Vector2(60,300), #绘制位置
		"ABCDEFGHIGKLMN",#绘制位置
		HORIZONTAL_ALIGNMENT_CENTER,
		100,#宽度,超过会被裁剪
		24, # 字体大小
	)
