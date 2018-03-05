extends Container

# class member variables go here, for example:

var selected = false

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _gui_input(event):
	if event is InputEventMouseButton:
		print( "Woah, a click!" )
		selected = true