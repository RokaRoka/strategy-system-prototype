extends Container

signal selected


func _gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			#print( "ClickBox" )
			emit_signal( "selected" )