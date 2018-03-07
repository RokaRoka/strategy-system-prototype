extends StaticBody2D

var resourceAmount = 0

signal resource_gained( currentAmount )

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func addResource( toAdd ):
	resourceAmount += toAdd
	emit_signal( "resource_gained", resourceAmount )
