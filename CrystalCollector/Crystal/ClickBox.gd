extends Container

func _gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT:
			#print( "Woah, a click!" )
			get_parent().get_parent().CrystalAssign( get_parent() )