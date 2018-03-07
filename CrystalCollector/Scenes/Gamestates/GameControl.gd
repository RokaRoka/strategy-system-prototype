extends Control

#UI nodes
onready var timerUI = get_node( "TimerPanel/TimerUI" )

#Timer for gameplay
var STtimer
#Max time in seconds
export var MaxTime = 200
var t = 0


func _ready():
	#start timer
	STtimer = get_tree().create_timer( MaxTime, true)
	STtimer.connect( "timeout", self, "_on_timeout" )

func _process( dt ):
	#check to update time left
	t += dt
	if t > 1:
		t -= 1
		timerUI.updateText( STtimer.time_left )

func _on_timeout():
	#pause game and pop up results
	pass