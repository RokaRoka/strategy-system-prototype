extends Label

const MINUTES_IN_SECOND = 60.0

var timeInMinutes = 0.0
var timeRemainder = 0.0

func updateText(newTime):
	timeInMinutes = floor(newTime / MINUTES_IN_SECOND)
	timeRemainder = int (fmod(newTime, MINUTES_IN_SECOND) * 100)
	
	text = String(timeInMinutes) + " : " + String(timeRemainder)
