extends Button

@onready var Pointer = $"/root/Node2D/HandleCookies/Pointer"
@onready var handlecookies = $"/root/Node2D/HandleCookies"
@onready var display = $"/root/Node2D/HandleCookies/Label"
@onready var pointercount = $"/root/Node2D/HandleCookies/Pointer/PointerCount"

var isfirstpurchase = true

var PointerAmt = 0
var Pointercost = 5
var PointerGenAmt = 0.2

func wait(seconds: float):
	await get_tree().create_timer(seconds).timeout

func getcookies():
	return handlecookies.cookies

func _ready():
	Pointer.pressed.connect(self.onpurchase)

func haspointer():
	while (PointerAmt > 0):
		var cookies = getcookies()
		cookies += (PointerAmt * (PointerGenAmt))
		handlecookies.cookies = cookies
		await wait(1)

func updatecounttext():
	pointercount.text = "Current: " + str(PointerAmt) + "\nGenerating " + str(PointerAmt * PointerGenAmt) + " cookies per second"

func updateselftext():
	self.text = "pointer: " + str(Pointercost) + " cookies"

func onpurchase():
	var currentcc = getcookies()
	if (currentcc >= Pointercost):
		var cost = getcookies()
		cost -= Pointercost
		handlecookies.cookies = cost
		PointerAmt += 1
		updatecounttext()
		Pointercost += (Pointercost / PointerAmt) + PointerAmt
		updateselftext()
		if (isfirstpurchase) and (PointerAmt <= 1):
			isfirstpurchase = false
			haspointer()
