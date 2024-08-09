extends Button

@onready var Pointer = $"/root/Node2D/HandleCookies/Pointer"
@onready var handlecookies = $"/root/Node2D/HandleCookies"
@onready var display = $"/root/Node2D/HandleCookies/Label"
@onready var pointercount = $"/root/Node2D/HandleCookies/Pointer/PointerCount"

var isfirstpurchase = true

var PointerAmt = 0
var Pointercost = 5
var PointerGenAmt = 0.1

func wait(seconds: float):
	await get_tree().create_timer(seconds).timeout

func getcookies():
	return handlecookies.cookies

func updatecookies(value):
	handlecookies.cookies = value
	display.text = "cookies: " + str(value)


func _ready():
	Pointer.pressed.connect(self.onpurchase)

func haspointer():
	while (PointerAmt > 0):
		var cookies = getcookies()
		cookies += (PointerAmt * (PointerGenAmt))
		updatecookies(cookies)
		await wait(1)



func onpurchase():
	var currentcc = getcookies()
	if (currentcc >= Pointercost):
		var cost = getcookies()
		cost -= Pointercost
		updatecookies(cost)
		PointerAmt += 1
		pointercount.text = "Current: " + str(PointerAmt) + "\nGenerating " + str(PointerAmt * PointerGenAmt) + " cookies per second"
		Pointercost += 5
		self.text = "pointer: " + str(Pointercost) + " cookies"
		if (isfirstpurchase):
			isfirstpurchase = false
			haspointer()
