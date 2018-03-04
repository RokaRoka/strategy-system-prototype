extends StaticBody2D

#	CONSTANT DATA
const RESOURCE_THRESHOLD = [500, 400, 300, 200, 100, 0]

#sprite for each threshold
#const RESOURCE_SPRITES = []

#	MEMBER DATA
var resourceAmount = 500
var resourceThresholdIndex = 0

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#	RESOURCE LOGIC

func mineResource(var miner):
	#TODO if miner is a Unit
	#	resourceAmount -= miner.mineStrength
	#	return miner.mineStrength
	pass
