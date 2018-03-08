extends Control

#UI nodes
onready var timerUI = get_node( "TimerPanel/TimerUI" )
onready var resourceUI = get_node( "ResourcePanel/ResourcesUI" )

#win state
onready var winScreen = get_node( "WinScreen" )
onready var medalGoldNode = get_node( "WinScreen/ResultsPanel/MarginContainer/VBoxContainer/HBoxContainer/BronzeMedalTexture" )
onready var medalSilverNode = get_node( "WinScreen/ResultsPanel/MarginContainer/VBoxContainer/HBoxContainer/SilverMedalTexture" )
onready var medalBronzeNode = get_node( "WinScreen/ResultsPanel/MarginContainer/VBoxContainer/HBoxContainer/GoldMedalTexture" )


onready var medalTitleNode = get_node( "WinScreen/ResultsPanel/MarginContainer/VBoxContainer/MedalTitle" )
onready var resourceResult = get_node( "WinScreen/ResultsPanel/MarginContainer/VBoxContainer/ResourceResult" )

var gamePlaying = true

#Timer for gameplay
var STtimer
#Max time in seconds
export var MaxTime = 120
var t = 0

#medal amounts
const MEDAL_THRESHOLD_GOLD = 720
const MEDAL_THRESHOLD_SILVER = 360
const MEDAL_THRESHOLD_BRONZE = 90

func _ready():
	#start timer
	STtimer = get_tree().create_timer( MaxTime, true)
	STtimer.connect( "timeout", self, "_on_timeout" )
	timerUI.updateText( STtimer.time_left )


func _process( dt ):
	#check if it's necessary to update time left
	if gamePlaying and not get_tree().paused:
		t += dt
		if t > 1:
			t -= 1
			timerUI.updateText( STtimer.time_left )


func _on_timeout():
	#pause game and pop up results
	get_tree().paused = true
	updateResults()

func updateResults():
	#show results
	winScreen.show()
	#handle medals
	var resourcesFinal = int( resourceUI.text )
	#first, update resources
	resourceResult.text = resourceResult.text + String(resourcesFinal)
	
	if resourcesFinal < MEDAL_THRESHOLD_BRONZE:
		#sad  :(
		medalTitleNode = "NO MEDAL..."
	elif resourcesFinal < MEDAL_THRESHOLD_SILVER:
		#ok
		medalTitleNode = "BRONZE MEDAL."
		medalBronzeNode.show()
	elif resourcesFinal < MEDAL_THRESHOLD_GOLD:
		#hey, nice
		medalTitleNode = "SILVER MEDAL!"
		medalSilverNode.show()
	else:
		#woah :O
		medalTitleNode = "GOLD MEDAL!!!"
		medalGoldNode.show()


func _on_MainMenu_button_down():
	get_tree().change_scene( "res://Scenes/Gamestates/MainMenu.tscn" )
