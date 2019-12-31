extends MarginContainer

const MAINMENU_SCENE_FILEPATH = "res://Scenes/Gamestates/MainMenu.tscn"


func _on_Back_button_down():
	get_tree().change_scene( MAINMENU_SCENE_FILEPATH )
