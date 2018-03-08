extends Panel

func _notification(what):
	if what == NOTIFICATION_MOUSE_EXIT:
		print( "Mouse exit upgrade panel!" )
		hide()