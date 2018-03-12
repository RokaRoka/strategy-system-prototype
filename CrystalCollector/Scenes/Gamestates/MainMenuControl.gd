extends Control

const GAME_SCENE_FILEPATH = "res://Scenes/Gamestates/Game.tscn"
const INSTRUCTIONS_SCENE_FILEPATH = "res://Scenes/Gamestates/Instructions.tscn"
#const CREDITS_SCENE_FILEPATH = "res://Scenes/Gamestates/Credits.tscn"

func _ready():
	get_tree().paused = false

func _on_PlayGame_button_down():
	get_tree().change_scene( GAME_SCENE_FILEPATH )


func _on_Instructions_button_down():
	get_tree().change_scene( INSTRUCTIONS_SCENE_FILEPATH )


func _on_Credits_button_down():
	pass # replace with function body


func _on_Quit_button_down():
	get_tree().quit()
