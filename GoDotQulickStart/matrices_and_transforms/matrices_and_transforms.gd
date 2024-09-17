extends Sprite2D

var speed = 40
var angular_speed = PI

func _process(delta):
	var t = Transform2D()
	# Translation
	t.origin=Vector2(350,500)
	# Rotation
	var rot = -0.5
	#t.x.x=cos(rot)
	#t.x.y=sin(rot)
	#t.y.x=-sin(rot)
	#t.y.y=cos(rot)
	t=t.rotated(rot)
	# Scale
	t.x *=3
	t.y *=3
	transform = t # Change the node's transform to what we calculated.
