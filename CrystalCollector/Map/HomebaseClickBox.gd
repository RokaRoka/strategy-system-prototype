extends Container

const UPGRADE_UNIT_COST = 15
const UPGRADE_SPEED_COST = 30
const UPGRADE_GATHER_COST = 30

onready var upgradePanel = get_node( "UpgradePanel" )

var mousePosition = Vector2(0, 0)

func _ready():
	#stuff
	connect( "mouse_entered", self, "on_mouse_enter")
	connect( "mouse_exited", self, "on_mouse_exit")

func _gui_input(event):
	if event is InputEventMouseMotion and upgradePanel.is_visible_in_tree():
		mousePosition = event.position

func on_mouse_enter():
	upgradePanel.show()

func on_mouse_exit():
	var topLeft = rect_position
	#if mousePosition.x < topLeft.x or mousePosition.x > topLeft.x + get_rect().size.x:
	#	if mousePosition.y < topLeft.y or mousePosition.y > topLeft.y + get_rect().size.y:
	if upgradePanel.is_visible_in_tree():
		upgradePanel.hide()
	

func _on_AddUnit_mouse_entered():
	upgradePanel.show()


func _on_UpSpeed_mouse_entered():
	upgradePanel.show()


func _on_UpGather_mouse_entered():
	upgradePanel.show()


func _on_AddUnit_button_down():
	#check resources
	if get_parent().checkResource(UPGRADE_UNIT_COST):
		get_parent().subtractResource(UPGRADE_UNIT_COST)
		get_parent().emit_signal( "add_unit_fulfilled", get_parent().position + Vector2(-224, -16) )
