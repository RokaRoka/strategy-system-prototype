extends Navigation2D

enum Job {
	NOTHING,
	WALK,
	MINE
}

signal job_walk(position)

#general data
#var currentJob = NOTHING
var navMeshInstance

var navMeshOutlineArray2 = [
	Vector2(0, 0),
	Vector2(1024, 0),
	Vector2(1024, 1024),
	Vector2(0, 1024)#, Vector2(0, 0)
	]

var navMeshPolyID = 0

#walking data
#var speed = 160.0
#var oldPos = Vector2(0, 0)
#var newPos = Vector2(0, 0)
#var destinationRadius = 8

#other
var debugColor = Color( 0.0, 0.1, 0.2 )

#	CALLBACKS

func _ready():
	#create temp nav mesh and child it
	navMeshInstance = createNavPolygon()
	add_child(navMeshInstance)
	

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			emit_signal( "job_walk", findPath( event.global_position ) )

func _draw():
	#if navMeshInstance:
		#draw debug lines
		#draw_polygon(navMeshInstance.navpoly.get_vertices(), PoolColorArray([debugColor, debugColor]))
	pass
	
func _exit_tree():
	removeNavInstance()

#	FOR UPDATE

#func performJob():
#	if currentJob == WALK:
#		walk(speed)

#	RELATED TO WALK

#func walk(var speed):
	#calculate direction
	#var direction = calculateWalkDirection(newPos)
	#get_parent().move_and_slide(direction * speed)
	#checkDestination()

#func calculateWalkDirection(var targetPosition):
	#var direction = targetPosition - global_position
	#return direction.normalized()

#func checkDestination():
	#if in small range of destination
	#if (global_position - newPos).length() < destinationRadius:
		#stop walking
	#	currentJob = NOTHING
	#	emit_signal( "job_done" )
#	RELATED TO MINE

# FOR NAVIGATION INITIALIZATION

func createNavPolygon():
	#assign instance and create the accociated nav polygon
	var tempNavPolyNode = NavigationPolygonInstance.new()
	tempNavPolyNode.navpoly = NavigationPolygon.new()
	var tempNavPoly = tempNavPolyNode.navpoly
	
	if tempNavPolyNode.enabled:
		print("Temp nav poly enabled!")
		print(tempNavPoly.get_outline_count())
	
	#add navmesh outlines
	#for outline in navMeshOutlines:
	#	tempNavPoly.add_outline(outline)
	
	tempNavPoly.add_outline(navMeshOutlineArray2)
	
	#create polygon
	#tempNavPoly.add_polygon(PoolIntArray([0]))
	
	#create polygon
	tempNavPoly.make_polygons_from_outlines()
	
	print("Outline count "+String(tempNavPoly.get_outline(0)))
	print("Polygon count"+String(tempNavPoly.get_polygon_count()))
	print("Polygon vertices"+String(tempNavPoly.get_vertices()))
	
	navMeshPolyID = navpoly_add(tempNavPoly, Transform2D( 0, Vector2(0, 0) ) )
	
	update()
	
	return tempNavPolyNode

func removeNavInstance():
	navpoly_remove( navMeshPolyID )
	navMeshInstance.free()

#	TO BE CALLED FROM MAIN UNIT

func findPath(var newPosition):
	NavigationPolygonInstance.new()
	var newPos = get_closest_point(newPosition)
	
	print("Going to "+String(newPos))
	
	return newPos
