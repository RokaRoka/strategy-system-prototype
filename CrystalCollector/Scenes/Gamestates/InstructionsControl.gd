extends Control

const MAINMENU_SCENE_FILEPATH = "res://Scenes/Gamestates/MainMenu.tscn"
const GAME_SCENE_FILEPATH = "res://Scenes/Gamestates/Game.tscn"

onready var pageUI = get_node( "MarginContainer/VBoxContainer/HBoxContainer2/PageUI" )

#page 1
onready var page1 = get_node( "MarginContainer/VBoxContainer/PanelContainer/GoalTextureRect" )
#page 2
onready var page2 = get_node( "MarginContainer/VBoxContainer/PanelContainer/HBoxContainer" )

#member vars
var currentPage = 1
const PAGE_AMOUNT = 2


func loadPage(var index):
	#change page UI to match new page
	pageUI.text = String(currentPage) + " / " + String( PAGE_AMOUNT )
	
	match(index):
		1:
			page2.hide()
			page1.show()
			#page1.set_anchors_preset( PRESET_WIDE )
		2:
			page1.hide()
			page2.show()
			#page2.set_anchors_preset( PRESET_WIDE )


func _on_Back_button_down():
	get_tree().change_scene( MAINMENU_SCENE_FILEPATH )


func _on_Game_button_down():
	get_tree().change_scene( GAME_SCENE_FILEPATH )


func _on_Next_button_down():
	currentPage += 1
	if currentPage > PAGE_AMOUNT:
		currentPage = 1
	
	loadPage( currentPage )
