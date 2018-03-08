extends StaticBody2D

var resourceAmount = 0

signal resource_gained( currentAmount )
signal resource_lost( currentAmount )

signal add_unit_fulfilled( targetPosition )
signal up_speed_fulfilled()
signal up_gather_fulfilled()

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func addResource( toAdd ):
	resourceAmount += toAdd
	emit_signal( "resource_gained", resourceAmount )

func subtractResource( toSub ):
	resourceAmount -= toSub
	emit_signal("resource_lost", resourceAmount )

func checkResource( toLose ):
	if toLose <= resourceAmount:
		return true
	return false