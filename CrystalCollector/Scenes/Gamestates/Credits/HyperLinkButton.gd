extends LinkButton

export var link = ""

onready var clipboardNotifNode = get_node( "../../../../../../ClipboardNotifier" )

func _ready():
	connect( "button_down", self, "_on_button_down" )
	pass

func _on_button_down():
	OS.clipboard = link
	notifyUser()


func notifyUser():
	clipboardNotifNode.appear()