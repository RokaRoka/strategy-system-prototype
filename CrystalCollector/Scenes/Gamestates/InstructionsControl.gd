extends Control

const MAINMENU_SCENE_FILEPATH = "res://Scenes/Gamestates/MainMenu.tscn"
const GAME_SCENE_FILEPATH = "res://Scenes/Gamestates/Game.tscn"


func _on_Back_button_down():
	get_tree().change_scene( MAINMENU_SCENE_FILEPATH )


func _on_Game_button_down():
	get_tree().change_scene( GAME_SCENE_FILEPATH )
