extends StaticBody2D

#	CONSTANT DATA
const RESOURCE_THRESHOLD = [200, 90, 0]

#sprite for each threshold
onready var crystalSprites = [get_node( "Crystal15" ), get_node( "Crystal5" ), get_node( "Crystal7" )]
onready var clickBox = get_node( "ClickBox" )

#	MEMBER DATA
var mineable = true
var resourceAmount = 300
var resourceThresholdIndex = 0


func setInactive():
	mineable = false
	clickBox.hide()

#	RESOURCE LOGIC

func checkResource():
	if resourceAmount <= RESOURCE_THRESHOLD[resourceThresholdIndex]:
		#make a sprite disappear
		crystalSprites[resourceThresholdIndex].hide()
		resourceThresholdIndex += 1

func mineResource(var amount):
	var resourceGained
	resourceAmount -= amount

	checkResource()
	if resourceAmount <= 0:
		#fix resource math
		resourceGained = amount + resourceAmount
		#set as inactive
		setInactive()
	else:
		resourceGained = amount
	
	return resourceGained