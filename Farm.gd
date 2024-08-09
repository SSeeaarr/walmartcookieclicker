extends Button

@onready var Farm = $"/root/Node2D/HandleCookies/Farm"
@onready var handlecookies = $"/root/Node2D/HandleCookies"
@onready var display = $"/root/Node2D/HandleCookies/Label"
@onready var FarmCount = $"/root/Node2D/HandleCookies/Farm/FarmCount"

var isfirstpurchase = true

var FarmAmt = 0
var Farmcost = 500
var FarmGenAmt = 10

func wait(seconds: float):
	await get_tree().create_timer(seconds).timeout

func getcookies():
	return handlecookies.cookies

func updatecookies(value):
	handlecookies.cookies = value
	display.text = "cookies: " + str(value)


func _ready():
	Farm.pressed.connect(self.onpurchase)

func haspointer():
	while (FarmAmt > 0):
		var cookies = getcookies()
		cookies += (FarmAmt * (FarmGenAmt))
		updatecookies(cookies)
		await wait(1)



func onpurchase():
	var currentcc = getcookies()
	if (currentcc >= Farmcost):
		var cost = getcookies()
		cost -= Farmcost
		updatecookies(cost)
		FarmAmt += 1
		FarmCount.text = "Current: " + str(FarmAmt) + "\nGenerating " + str(FarmAmt * FarmGenAmt) + " cookies per second"
		Farmcost += 5
		self.text = "farm: " + str(Farmcost) + " cookies"
		if (isfirstpurchase):
			isfirstpurchase = false
			haspointer()
