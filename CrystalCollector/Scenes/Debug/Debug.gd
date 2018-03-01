extends Control

var mousePos = Vector2(0, 0)
var radius = 8
var debugColor = Color(0.1, 0.1, 0.1)

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _gui_input(event):
	if event is InputEventMouseButton:
		mousePos = event.global_position
		print(mousePos)

func _draw():
	draw_circle( mousePos, 8, debugColor)