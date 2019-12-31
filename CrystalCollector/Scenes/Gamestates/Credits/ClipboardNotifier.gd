extends PanelContainer

const visibleTime = 2
var t = 0

func appear():
	modulate.a = 1
	t = visibleTime


func _process(delta):
	if t > 0:
		t -= delta
		if t < 0:
			t = 0
	
	if modulate.a > 0 and t == 0:
		modulate.a -= delta
		if modulate.a < 0:
			modulate.a = 0
