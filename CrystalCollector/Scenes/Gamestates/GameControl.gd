extends Control

#UI nodes
onready var timerUI = get_node( "TimerPanel/TimerUI" )

var gamePlaying = true

#Timer for gameplay
var STtimer
#Max time in seconds
export var MaxTime = 180
var t = 0


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
