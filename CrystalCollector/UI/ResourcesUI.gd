extends Label

func _on_Homebase_resource_gained(currentAmount):
	text = String(currentAmount)


func _on_Homebase_resource_lost(currentAmount):
	text = String(currentAmount)
