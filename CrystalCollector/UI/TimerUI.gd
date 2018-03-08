extends Label

const MINUTES_IN_SECOND = 60

var timeInMinutes = 0.0
var timeRemainder = 0.0

func updateText(newTime):
	timeInMinutes = floor(newTime / MINUTES_IN_SECOND)
	timeRemainder = int (floor(newTime)) % MINUTES_IN_SECOND
	
	if timeRemainder < 10:
		text = String(timeInMinutes) + " : 0" + String(timeRemainder)
	else:
		text = String(timeInMinutes) + " : " + String(timeRemainder)	
