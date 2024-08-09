extends Area2D

@onready var display = $"/root/Node2D/HandleCookies/Label"
@onready var handlecookies = $"/root/Node2D/HandleCookies"
@onready var Pointer = $"/root/Node2D/HandleCookies/Pointer"

func getpointeramnt():
	return Pointer.PointerAmt


func getcookies():
	return handlecookies.cookies
	
func updatecookies(value):
	handlecookies.cookies = value
	display.text = "cookies: " + str(value)

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		self.on_click()

func on_click():
	var newamnt = getcookies()
	newamnt += 1
	updatecookies(newamnt)
